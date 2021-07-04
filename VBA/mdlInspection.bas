Attribute VB_Name = "mdlInspection"
Option Compare Database
Option Explicit

Private mReturnValue As Variant
Private mOpenArgs As String


' dbo_Global
Private vNumOfLevels As Integer
Private vDefLevelNum As Integer
Private vDefStartLevel As Integer
Private vInspectOrderInterval As Integer

' *****************************************************************************
' STAT PARAMS
' *****************************************************************************
Private ErrCount As Long
Private WarnCount As Long
Private TotCount As Long
Private ReadyToProcess As Long
Private SkipWIPCount As Long
Private NewCustCount As Long
Private NewInspectOrderCount As Long

Const CallerID As Integer = 1
Const ModuleName As String = "Inspection"


Public Property Get ReturnValue() As Variant
    ReturnValue = mReturnValue
End Property

Public Property Let ReturnValue(X As Variant)
    mReturnValue = X
End Property

' *******************************
' R E L A T I V E
' *******************************
Private Sub RelativeProc(ByRef cls As clsInspectOrder)
    Dim WarnState As Integer
    Dim ErrState As Integer
    Dim aLevel As Integer
    Dim aNextRequestedDT As Date
    Dim aSiteSeedLevel As Integer
    Dim aCode As String
    Dim aCompanyInfoID As Long

    
    WarnState = 0
    ErrState = 0
    
    aCode = mdlCompany.GetCompanyCode
    aCompanyInfoID = mdlCompany.GetCompanyInfoID

    ' this routine checks for
        ' NEW CUSTOMER
        ' Use the seeddate and seedlevel in the inspection order for the NextRequestedDT
        ' id a start level isn't found then global is used ...
        ' CalcNextInspection(ByRef ErrState As Integer, ByRef WarnState As Integer, ByRef aLevelNum As Integer, Optional DoPostErr As Boolean = True)
        '
        '
    ' DoReSeed,
            ' User has requested a reseed of the inspection request date.
            ' (Done when the user re-enabled the customer site link.)
        '
        '
    ' Customer with at least one inspection order ...
    
    aNextRequestedDT = cls.CalcNextInspection(ErrState, WarnState, aSiteSeedLevel, True)
    If (ErrState = 0) Then
        ' ****************************************************************************
        ' BUILD AN INSPECTION ORDER FOR THE CUSTSITE ....
        CreateInspectionOrder cls.CustSiteID, aNextRequestedDT, aSiteSeedLevel
        If cls.IsNewCustomer Then
            NewCustCount = NewCustCount + 1
        End If
        NewInspectOrderCount = NewInspectOrderCount + 1
        ' ***************************************************************************
    End If
    
    If ErrState > 0 Then
        cls.DisableCustSite
        ' send an error message to log?
        mdlLog.AppendLog aCode & " - CUSTOMER SITE WAS DISABLED!!!!!", _
                         "The customer site LINK ID: " & CStr(cls.CustSiteID) & " was DISABLED." & _
                         vbCrLf & "Re-enable and RE-SEED this LINK to fix the error!" & _
                         vbCrLf & "(A valid date is needed to 'seed' the inspection order.)", _
                         CallerID, 4, aCompanyInfoID
        
    End If
    
    ' ASSERT - CLEAR the reseed flag - even on errors
    ' ******************************
    cls.ClearDoReseed
    ' ******************************
    
    If ErrState > 0 Then
        ErrCount = ErrCount + 1
    End If
    If WarnState > 0 Then
        WarnState = WarnState + 1
    End If

End Sub


Public Sub UpdateInspectionOrders()
    Dim strSQL As String
    Dim db As Database
    Dim rs As Recordset
    Dim msg As String
    Dim aOpenArgs As String
    Dim SiteEnabledCount As Long
    Dim SiteDisabledCount As Long
        
    On Error GoTo PROC_ERR
    
    Dim cls As New clsInspectOrder
    
    ErrCount = 0
    WarnCount = 0
    TotCount = 0
    ReadyToProcess = 0
    SkipWIPCount = 0
    NewCustCount = 0
    SiteEnabledCount = 0
    SiteDisabledCount = 0
    NewInspectOrderCount = 0
    
    
    strSQL = _
           "SELECT dbo_CustSite.CustSiteID, dbo_CustSite.CustomerID, dbo_CustSite.SiteID, " & _
           "dbo_CustSite.CreatedOn, dbo_CustSite.IsArchived, dbo_CustSite.IsEnabled " & _
           "FROM dbo_CustSite ORDER BY dbo_CustSite.CreatedOn DESC;"
        
    
    Set db = CurrentDb
    Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rs.RecordCount > 0 Then
        rs.MoveLast
        TotCount = rs.RecordCount
        'rs.MoveFirst
        With rs
            .MoveFirst
            Do Until .EOF
                If (!IsEnabled = True) Then
                    ' ENABLED CustSite.
                    ' ----------------------------------------
                    ' inc count for enabled customer sites
                    SiteEnabledCount = SiteEnabledCount + 1
                    ' initialize inspection order class - routine finds the last inspection order
                    cls.AssignParam (![CustSiteID])
                    
                    If cls.IsNewCustomer Then
                        ' no inspection order history - use seed data to create new inspection order.
                        ReadyToProcess = ReadyToProcess + 1
                        
                        ' ASSERT DORESEED FOR NEW CUSTOMERS
                        ' **********************************
                        ' cls.DoReseed = True
                        ' **********************************
                        
                        RelativeProc cls
                    Else
                        ' previous order must be cancelled or completed to proceed
                        If cls.InspectionStatusID = 2 Or cls.InspectionStatusID = 3 Then
                            ReadyToProcess = ReadyToProcess + 1
                            ' -----------------------------------------------------
                            RelativeProc cls
                            ' -----------------------------------------------------
                        Else
                            ' WORK-IN-PROGRESS CustSite.
                            ' ----------------------------------------
                            SkipWIPCount = SkipWIPCount + 1
                        End If
                    End If
                    
                Else
                    ' DISBALED CustSite.
                    ' ----------------------------------------
                    SiteDisabledCount = SiteDisabledCount + 1
                End If                           'end IsEnabled
                .MoveNext
            Loop
        End With
    End If                                       'end records > 0
    
    ' display the STAT DIALOGUE
    
    aOpenArgs = CStr(TotCount) & "|" & CStr(SiteDisabledCount) & "|" & CStr(SiteEnabledCount) & "|" & CStr(ReadyToProcess) & "|" & _
    CStr(NewCustCount) & "|" & CStr(NewInspectOrderCount) & "|" & CStr(ErrCount) & "|" & CStr(SkipWIPCount) & "|" & CStr(WarnCount)
     
    DoCmd.OpenForm "xDlgInspect_UpdateStat", , , , , acDialog, aOpenArgs
    DoCmd.Close acForm, "xDlgInspect_UpdateStat"
    

    
PROC_EXIT:
    
    'Cleanup
    Set rs = Nothing
    Set db = Nothing
    Set cls = Nothing
    
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " UpdateInspectionOrders" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
End Sub

Public Sub CancelOutstandingInspectionOrders(aCustSiteID)
    Dim strSQL As String
    Dim db As Database
    Dim rs As Recordset
    Dim msg As String
    ' cancel all outstanding customer inspection orders for the site.
    ' used when disabling a site ...
    
    On Error GoTo PROC_ERR
    
    strSQL = _
           "SELECT dbo_InspectionOrder.CustSiteID, dbo_InspectionOrder.InspectionStatusID " & _
           "FROM dbo_InspectionOrder " & _
           "WHERE (((dbo_InspectionOrder.CustSiteID)=" & CStr(aCustSiteID) & _
           ") AND ((dbo_InspectionOrder.InspectionStatusID)<>2 Or (dbo_InspectionOrder.InspectionStatusID)<>3));"
    
    Set db = CurrentDb
    Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rs.RecordCount > 0 Then
        rs.MoveFirst
        Do Until rs.EOF
            rs.Edit
            rs![InspectionStatusID] = 3 ' CANCELLED
            rs.Update
        
            rs.MoveNext
        Loop
    End If
    
    
PROC_EXIT:
    
    'Cleanup
    Set rs = Nothing
    Set db = Nothing

    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " CancelOutstandingInspectionOrders" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
End Sub

Public Sub promptViewLog()
    Dim CompanyCodeStr As String
    
    CompanyCodeStr = mdlCompany.GetCompanyCode()

    MsgBox "Update Inspection Orders reported errors!" & _
           vbCrLf & "View the 'System Log' for details.", _
           vbOKOnly Or vbExclamation Or vbDefaultButton1, _
           CompanyCodeStr & " - ERRORS during update."

End Sub


Private Function CreateInspectionOrder(aCustSiteID As Long, aRequestedDT As Date, Optional aLevel As Integer = 1) As Long

    Dim strSQL As String
    Dim db As Database
    Dim rs As Recordset
    Dim msg As String
    Dim aCustomerID As Long, aSiteID As Long

    On Error GoTo PROC_ERR

    CreateInspectionOrder = 0

    strSQL = _
           "SELECT dbo_InspectionOrder.InspectionOrderID, dbo_InspectionOrder.CreatedOn, dbo_InspectionOrder.RequestedDT, " & _
           "dbo_InspectionOrder.CompletedDT, dbo_InspectionOrder.InspectionStatusID, dbo_InspectionOrder.HRID, " & _
           "dbo_InspectionOrder.CustSiteID, dbo_InspectionOrder.CustomerID, dbo_InspectionOrder.SiteID,  dbo_InspectionOrder.LevelNum " & _
           "FROM dbo_InspectionOrder;"
    
    aCustomerID = DLookup("[CustomerID]", "dbo_CustSite", "[CustSiteID] = " & aCustSiteID)
    aSiteID = DLookup("[SiteID]", "dbo_CustSite", "[CustSiteID] = " & aCustSiteID)
    
    If Nz(aCustomerID, 0) = 0 Then Exit Function
    If Nz(aSiteID, 0) = 0 Then Exit Function
    
    
    Set db = CurrentDb
    Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If Not IsNull(rs) Then
        With rs
            .AddNew
            ![CreatedOn] = Now()
            ![RequestedDT] = aRequestedDT
            ![LevelNum] = aLevel
            ![InspectionStatusID] = 1
            ![CustSiteID] = aCustSiteID
            ![CustomerID] = aCustomerID
            ![SiteID] = aSiteID
            .Update
        End With
    End If


PROC_EXIT:
    
    'Cleanup
    Set rs = Nothing
    Set db = Nothing

    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " CreateInspectionOrder" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function


Public Function SetInspectionStatusID(ByVal aInspectionOrderID As Long) As Boolean
    Dim v As Variant
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim msg As String
    Dim results As Integer
    Dim aOpenArgs As String

    On Error GoTo PROC_ERR
       
    SetInspectionStatusID = False
    
    strSQL = "Select [InspectionStatusID] from dbo_InspectionOrder where [InspectionOrderID] = " & CStr(aInspectionOrderID)
    Set db = CurrentDb
    Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If Not IsNull(rs) Then
        aOpenArgs = CStr(aInspectionOrderID)
        DoCmd.OpenForm "xDlgInspect_Status", , , , , acDialog, aOpenArgs
        DoCmd.Close acForm, "xDlgInspect_Status"
    
        If (Nz(mReturnValue, 0) > 0) Then
            SetInspectionStatusID = True
        End If
    End If
    
PROC_EXIT:
    'Cleanup
    Set rs = Nothing
    Set db = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " SetInspectionStatusID" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    

End Function

