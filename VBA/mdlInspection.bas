Attribute VB_Name = "mdlInspection"
Option Compare Database
Option Explicit

Private vReturnValue As Variant
Private mOpenArgs As String


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
    ReturnValue = vReturnValue
End Property

Public Property Let ReturnValue(X As Variant)
    vReturnValue = X
End Property


Public Sub Dlg_DeleteInspectionOrder(ByVal InspectionOrderID)
Dim Results As Integer
Dim Pass As Boolean
    ' Prompt user
    
    If Results = vbOK Then
        Pass = DeleteInspectionOrder(InspectionOrderID)
    End If

End Sub
Public Function DeleteInspectionOrder(ByVal InspectionOrderID) As Boolean
    Dim Msg As String
    Dim dbs As Database

    On Error GoTo PROC_ERR
    DeleteInspectionOrder = False
    
    If (InspectionOrderID > 0) Then
        ' Delete all tests assigned to the inspection order
        Set dbs = CurrentDb
        dbs.Execute "DELETE * FROM dbo_Test WHERE dbo_Test.InspectionOrderID = " & CStr(InspectionOrderID), dbFailOnError + dbSeeChanges
        ' Delete the inspection order
        dbs.Execute "DELETE * FROM dbo_InspectionOrder WHERE InspectionOrderID = " & CStr(InspectionOrderID), dbFailOnError + dbSeeChanges
        DeleteInspectionOrder = True
    End If
    
PROC_EXIT:
    Set dbs = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    If err.Number <> 0 Then
        Msg = ModuleName & " DeleteInspectionOrder" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox Msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function


Public Sub CancelOutstandingInspectionOrders(aCustSiteID As Variant)
    Dim SQL As String
    Dim dbs As Database
    Dim rst As Recordset
    Dim Msg As String
    ' cancel all outstanding customer inspection orders for the site.
    ' used when disabling a site ...
    
    On Error GoTo PROC_ERR
    
    SQL = _
           "SELECT dbo_InspectionOrder.CustSiteID, dbo_InspectionOrder.InspectionStatusID " & _
           "FROM dbo_InspectionOrder " & _
           "WHERE (((dbo_InspectionOrder.CustSiteID)=" & CStr(aCustSiteID) & _
           ") AND ((dbo_InspectionOrder.InspectionStatusID)<>2 Or (dbo_InspectionOrder.InspectionStatusID)<>3));"
    
    Set dbs = CurrentDb
    Set rst = dbs.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        rst.MoveFirst
        Do Until rst.EOF
            rst.Edit
            rst![InspectionStatusID] = 3 ' CANCELLED
            rst.Update
        
            rst.MoveNext
        Loop
    End If
    
    
PROC_EXIT:
    
    'Cleanup
    Set rst = Nothing
    Set dbs = Nothing

    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        Msg = ModuleName & " CancelOutstandingInspectionOrders" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox Msg, , "Error", err.HelpFile, err.HelpContext
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


Public Function CreateInspectionOrder(aCustSiteID As Long, aRequestedDT As Date, dblServiceInterval As Double, _
    Optional aLevel As Integer = 1, Optional LastAssignedTechnician As Long = 0) As Long

    Dim SQL As String
    Dim dbs As Database
    Dim rst As Recordset
    Dim Msg As String
    Dim aCustomerID As Long, aSiteID As Long
    Dim v As Variant
    Dim DoAssignHR As Boolean

    On Error GoTo PROC_ERR

    CreateInspectionOrder = 0
    DoAssignHR = False

    SQL = _
           "SELECT dbo_InspectionOrder.InspectionOrderID, dbo_InspectionOrder.CreatedOn, dbo_InspectionOrder.RequestedDT, " & _
           "dbo_InspectionOrder.CompletedDT, dbo_InspectionOrder.InspectionStatusID, dbo_InspectionOrder.HRID, " & _
           "dbo_InspectionOrder.CustSiteID, dbo_InspectionOrder.CustomerID, dbo_InspectionOrder.SiteID,  " & _
           "dbo_InspectionOrder.ServiceInterval, dbo_InspectionOrder.LevelNum " & _
           "FROM dbo_InspectionOrder;"
    
    aCustomerID = DLookup("[CustomerID]", "dbo_CustSite", "[CustSiteID] = " & aCustSiteID)
    aSiteID = DLookup("[SiteID]", "dbo_CustSite", "[CustSiteID] = " & aCustSiteID)
    
    If Nz(aCustomerID, 0) = 0 Then Exit Function
    If Nz(aSiteID, 0) = 0 Then Exit Function
    
    Set dbs = CurrentDb
    Set rst = dbs.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If Not IsNull(rst) Then
        With rst
            .AddNew
            ![CreatedOn] = Now()
            ![RequestedDT] = aRequestedDT
            ![LevelNum] = aLevel
            ![InspectionStatusID] = 1
            ![ServiceInterval] = dblServiceInterval
            ![CustSiteID] = aCustSiteID
            ![CustomerID] = aCustomerID
            ![SiteID] = aSiteID
            If LastAssignedTechnician > 0 Then
                ' ASSUMPTION: HRID exists (else system throws error).
                ![HRID] = LastAssignedTechnician
            End If
            .Update
        End With
    End If


PROC_EXIT:
    
    'Cleanup
    Set rst = Nothing
    Set dbs = Nothing

    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        Msg = ModuleName & " CreateInspectionOrder" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox Msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function


Public Function SetInspectOrderStatus(ByVal aInspectionOrderID As Long) As Boolean
    Dim v As Variant
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim dbs As DAO.Database
    Dim Msg As String
    Dim Results As Integer
    Dim vOpenArgs As String

    On Error GoTo PROC_ERR
       
    SetInspectOrderStatus = False
    
    SQL = "Select [InspectionStatusID] from dbo_InspectionOrder where [InspectionOrderID] = " & CStr(aInspectionOrderID)
    Set dbs = CurrentDb
    Set rst = dbs.OpenRecordset(SQL, dbOpenSnapshot, dbFailOnError + dbSeeChanges)
    If Not IsNull(rst) Then
        vOpenArgs = CStr(aInspectionOrderID)
        'TODO: Set InspectOrderStatusID here and not in the dialogue box
        DoCmd.OpenForm "xDlgInspectOrder_SetStatus", , , , , acDialog, vOpenArgs
        DoCmd.Close acForm, "xDlgInspectOrder_SetStatus"
    
        If (Nz(vReturnValue, 0) > 0) Then
            SetInspectOrderStatus = True
        End If
    End If
    
PROC_EXIT:
    'Cleanup
    Set rst = Nothing
    Set dbs = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        Msg = ModuleName & " SetInspectOrderStatus" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox Msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    

End Function


