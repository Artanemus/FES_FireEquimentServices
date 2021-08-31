Attribute VB_Name = "mdlEnable"
Option Compare Database
Option Explicit

Private Const ModuleName As String = "mdlEnable"
Private ArrayOfServiceIntervals() As Double

Private varReturnValue As Variant
Private mOpenArgs As String
Private bolDoReseed As Boolean
Private varSeedDate As Date
Private intSeedLevel As Integer
Private intMode As Integer

Public Property Get ReturnValue() As Variant
    ReturnValue = varReturnValue
End Property

Public Property Let ReturnValue(X As Variant)
    varReturnValue = X
End Property

Public Property Get DoReseed() As Boolean
    DoReseed = bolDoReseed
End Property

Public Property Let DoReseed(X As Boolean)
    bolDoReseed = X
End Property

Public Property Get SeedDate() As Date
    SeedDate = varSeedDate
End Property

Public Property Let SeedDate(X As Date)
    varSeedDate = X
End Property

Public Property Get SeedLevel() As Integer
    SeedLevel = intSeedLevel
End Property

Public Property Let SeedLevel(X As Integer)
    intSeedLevel = X
End Property

Public Property Get Mode() As Integer
    Mode = intMode
End Property

Public Property Let Mode(X As Integer)
    intMode = X
End Property

'    ' BUILD the service interval array ...
'    Success = BuildArrayOfServiceIntervals(ArrayOfServiceIntervals(), errMsg, LULogCallerID(ModuleName))
'    If Not Success Then
'        mdlLog.AppendLog "CHECK-ServiceIntervals", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
'        Exit Function
'    End If
'
'    ' ITERATE OVER COLLECTION OF ServiceIntervals
'    ' ##### TEST
'    ' SAFE to use ArrayOfServiceIntervals
'    For i = LBound(ArrayOfServiceIntervals()) To UBound(ArrayOfServiceIntervals())
'    Next i

Private Function CheckIsEnabled(ByVal lngCustSiteID As Long) As Boolean
    Dim v As Variant
    Dim msg As String
    Dim cCode As String
    
    
    CheckIsEnabled = True
    ' CHECK is the customer site isn't already enabled?
    ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    v = DLookup("[IsEnabled]", "dbo_CustSite", "[CustSiteID] = " & CStr(lngCustSiteID))
    ' value can be NULL or 0 if disabled else TRUE (-1)
    If IsNull(v) Or CBool(v) = True Then
        Beep
        '        msg = _
        '           "The site is already enabled."
        '        cCode = mdlCompany.GetCompanyCode
        '        Results = MsgBox(msg, _
        '        VbMsgBoxStyle.vbOKOnly Or VbMsgBoxStyle.vbExclamation Or VbMsgBoxStyle.vbDefaultButton1, _
        '        cCode & " Error - Enable Site")
        Exit Function
    Else
        CheckIsEnabled = False
    End If
End Function

Private Function CheckEnabledBy(ByVal lngCustSiteID As Long) As Boolean
    Dim v As Variant
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim msg As String
    Dim lngSiteID As Long
    Dim cCode As String
    Dim Results As Integer
    
    
    On Error GoTo PROC_ERR
    CheckEnabledBy = True

    ' CHECK has another customer got this site enabled?
    ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    v = DLookup("[SiteID]", "dbo_CustSite", "[CustSiteID] = " & CStr(lngCustSiteID))
    If Nz(v, 0) > 0 Then
        lngSiteID = CLng(v)
        SQL = _
            "SELECT dbo_CustSite.CustSiteID, dbo_CustSite.SiteID, dbo_CustSite.CustomerID, dbo_CustSite.IsEnabled, dbo_Customer.CustName " & _
            "FROM dbo_CustSite INNER JOIN dbo_Customer ON dbo_CustSite.CustomerID = dbo_Customer.CustomerID " & _
            "WHERE (((dbo_CustSite.CustSiteID)<> " & CStr(lngCustSiteID) & ") AND ((dbo_CustSite.SiteID)= " & _
            CStr(lngSiteID) & ") AND ((dbo_CustSite.IsEnabled) = True));"


        Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If Not IsNull(rst) Then
            If rst.RecordCount > 0 Then
                rst.MoveFirst
                ' found a customer who is using this site
                msg = _
                    "Unable to enable this site as it's being used by." & vbCrLf & _
                    "CustomerID: " & CStr(rst!CustomerID) & " " & rst![CustName] & vbCrLf & _
                    "The action will abort."
                cCode = mdlCompany.GetCompanyCode
                Results = MsgBox(msg, _
                                 VbMsgBoxStyle.vbOKOnly Or VbMsgBoxStyle.vbExclamation Or VbMsgBoxStyle.vbDefaultButton1, _
                                 cCode & " Error - Enable Site")
                
                ' EXIT FUNCTION
                ' ----------------------
                Exit Function
            Else
                CheckEnabledBy = False
            End If
        End If
        rst.Close
        Set rst = Nothing
    Else
        Beep
        '        msg = _
        '           "Missing SiteID." & vbCrLf & _
        '           "The action will abort."
        '        cCode = mdlCompany.GetCompanyCode
        '        Results = MsgBox(msg, _
        '        VbMsgBoxStyle.vbOKOnly Or VbMsgBoxStyle.vbExclamation Or VbMsgBoxStyle.vbDefaultButton1, _
        '        cCode & " Error - Enable Site")
        Exit Function
    End If
        
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " CheckEnabledBy" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
End Function

Private Function HasInspectionOrderHistory(ByVal lngCustSiteID As Long, ByVal dblServiceInterval As Double) As Boolean
    Dim v As Variant
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim msg As String
    
    On Error GoTo PROC_ERR
    HasInspectionOrderHistory = True

    ' DOES THE CUSTOMER HAVE  A INSPECTION ORDER HISTORY? ARE THEY A NEW CUSTOMER?
    SQL = _
        "SELECT InspectionOrderID " & _
        "FROM dbo_InspectionOrder " & _
        "WHERE (dbo_InspectionOrder.CustSiteID = " & CStr(lngCustSiteID) & " ) " & _
        " AND dbo_InspectionOrder.ServiceInterval = " & CStr(dblServiceInterval)
        
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount = 0 Then
        HasInspectionOrderHistory = False
    End If
    rst.Close
    Set rst = Nothing
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " CheckEnabledBy" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
    
End Function

Private Function ExeNewCustomerEnable(ByVal lngCustSiteID As Long, ByRef errMsg As String) As Boolean
    Dim rst As DAO.Recordset
    Dim SQL As String
    Dim Success As Boolean
    Dim msg As String
    Dim Results As Integer
    
    On Error GoTo PROC_ERR

    ExeNewCustomerEnable = False

    SQL = "SELECT [IsEnabled], [DoReseed], [SeedDate], [SeedLevel], [SiteID] FROM dbo_CustSite WHERE [CustSiteID] = " & CStr(lngCustSiteID)
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        rst.Edit
        rst.Fields("IsEnabled") = True
        rst.Fields("DoReseed") = True
        rst.Fields("SeedDate") = varSeedDate
        rst.Fields("SeedLevel") = intSeedLevel
        rst.Update
        ExeNewCustomerEnable = True
    Else
        errMsg = _
        "FES - SYSTEM ERROR " & _
        vbCrLf & "Unable to locate the the CustSiteID"
        Exit Function ' unexpected error
    
    End If
    If ExeNewCustomerEnable Then
        msg = "The LINK " & CStr(lngCustSiteID) & " was ENABLED."
        Results = MsgBox(msg, VbMsgBoxStyle.vbOKOnly Or VbMsgBoxStyle.vbInformation Or VbMsgBoxStyle.vbDefaultButton1, _
                         mdlCompany.GetCompanyCode() & " - ACTIVATED INSPECTION ORDER")
    End If
PROC_EXIT:
    'Cleanup
    Set rst = Nothing
    On Error Resume Next
    Exit Function
    
PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " ExeNewCustomerEnable" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
        

End Function

Private Function ExeRtnCustomerEnable(ByVal aMode As Integer, ByVal lngCustSiteID As Long, ByVal dblServiceInterval As Double, ByRef errMsg As String) As Boolean

    Dim rst As DAO.Recordset
    Dim SQL As String
    Dim Success As Boolean
    Dim lngInspectionOrderID As Long
    Dim msg As String
    Dim Results As Integer
    
    On Error GoTo PROC_ERR
    
    ExeRtnCustomerEnable = False
    lngInspectionOrderID = 0
    errMsg = vbNullString
    
    SQL = "SELECT [IsEnabled], [DoReseed], [SeedDate], [SeedLevel] FROM dbo_CustSite WHERE [CustSiteID] = " & CStr(lngCustSiteID)
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        Select Case aMode
        Case 1     ' just enable the site and exit
            rst.Edit
            rst.Fields("IsEnabled") = True
            rst.Fields("DoReseed") = False
            rst.Update
            ExeRtnCustomerEnable = True
        Case 2
            ' ENABLE SEEDING and use the values the USER entered
            ' - LAST inspection order must be finalized to reach here.
            ' - VarSeedDate and intSeedLevel are must be SAFE.
            rst.Edit
            rst.Fields("IsEnabled") = True
            rst.Fields("DoReseed") = True
            rst.Fields("SeedDate") = varSeedDate
            rst.Fields("SeedLevel") = intSeedLevel
            rst.Update
            ExeRtnCustomerEnable = True
        End Select
    Else
        errMsg = _
        "FES - SYSTEM ERROR " & _
        vbCrLf & "Unable to locate CustSiteID: " & CStr(lngCustSiteID)
        Exit Function ' unexpected error
    End If
    
    If ExeRtnCustomerEnable Then
        msg = "The LINK " & CStr(lngCustSiteID) & " was ENABLED."
        Results = MsgBox(msg, VbMsgBoxStyle.vbOKOnly Or VbMsgBoxStyle.vbInformation Or VbMsgBoxStyle.vbDefaultButton1, _
                         mdlCompany.GetCompanyCode() & " - ACTIVATED INSPECTION ORDER")
                                     
    End If
    
        
PROC_EXIT:
    'Cleanup
    Set rst = Nothing
    On Error Resume Next
    Exit Function
    
PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " ExeRtnCustomerEnable" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
        
End Function

Private Function GetMaxServiceInterval() As Double
    Dim iter As Integer
    Dim Max As Integer
    Max = 0
    For iter = LBound(ArrayOfServiceIntervals()) To UBound(ArrayOfServiceIntervals())
        If ArrayOfServiceIntervals(iter) > Max Then
            Max = ArrayOfServiceIntervals(iter)
        End If
    Next iter
    GetMaxServiceInterval = Max
End Function

Private Function GetMaxServiceIntervalOnSite(lngCustSiteID) As Double
    Dim rst As DAO.Recordset
    Dim SQL As String
    Dim msg As String
    
    On Error GoTo PROC_ERR
    
    GetMaxServiceIntervalOnSite = 0
    
    SQL = _
    "SELECT Max(dbo_EquipType.ServiceInterval) AS MaxOfServiceInterval " & _
    "FROM dbo_CustSite INNER JOIN (((dbo_Site INNER JOIN dbo_Station ON dbo_Site.SiteID = dbo_Station.SiteID) " & _
    "INNER JOIN dbo_Equipment ON dbo_Station.EquipmentID = dbo_Equipment.EquipmentID) " & _
    "INNER JOIN dbo_EquipType ON dbo_Equipment.EquipTypeID = dbo_EquipType.EquipTypeID) ON dbo_CustSite.SiteID = dbo_Site.SiteID " & _
    "WHERE (((dbo_CustSite.CustSiteID)=" & CStr(lngCustSiteID) & "));"
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        GetMaxServiceIntervalOnSite = rst.Fields("MaxOfServiceInterval")
    End If
PROC_EXIT:
    'Cleanup
    Set rst = Nothing
    On Error Resume Next
    Exit Function
    
PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " GetMaxServiceIntervalOnSite" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function

Public Function EnableLINK(ByVal lngCustSiteID As Long) As Boolean
    Dim v As Variant
    Dim msg As String
    Dim lngSiteID As Long
    Dim lngCustomerID As Long
    Dim vOpenArgs As String
    Dim cCode As String
    Dim Success As Boolean
    Dim errMsg As String
    
    Dim ProgressDlg As frmProgress
    Dim iter As Integer
    Dim dblMaxServiceInterval As Double
    Dim item As Variant

    On Error GoTo PROC_ERR
       
    EnableLINK = False
    
    
    If lngCustSiteID = 0 Then
        Beep
        Exit Function
    End If
    
    
    ' ##################################################################
    ' mdlCompany.GetGlobalDefNumOfLevels is dependant on system globals
    ' Globals used in xDlgLink_Enable_NewCust
    ' ##################################################################
    Success = mdlCheck.CheckSystemGlobals(errMsg)
    If Not Success Then
        DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
        DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
        Exit Function
    End If
    
    ' Is this Customer-Site LINK already endabled by THIS Customer?
    If CheckIsEnabled(lngCustSiteID) Then
        Exit Function ' already enabled
    End If
    ' Is this Customer-Site LINK already endabled by ANOTHER Customer?
    If CheckEnabledBy(lngCustSiteID) Then
        Exit Function ' another customer has this site enabled
    End If
    
    ' ##################################################################
    ' GLOBAL PROC TO CHECK LINKS ....
    Set ProgressDlg = New frmProgress
    Load ProgressDlg
    
    ' GLOBAL PROC TO CHECK EQUIPMENT TYPE AND SERVICE INTERVALS....
    Success = mdlCheck.CheckEquipType(errMsg)
    If Not Success Then
        DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
        DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
        Unload ProgressDlg
        Exit Function
    End If
    
'    ' Optional - specify the link to check
'    Success = CheckLINKS(ProgressDlg, errMsg, lngCustSiteID)
'    If Not Success Then
'        DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
'        DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
'        Unload ProgressDlg
'        Exit Function ' multi-inspection orders in progress
'    End If

    
    Unload ProgressDlg
    Set ProgressDlg = Nothing
    
    ' ##################################################################
    ' ##################################################################
    ' SAFE TO
    ' BUILD the service interval array ...
    Success = BuildArrayOfServiceIntervals(ArrayOfServiceIntervals(), errMsg, LULogCallerID(ModuleName))
    If Not Success Then
        DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
        DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo

        mdlLog.AppendLog "CHECK-ServiceIntervals", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        Exit Function
    End If
    
    For iter = LBound(ArrayOfServiceIntervals()) To UBound(ArrayOfServiceIntervals())
        If HasMultiInProgress(lngCustSiteID, ArrayOfServiceIntervals(iter), errMsg) Then
            ' SPECIAL DLG for this error ...
            DoCmd.OpenForm "xDlgLink_Enable_ErrMsg", , , , , acDialog, errMsg
            DoCmd.Close acForm, "xDlgLink_Enable_ErrMsg", acSaveNo
            Exit Function ' multi-inspection orders in progress
        End If
    Next iter
    
    ' GET THE MAX SERVICE INTERVAL FOR THE SITE
    ' This looks at the equipment assigned to the site
    dblMaxServiceInterval = GetMaxServiceIntervalOnSite(lngCustSiteID)
    If dblMaxServiceInterval = 0 Then
        ' UNEXPECTED ERROR
        ' No equipment at the site?
        errMsg = "No equipment at site?"
        DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
        DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
        mdlLog.AppendLog "CHECK Site's ServiceIntervals", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        Exit Function
    End If

    ' ###################################################################
    ' CHECK MASTER TABLE - ITERATE OVER COLLECTION OF ServiceIntervals
    ' check if MAX exists in dbo.EquipType
    Success = False
    For iter = LBound(ArrayOfServiceIntervals()) To UBound(ArrayOfServiceIntervals())
        If dblMaxServiceInterval = ArrayOfServiceIntervals(iter) Then
            Success = True
            Exit For
        End If
    Next iter
    
    If Not Success Then
        ' UNEXPECTED ERROR
        ' System error
        errMsg = _
            "FES System Error?" & _
            vbCrLf & "Missing service interval in dbo.EquipType" & _
            vbCrLf & "Site contained additional service intervals not seen in master table. "
        DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
        DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
        mdlLog.AppendLog "SYSTEM ERROR", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        Exit Function
    End If
    
    ' DOES THE CUSTOMER HAVE AN INSPECTION ORDER HISTORY? ARE THEY A NEW CUSTOMER?
    If HasInspectionOrderHistory(lngCustSiteID, dblMaxServiceInterval) = True Then

        ' CUSTOMER HAS INSPECTION ORDER HISTORY
        ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        ' DIALOGUE return fMode 1 or 2
        ' mode 1 - use the last inspection order to re-generate
        ' mode 2 - use the data entered by the USER AND enable SEEDING
        varReturnValue = 0
        vOpenArgs = CStr(lngCustSiteID) & "|" & CStr(dblMaxServiceInterval)
        DoCmd.OpenForm "xDlgLink_Enable", , , , , acDialog, vOpenArgs
        DoCmd.Close acForm, "xDlgLink_Enable"
        If varReturnValue > 0 Then
            If intMode = 0 Then
                ' the mode wasn't set correctly
                errMsg = _
                    "FES System Error?" & _
                    vbCrLf & "The DLG didn't return a valid radio-button value." & _
                    vbCrLf & "The procedure was aborted. "
                DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
                DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
                mdlLog.AppendLog "SYSTEM ERROR", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
                Exit Function 'unexpected error
            End If
            ' ENABLE RETURNING CUSTOMER
            ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            Success = ExeRtnCustomerEnable(intMode, lngCustSiteID, dblMaxServiceInterval, errMsg)
            If Not Success Then
                DoCmd.OpenForm "xDlgLink_Enabled_Failed", , , , , acDialog, errMsg
                DoCmd.Close acForm, "xDlgLink_Enabled_Failed", acSaveNo
                mdlLog.AppendLog "Enabled LINK FAILED.", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
                Exit Function
            Else
                EnableLINK = True
            End If
        End If
    Else
        ' NEW CUSTOMER - NO HISTORY OF INSPECTION ORDERS
        ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        vOpenArgs = CStr(lngCustSiteID) & "|" & CStr(dblMaxServiceInterval)
        DoCmd.OpenForm "xDlgLink_Enable_NewCust", , , , , acDialog, vOpenArgs
        DoCmd.Close acForm, "xDlgLink_Enable_NewCust"
        If varReturnValue > 0 Then
            ' ENABLE NEW CUSTOMER
            ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            Success = ExeNewCustomerEnable(lngCustSiteID, errMsg)
            If Not Success Then
                DoCmd.OpenForm "xDlgLink_Enabled_Failed", , , , , acDialog, errMsg
                DoCmd.Close acForm, "xDlgLink_Enabled_Failed", acSaveNo
                mdlLog.AppendLog "Enabled LINK FAILED.", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
            Else
                EnableLINK = True
            End If
        End If
        
    End If
        
        
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " EnableLINK" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
End Function




' ###########################################################################
' DEPRECIATED - USE clsLinkData
' ###########################################################################

'    ' Is the Last inspection order NOT COMPLETED OR CANCELLED ?
'    ' SQL pulls the most recent inspection order for the customer site
'    SQL = _
'        "SELECT Top 1 InspectionOrderID, RequestedDT, InspectionStatusID FROM dbo_InspectionOrder " & _
'        "WHERE (dbo_InspectionOrder.CustSiteID = " & CStr(lngCustSiteID) & " ) AND dbo_InspectionOrder.RequestedDT IS NOT NULL " & _
'        " AND dbo_InspectionOrder.ServiceInterval = " & CStr(dblServiceInterval) & _
'        " ORDER BY dbo_InspectionOrder.RequestedDT DESC;"
'
'    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
'    If rst.RecordCount > 0 Then
'        lngInspectionOrderID = rst.Fields("InspectionOrderID")
'        ' last inspection order is still in progress
'        If ((rst.Fields("InspectionStatusID") <> 2) And (rst.Fields("InspectionStatusID") <> 3)) Then
'            rst.Close
'            Set rst = Nothing
'            ' FORCE MODE ...
'            aMode = 1 ' just enable the site and exit
'        End If
'    Else
'        errMsg = _
'        "FES - SYSTEM ERROR " & _
'        vbCrLf & "Unable to locate the 'Last Inspection Order'" & _
'        vbCrLf & "needed to REFERENCE the customer-site LINK."
'        Exit Function ' unexpected error
'    End If


