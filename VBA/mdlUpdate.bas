Attribute VB_Name = "mdlUpdate"
Option Compare Database
Option Explicit


Private vReturnValue As Variant
Private vOpenArgs As String
Private vCompanyInfoID As Long
Private vLogCallerID As Long
Private UpdateStats As clsUpdateStats
Private LinkData As clsLinkData
Private ArrayOfServiceIntervals() As Double
Private PROGRESS As frmProgress


Const ModuleName As String = "mdlUpdate"

Public Property Get ReturnValue() As Variant
    ReturnValue = vReturnValue
End Property

Public Property Let ReturnValue(RHS As Variant)
    vReturnValue = RHS
End Property

Public Property Get Stats() As clsUpdateStats
    Stats = UpdateStats
End Property

Public Property Set Stats(RHS As clsUpdateStats)
    Set UpdateStats = RHS
End Property

Public Sub Update_Main()
    Dim errMsg As String
    Dim msg As String
                                  
    Dim Success As Boolean
        
    On Error GoTo PROC_ERR
    
    ' used by the toolbox and SYSTEM LOG
    vCompanyInfoID = mdlCompany.GetCompanyInfoID
    
    ' ##########################################################################
    ' CLASS CREATION ...
    ' ##########################################################################
    ' create an stats class (Shared)
    Set UpdateStats = New clsUpdateStats
    ' create clsLinkData - holds data of the most current inspection record
    Set LinkData = New clsLinkData
    ' ##########################################################################
    
    vLogCallerID = 1
    errMsg = vbNullString

    '#### Setup the UserForm - progress bar dialogue
    Set PROGRESS = New frmProgress 'max=100 value=0 dosmooth=true
    Load PROGRESS
    PROGRESS.lblTitle.Caption = "Update Inspection Orders."
    PROGRESS.lblCaption.Caption = "..."
    
    '####  User Dialogue - execute - Update Inspection Orders? Yes/No?
    DoCmd.OpenForm "xDlgUpdate_Begin", , , , , acDialog
    DoCmd.Close acForm, "xDlgUpdate_Begin", acSaveNo
    ' User said YES
    If vReturnValue = 1 Then
        
        PROGRESS.Show
    
        '#### Clear the system log file
        PROGRESS.lblCaption.Caption = "Clear System Log..."
        DoEvents
        Success = mdlLog.ExeClearLog()
        If Not Success Then
            ' hide the UserForm
            PROGRESS.Hide
            errMsg = _
                   "This is a system error. Your dbo.Log table may be corrupt." & _
                   vbCrLf & "Use Microsoft's SQL Server Management Studio to inspect the error."
            ' display the assert error message in the progressdlg
            DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
            DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
            Unload PROGRESS
            Set PROGRESS = Nothing
            Exit Sub
        End If
        
        '#### Check dbo.CompanyInfo and dbo.Global
        PROGRESS.lblCaption.Caption = "Checking System Globals..."
        DoEvents
        Success = mdlCheck.CheckSystemGlobals(errMsg)
        If Not Success Then
            ' hide the UserForm
            PROGRESS.Hide
            DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
            DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
            Unload PROGRESS
            Set PROGRESS = Nothing
            Exit Sub
        End If
        
        '#### Check dbo.CustSite
        PROGRESS.lblCaption.Caption = "Checking dbo_CustSite Seeds..."
        DoEvents
        Success = mdlCheck.CheckCustSiteSeeds(errMsg)
        If Not Success Then
            ' hide the UserForm
            PROGRESS.Hide
            DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
            DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
            Unload PROGRESS
            Set PROGRESS = Nothing
            Exit Sub
        End If
        
        '#### Check db0.EquipType
        PROGRESS.lblCaption.Caption = "Checking dbo_EquipType..."
        DoEvents
        Success = mdlCheck.CheckEquipType(errMsg)
        If Not Success Then
            ' hide the UserForm
            PROGRESS.Hide
            DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
            DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
            Unload PROGRESS
            Set PROGRESS = Nothing
            Exit Sub
        End If

        
        '#### Check dbo.InspectionOrder
        PROGRESS.lblCaption.Caption = "Checking Inspection Order's Service Intervals..."
        DoEvents
        Success = mdlCheck.CheckInspectOrdersSI(errMsg)
        If Not Success Then
            ' hide the UserForm
            PROGRESS.Hide
            DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
            DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
            Unload PROGRESS
            Set PROGRESS = Nothing
            Exit Sub
        End If
        
        ' ##### CHECKS ACROSS ALL ENABLED CUSTOMER SITES (LINKS)
        ' for multi-inspection orders still in progress (more than one)
        ' for each service interval
        PROGRESS.lblCaption.Caption = "Checking for Multi-In-Progress..."
        DoEvents
        Success = mdlCheck.CheckMultiInProgress(errMsg)
        If Not Success Then
            ' hide the UserForm
            PROGRESS.Hide
            DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
            DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
            Unload PROGRESS
            Set PROGRESS = Nothing
            Exit Sub
        End If


        '###############################################################
        '#### BEGIN PROCESS
        '###############################################################
        PROGRESS.lblCaption.Caption = "Starting Inspection Update..."
        DoEvents
        Success = Update_Process_A(errMsg)
        
        PROGRESS.lblCaption.Caption = "Clean up and tally stats..."
        DoEvents
                        
        PROGRESS.Hide
                        
        If Not Success Then
            ' hide the UserForm
            '#### PROCESS with errors and warnings
            ' display the 'view log' message in the progressdlg
            DoCmd.OpenForm "xDlgUpdate_ProcessFailed", , , , , acDialog, errMsg
            DoCmd.Close acForm, "xDlgUpdate_ProcessFailed", acSaveNo
        End If
    
        '#### PROCESS COMPLETED -' display the RESULTS dlg
        vOpenArgs = _
                  CStr(UpdateStats.Total) & "|" & CStr(UpdateStats.Disabled) & "|" & _
                  CStr(UpdateStats.Enabled) & "|" & CStr(UpdateStats.ReadyToProcess) & "|" & _
                  CStr(UpdateStats.NewCustomers) & "|" & CStr(UpdateStats.OrdersBuilt) & "|" & _
                  CStr(UpdateStats.Errors) & "|" & CStr(UpdateStats.Skipped) & "|" & CStr(UpdateStats.Warnings)

        DoCmd.OpenForm "xDlgUpdate_End", , , , , acDialog, vOpenArgs
        DoCmd.Close acForm, "xDlgUpdate_End"
        
    End If
    
    
PROC_EXIT:
    'Cleanup
    If PROGRESS.Visible Then
        PROGRESS.Hide
    End If
    Unload PROGRESS
    Set PROGRESS = Nothing
    
    ' CLASS DESTRUCTION ....
    Set UpdateStats = Nothing
    Set LinkData = Nothing
    
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

Public Function Update_Process_A(ByRef errMsg As String) As Boolean
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim msg As String
    Dim Failed As Boolean
    Dim Success As Boolean
    Dim iter As Integer
    
    On Error GoTo PROC_ERR

    
    If LinkData Is Nothing Then Exit Function
    If UpdateStats Is Nothing Then Exit Function
    
    errMsg = vbNullString
    Update_Process_A = False
    SQL = _
        "SELECT dbo_CustSite.CustSiteID, dbo_CustSite.CustomerID, dbo_CustSite.SiteID, " & _
        "dbo_CustSite.CreatedOn, dbo_CustSite.IsEnabled " & _
        "FROM dbo_CustSite ORDER BY dbo_CustSite.CreatedOn DESC;"
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        rst.MoveLast
        UpdateStats.Total = rst.RecordCount
        PROGRESS.xMax = rst.RecordCount
    Else
        Exit Function
    End If
    
    ' BUILD the service interval array ...
    Success = BuildArrayOfServiceIntervals(ArrayOfServiceIntervals(), errMsg, LULogCallerID(ModuleName))
    If Not Success Then
        DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
        DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
        mdlLog.AppendLog "CHECK-ServiceIntervals", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        Exit Function
    End If
    ' ITERATE OVER SERVICE INTERVAL
    For iter = LBound(ArrayOfServiceIntervals()) To UBound(ArrayOfServiceIntervals())
        PROGRESS.xValue = 0
        ' ######### START
        Success = Update_Process_B(errMsg, ArrayOfServiceIntervals(iter))
        If Not Success Then
            ' system errors?
            ' display the 'view log' message in the progressdlg
            DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
            DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
            mdlLog.AppendLog "CHECK-ServiceIntervals", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
            Exit For
        Else
            Update_Process_A = True
        End If
        
    Next iter
    
PROC_EXIT:
    Set rst = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " Update_Process" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
    

End Function

Public Function Update_Process_B(ByRef errMsg As String, ByVal dblServiceInterval As Double) As Boolean
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim msg As String
    Dim Failed As Boolean
    Dim v As Variant
    Dim Success As Boolean
    Dim str As String
    
    On Error GoTo PROC_ERR

    
    If LinkData Is Nothing Then Exit Function
    If UpdateStats Is Nothing Then Exit Function
    
    errMsg = vbNullString
    ' only fail on system errors
    Update_Process_B = True
    
    SQL = _
        "SELECT dbo_CustSite.CustSiteID, dbo_CustSite.CustomerID, dbo_CustSite.SiteID, " & _
        "dbo_CustSite.CreatedOn, dbo_CustSite.IsEnabled " & _
        "FROM dbo_CustSite " & _
        "ORDER BY dbo_CustSite.CreatedOn DESC "
           
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        With rst
            Do Until .EOF
                ' does the site have equipment that use this service interval ?
                If Not HasServiceInterval(.Fields("CustSiteID"), dblServiceInterval) Then
                    UpdateStats.SkippedServiceInterval = UpdateStats.SkippedServiceInterval + 1
                    GoTo JUMP_001
                End If
                
                ' Does the CustSite have MULTI-Inspection Orders in the state of IN PROGRESS ?
                If HasMultiInProgress(.Fields("CustSiteID"), dblServiceInterval, errMsg) Then
                    ' skip this inspection order
                    UpdateStats.Skipped = UpdateStats.Skipped + 1
                    GoTo JUMP_001
                End If
                
                
                If (.Fields("IsEnabled") = True) Then
                    ' ENABLED CustSite.
                    ' ----------------------------------------
                    ' inc count for enabled customer sites
                    UpdateStats.Enabled = UpdateStats.Enabled + 1
                
                    ' ALL DATA IS RE-INIT
                    Success = LinkData.PrepareData(.Fields("CustSiteID"), errMsg, dblServiceInterval)
                    If Not Success Then
                        ' UNEXPECTED ERROR
                        mdlLog.AppendLog "PROC_ERR", errMsg, vLogCallerID, 5, vCompanyInfoID
                        Update_Process_B = False
                        Exit Function
                    End If
                    
                    'is the LAST inspection order IN PROGRESS ...
                    If LinkData.IsNewCustomer Then
                        ' no inspection order history - use seed data to create new inspection order.
                        UpdateStats.ReadyToProcess = UpdateStats.ReadyToProcess + 1
                        ' ****************************************************
                        ' TOOLBOX will ASSERT DoReseed for this NEW CUSTOMERS
                        ' ****************************************************
                        If LinkData.DoReseed = False Then
                            LinkData.DoReseed = True
                        End If
                        ' ****************************************************
                        Success = Update_Process_C(dblServiceInterval)
                        If Not Success Then
                            UpdateStats.Warnings = UpdateStats.Warnings + 1
                        End If
                    Else
                        If LinkData.LastInProgress = True Then
                            ' don't accept prev inspection orders that are have work to be done!
                            UpdateStats.Skipped = UpdateStats.Skipped + 1
                        Else
                            If LinkData.DoReseed = True Then
                                ' does the SeedDate conflict with the last inspection requestby date?
                                Success = LinkData.SeedDatePreDateLastInspection()
                                If Not Success Then
                                    errMsg = _
                                           "Attempted to Re-Seed a return Customer but there was a conflict." & _
                                           vbCrLf & "The SeedDate in CustSite ID:" & CStr(.Fields("CustSiteID")) & " pre-dates the last inspection order RequestedBy." & _
                                           vbCrLf & "Locate the LINK and submit a new SeedDate."
                                    UpdateStats.Errors = UpdateStats.Errors + 1
                                    Update_Process_B = False
                                    Exit Function
                                Else
                                    Success = Update_Process_C(dblServiceInterval)
                                    If Not Success Then
                                        UpdateStats.Warnings = UpdateStats.Warnings + 1
                                    End If
                                End If
                            Else
                                UpdateStats.ReadyToProcess = UpdateStats.ReadyToProcess + 1
                                Success = Update_Process_C(dblServiceInterval)
                                If Not Success Then
                                    UpdateStats.Warnings = UpdateStats.Warnings + 1
                                End If
                            End If
                        End If
                    End If
    
                Else
                    ' DISBALED CustSite.
                    ' ----------------------------------------
                    UpdateStats.Disabled = UpdateStats.Disabled + 1
                End If 'end IsEnabled
                
JUMP_001:
                .MoveNext
                str = vbNullString
                str = str & "Starting Inspection Update... "
                str = str & vbCrLf & "Service Interval : " & Format(dblServiceInterval, "00")
                str = str & " : " & Format(PROGRESS.xValue, "0000")
                str = str & " / " & Format(PROGRESS.xMax, "0000")
                PROGRESS.lblCaption.Caption = str
                PROGRESS.xIncrement
                
                ' DoEvents

            Loop
        End With
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " UpdateInspectionOrders" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Update_Process_B = False
    Resume PROC_EXIT

End Function

' *******************************
' R E L A T I V E
' *******************************
Private Function Update_Process_C(dblServiceInterval As Double) As Boolean
    Dim WarnErr As Integer
    Dim NextRequestedDT As Date
    Dim NextLevelNum As Integer

    
    If LinkData Is Nothing Then Exit Function
    If UpdateStats Is Nothing Then Exit Function
    
    Update_Process_C = False
    
    NextRequestedDT = LinkData.CalcNextInspection(NextLevelNum, WarnErr, True)
    If (WarnErr = 0) Then
        ' ****************************************************************************
        ' BUILD AN INSPECTION ORDER FOR THE CUSTSITE ....
        mdlInspection.CreateInspectionOrder LinkData.CustSiteID, NextRequestedDT, dblServiceInterval, NextLevelNum
        If LinkData.IsNewCustomer Then
            UpdateStats.NewCustomers = UpdateStats.NewCustomers + 1
        End If
        UpdateStats.OrdersBuilt = UpdateStats.OrdersBuilt + 1
        ' ***************************************************************************
    End If
    
    If WarnErr > 0 Then
        LinkData.DisableCustSite
        ' send an error message to log?
        mdlLog.AppendLog ModuleName & " - UPDATE - CALC NEXT", _
                         "The customer site LINK ID: " & CStr(LinkData.CustSiteID) & _
                         vbCrLf & "While calculating the NEXT values for RequestedDT and LevelNum" & _
                         vbCrLf & "an error occurred. The inspection order wasn't created." & _
                         vbCrLf & "The LINK was disabled!", _
                         vLogCallerID, 4, vCompanyInfoID
    Else
        Update_Process_C = True
    End If
    
    ' ASSERT - CLEAR the reseed flag - even on errors
    ' ******************************
    LinkData.ClearDoReseed
    ' ******************************
    
    '    If WarnErr > 0 Then
    '        UpdateStats.Errors = UpdateStats.Errors + 1
    '    End If

End Function


