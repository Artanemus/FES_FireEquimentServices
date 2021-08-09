Attribute VB_Name = "mdlUpdate"
Option Compare Database
Option Explicit


Private vReturnValue As Variant
Private vOpenArgs As String
Private vCompanyInfoID As Long
Private vLogCallerID As Long
Private clsStats As clsUpdateStats
Private clsToolBox As clsUpdateToolBox

Const ModuleName As String = "mdlUpdate"


Public Property Get ReturnValue() As Variant
    ReturnValue = vReturnValue
End Property

Public Property Get Stats() As clsUpdateStats
    Stats = clsStats
End Property

Public Property Set Stats(RHS As clsUpdateStats)
    Set clsStats = RHS
End Property

                    
Public Sub AssignLink(CustSiteID As Long)
    If Not clsToolBox Is Nothing Then
        clsToolBox.AssignLink (CustSiteID)
    End If
End Sub

Public Function IsNewCustomer() As Boolean
    IsNewCustomer = False
    If Not clsToolBox Is Nothing Then
        IsNewCustomer = clsToolBox.IsNewCustomer
    End If
End Function

Public Function InspectionStatusID() As Long
    InspectionStatusID = 0
    If Not clsToolBox Is Nothing Then
        InspectionStatusID = clsToolBox.InspectionStatusID
    End If
End Function

Public Sub Update_Main()
    Dim msg As String
    Dim ProgressDlg As frmProgress
    Dim Success As Boolean

        
    On Error GoTo PROC_ERR
    
    ' create an stats class (Shared)
    Set clsStats = New clsUpdateStats
    Set clsToolBox = New clsUpdateToolBox
    vCompanyInfoID = mdlCompany.GetCompanyInfoID
    vLogCallerID = 1
    msg = vbNullString

    '#### Setup the UserForm - progress bar dialogue
    Set ProgressDlg = New frmProgress
    Load ProgressDlg
    ProgressDlg.lblTitle.Caption = "Update Inspection Orders."
    ProgressDlg.lblCaption.Caption = "..."
    
    '####  User Dialogue - execute - Update Inspection Orders? Yes/No?
    DoCmd.OpenForm "xDlgUpdate_Begin", , , , , acDialog
    DoCmd.Close acForm, "xDlgUpdate_Begin", acSaveNo
    ' User said YES
    If vReturnValue = 1 Then
    
        '#### Clear the system log file
        ProgressDlg.lblCaption.Caption = "Clear System Log..."
        ProgressDlg.Show
        DoEvents
        Success = mdlLog.ExeClearLog()
        If Success Then
            '#### Assert
            ProgressDlg.lblCaption.Caption = "Assert System Params..."
            DoEvents
            Success = Update_Assert(ProgressDlg, msg)
            If Success Then
                '#### ASSERT - That there is onnly 1 qualified inspection order per CustSite
                ProgressDlg.lblCaption.Caption = "Qualify Inspection Orders..."
                DoEvents
                Success = Update_Qualify(ProgressDlg, msg)
                If Success Then
                    '#### BEGIN PROCESS
                    ProgressDlg.lblCaption.Caption = "Starting Inspection Update..."
                    DoEvents
                    Success = Update_Process(ProgressDlg, msg)
                    ' hide the UserForm
                    ProgressDlg.Hide
                    If Success Then
                        '#### PROCESS COMPLETED -' display the RESULTS dlg
                        vOpenArgs = _
                                  CStr(clsStats.Total) & "|" & CStr(clsStats.Disabled) & "|" & _
                                  CStr(clsStats.Enabled) & "|" & CStr(clsStats.ReadyToProcess) & "|" & _
                                  CStr(clsStats.NewCustomers) & "|" & CStr(clsStats.OrdersBuilt) & "|" & _
                                  CStr(clsStats.Errors) & "|" & CStr(clsStats.Skipped) & "|" & CStr(clsStats.Warnings)
                     
                        DoCmd.OpenForm "xDlgInspect_UpdateStat", , , , , acDialog, vOpenArgs
                        DoCmd.Close acForm, "xDlgInspect_UpdateStat"
                    Else
                        '#### PROCESS FAILED
                        ' display the assert error message in the progressdlg
                        DoCmd.OpenForm "xDlgUpdate_ProcessFailed", , , , , acDialog, msg
                        DoCmd.Close acForm, "xDlgUpdate_ProcessFailed", acSaveNo
                    End If
                
                Else
                    ' hide the UserForm
                    ProgressDlg.Hide
                    ' display the assert error message in the progressdlg
                    DoCmd.OpenForm "xDlgUpdate_QualifyFailed", , , , , acDialog, msg
                    DoCmd.Close acForm, "xDlgUpdate_QualifyFailed", acSaveNo
                
                End If
            Else
                ' hide the UserForm
                ProgressDlg.Hide
                ' display the assert error message in the progressdlg
                DoCmd.OpenForm "xDlgUpdate_AssertFailed", , , , , acDialog, msg
                DoCmd.Close acForm, "xDlgUpdate_AssertFailed", acSaveNo
            End If
        End If
        
    End If
    
    
PROC_EXIT:
    'Cleanup
    ProgressDlg.Hide
    Unload ProgressDlg
    Set ProgressDlg = Nothing
    
    Set clsStats = Nothing
    Set clsToolBox = Nothing
    
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

Public Function Update_Process(ByRef ProgressDlg As frmProgress, ByRef fAssertMsg As String) As Boolean
    Dim SQL As String
    Dim dbs As Database
    Dim rst As Recordset
    Dim msg As String
    
    If clsToolBox Is Nothing Then Exit Function
    If clsStats Is Nothing Then Exit Function

    SQL = _
           "SELECT dbo_CustSite.CustSiteID, dbo_CustSite.CustomerID, dbo_CustSite.SiteID, " & _
           "dbo_CustSite.CreatedOn, dbo_CustSite.IsArchived, dbo_CustSite.IsEnabled " & _
           "FROM dbo_CustSite ORDER BY dbo_CustSite.CreatedOn DESC;"


    Set dbs = CurrentDb
    Set rst = dbs.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        rst.MoveLast
        clsStats.Total = rst.RecordCount
        With rst
            .MoveFirst
            Do Until .EOF
                If (!IsEnabled = True) Then
                    ' ENABLED CustSite.
                    ' ----------------------------------------
                    ' inc count for enabled customer sites
                    clsStats.Enabled = clsStats.Enabled + 1
                    
                    ' the toolbox finds the last qualified inspection order for the LINK
                    clsToolBox.AssignLink (![CustSiteID])

                    If clsToolBox.IsNewCustomer Then
                        ' no inspection order history - use seed data to create new inspection order.
                        clsStats.ReadyToProcess = clsStats.ReadyToProcess + 1

                        ' ****************************************************
                        ' TOOLBOX will ASSERT DoReseed for this NEW CUSTOMERS
                        ' ****************************************************
                        If clsToolBox.DoReseed = False Then clsToolBox.DoReseed = True
                        ' ****************************************************

                        Update_Relative
                    Else
                        ' previous order must be cancelled or completed to proceed
                        If clsToolBox.InspectionStatusID = 2 Or clsToolBox.InspectionStatusID = 3 Then
                            clsStats.ReadyToProcess = clsStats.ReadyToProcess + 1
                            ' -----------------------------------------------------
                            Update_Relative
                            ' -----------------------------------------------------
                        Else
                            ' WORK-IN-PROGRESS CustSite.
                            ' ----------------------------------------
                            clsStats.Skipped = clsStats.Skipped + 1
                        End If
                    End If

                Else
                    ' DISBALED CustSite.
                    ' ----------------------------------------
                    clsStats.Disabled = clsStats.Disabled + 1
                End If                           'end IsEnabled
                .MoveNext
            Loop
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
        msg = ModuleName & " Update_Process" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
    

End Function


' *******************************
' R E L A T I V E
' *******************************
Private Sub Update_Relative()
Dim ErrState As Integer
Dim WarnState As Integer
Dim NextRequestedDT As Date
Dim NextLevel As Integer

    
    If clsToolBox Is Nothing Then Exit Sub
    If clsStats Is Nothing Then Exit Sub

    ' this routine checks for
        ' NEW CUSTOMER
        ' Use the seeddate and seedlevel in the inspection order for the NextRequestedDT
        ' id a start level isn't found then ignored - not created
        ' CalcNextInspection(ByRef ErrState As Integer, ByRef WarnState As Integer, ByRef aLevelNum As Integer, Optional DoPostErr As Boolean = True)
        '
        '
    ' DoReSeed,
            ' User has requested a reseed of the inspection request date.
            ' (Done when the user re-enabled the customer site link.)
        '
        '
    ' Customer with at least one inspection order ...
    
    
    NextRequestedDT = clsToolBox.CalcNextInspection(ErrState, WarnState, NextLevel, True)
    If (ErrState = 0) Then
        ' ****************************************************************************
        ' BUILD AN INSPECTION ORDER FOR THE CUSTSITE ....
        mdlInspection.CreateInspectionOrder clsToolBox.CustSiteID, NextRequestedDT, NextLevel
        If clsToolBox.IsNewCustomer Then
            clsStats.NewCustomers = clsStats.NewCustomers + 1
        End If
        clsStats.OrdersBuilt = clsStats.OrdersBuilt + 1
        ' ***************************************************************************
    End If
    
    If ErrState > 0 Then
        clsToolBox.DisableCustSite
        ' send an error message to log?
        mdlLog.AppendLog ModuleName & " - CUSTOMER SITE WAS DISABLED!!!!!", _
                         "The customer site LINK ID: " & CStr(clsToolBox.CustSiteID) & " was DISABLED." & _
                         vbCrLf & "Re-enable and RE-SEED this LINK to fix the error!" & _
                         vbCrLf & "(A valid date is needed to 'seed' the inspection order.)", _
                          vLogCallerID, 4, vCompanyInfoID
        
    End If
    
    ' ASSERT - CLEAR the reseed flag - even on errors
    ' ******************************
    clsToolBox.ClearDoReseed
    ' ******************************
    
    If ErrState > 0 Then
        clsStats.Errors = clsStats.Errors + 1
    End If
    If WarnState > 0 Then
        clsStats.Warnings = clsStats.Warnings + 1
    End If

End Sub

Private Function Update_Qualify(ByRef ProgressDlg As frmProgress, ByRef fAssertMsg As String) As Boolean
    Dim msg As String
'    Dim SQL As String
'    Dim rst As Recordset
'    Dim Failed As Boolean
'    Dim str As String
    
    On Error GoTo PROC_ERR
    Update_Qualify = True 'NO ERRORS
    
'    Failed = False
'    fAssertMsg = vbNullString
'
'    ProgressDlg.Max = 3
'    ProgressDlg.value = 0
'    DoEvents
    
    
PROC_EXIT:
'    rst.Close
'    Set rst = Nothing
'    ProgressDlg.value = 0
'    DoEvents
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " Begin_Assert" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function


Private Function Update_Assert(ByRef ProgressDlg As frmProgress, ByRef fAssertMsg As String) As Boolean
    Dim SQL As String
    Dim rst As Recordset
    Dim msg As String
    Dim Failed As Boolean
    Dim str As String
    
    On Error GoTo PROC_ERR
    Update_Assert = True 'NO ERRORS
    Failed = False
    fAssertMsg = vbNullString
        
    ProgressDlg.Max = 3
    ProgressDlg.value = 0
    DoEvents
    
    ' ############ CHECK THE GLOBALS
    ProgressDlg.lblCaption.Caption = "Checking system globals..."
    ProgressDlg.value = 1
    DoEvents
    
    str = "Open the SYSTEM'S GLOBAL form and enter a valid value."
    DoEvents
    If mdlCompany.GetGlobalDefNumOfLevels Is Null Then
        fAssertMsg = "The GLOBAL value 'number of levels' is invalid."
        fAssertMsg = fAssertMsg & vbCrLf & str
        Update_Assert = False ' FAILED
        Exit Function
    End If
    
    If mdlCompany.GetGlobalDefStartLevel Is Null Then
        fAssertMsg = "The GLOBAL value 'default start level' is invalid."
        fAssertMsg = fAssertMsg & vbCrLf & str
        Update_Assert = False ' FAILED
        Exit Function
    End If
    
    ProgressDlg.lblCaption.Caption = "Checking Equipment Types..."
    ProgressDlg.value = 2
    DoEvents
    
    str = "Locate EquipmentType (see SYSTEM - GLOBALS) and enter a valid value."
    DoEvents
    ' ############ CHECK THE EQUIPMENTTYPE
    SQL = _
        "SELECT dbo_EquipType.EquipTypeID, dbo_EquipType.Caption, dbo_EquipType.MinorLifeCycle, " & _
        "dbo_EquipType.MinorLifeCycle, dbo_EquipType.NumOfLevels, dbo_EquipType.ServiceInterval " & _
        "FROM dbo_EquipType;"
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        Do While Not rst.EOF
            If rst.Fields("MinorLifeCycle") Is Null Or rst.Fields("MinorLifeCycle") Is Empty Then
                ' UNKNOWN state
                fAssertMsg = _
                           "The MinorLifeCycle in Equipment Type " & CStr(rst.Fields("Caption")) & _
                           " is UNKNOWN OR EMPTY." & vbCrLf & str
                Failed = True
                Exit Do
            End If
            If rst.Fields("MajorLifeCycle") Is Null Or rst.Fields("MajorLifeCycle") Is Empty Then
                ' UNKNOWN state
                fAssertMsg = _
                           "The MajorLifeCycle in Equipment Type " & CStr(rst.Fields("Caption")) & _
                           " is UNKNOWN OR EMPTY." & vbCrLf & str
                Failed = True
                Exit Do
            End If
            If rst.Fields("NumOfLevels") Is Null Or rst.Fields("NumOfLevels") Is Empty Then
                ' UNKNOWN state
                fAssertMsg = _
                           "The NumOfLevels in Equipment Type " & CStr(rst.Fields("Caption")) & _
                           " is UNKNOWN OR EMPTY." & vbCrLf & str
                Failed = True
                Exit Do
            End If
            If rst.Fields("ServiceInterval") Is Null Or rst.Fields("ServiceInterval") Is Empty Then
                ' UNKNOWN state
                fAssertMsg = _
                           "The ServiceInterval in Equipment Type " & CStr(rst.Fields("Caption")) & _
                           " is UNKNOWN OR EMPTY." & vbCrLf & str
                Failed = True
                Exit Do
            Else
                If rst.Fields("ServiceInterval") < 1 Or rst.Fields("ServiceInterval") > 12 Then
                    ' OUT OF BOUNDS
                    fAssertMsg = _
                               "The ServiceInterval in Equipment Type " & CStr(rst.Fields("Caption")) & _
                               " is OUT OF BOUNDS." & vbCrLf & str
                    Failed = True
                    Exit Do
                End If
            End If
        Loop
    Else
        ' NOTHING THERE !!!
        fAssertMsg = "The table 'EquipmentTypeID' is EMPTY."
        fAssertMsg = fAssertMsg & vbCrLf & "Locate the table and assign equipment types and their parameters."
        mdlLog.AppendLog ModuleName, fAssertMsg, vLogCallerID, 5, vCompanyInfoID
        Update_Assert = False ' FAILED
        Exit Function
    End If
    
    ' tidy -up
    rst.Close
    Set rst = Nothing
    
    ' BAD OR NULL VALUE in dbo_EquipType
    If Failed Then
        Update_Assert = False ' FAILED
        mdlLog.AppendLog ModuleName, fAssertMsg, vLogCallerID, 5, vCompanyInfoID
        ProgressDlg.value = 0
        DoEvents
        Exit Function
    End If
    
    
    ProgressDlg.lblCaption.Caption = "Checking SeedDates for LINKS..."
    str = "Locate the customer's site LINK and enter a valid value."
    ProgressDlg.value = 3
    DoEvents
    
    ' ******************************************************************
    ' check for SeedDate in Site ACROSS valid 'ENABLED' CustSites
    ' ******************************************************************
    SQL = _
        "SELECT dbo_CustSite.CustSiteID, dbo_CustSite.SeedDate, dbo_CustSite.SeedLevel " & _
        "FROM dbo_CustSite " & _
        "WHERE (((dbo_CustSite.IsEnabled) = True) And ((dbo_CustSite.IsArchived) = False)) " & _
        "ORDER BY dbo_CustSite.CustSiteID;"
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        Do While Not rst.EOF
            ' ######## test for valid SeedDate
            If rst.Fields("SeedDate") Is Null Then
                ' UNKNOWN state
                fAssertMsg = "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's start SeedDate is UNKNOWN."
                Failed = True
                Exit Do
            End If
            If rst.Fields("SeedDate") Is Nothing Then
                ' not assigned
                fAssertMsg = "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's start SeedDate is NOT ASSIGNED."
                Failed = True
                Exit Do
            End If
            If rst.Fields("SeedDate") Is Empty Then
                ' SeedDate has been assigned
                fAssertMsg = "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's start SeedDate is EMPTY."
                Failed = True
                Exit Do
            End If
            If CDbl(rst.Fields("SeedDate")) < 0 Then
                ' Illegal seeddate in CustSite
                fAssertMsg = "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's start SeedDate value is ILLEGAL."
                Failed = True
                Exit Do
            End If
            If Not IsDate(rst.Fields("SeedDate")) Then
                ' Illegal seeddate in CustSite
                fAssertMsg = "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's start SeedDate value ISN'T a DATE."
                Failed = True
                Exit Do
            End If
            ' ######## test for valid SeedLevel
            If rst.Fields("SeedLevel") Is Null Then
                ' UNKNOWN state
                fAssertMsg = "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's start SeedLevel is UNKNOWN."
                Failed = True
                Exit Do
            End If
            If rst.Fields("SeedLevel") Is Nothing Then
                ' not assigned
                fAssertMsg = "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's start SeedLevel is NOT ASSIGNED."
                Failed = True
                Exit Do
            End If
            If rst.Fields("SeedLevel") Is Empty Then
                ' SeedDate has been assigned
                fAssertMsg = "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's start SeedLevel is EMPTY."
                Failed = True
                Exit Do
            End If
            If CInt(rst.Fields("SeedLevel")) < 1 Then
                ' Illegal seeddate in CustSite
                fAssertMsg = "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's start SeedLevel value is ILLEGAL."
                Failed = True
                Exit Do
            End If
            If CInt(rst.Fields("SeedLevel")) > mdlCompany.GetGlobalDefNumOfLevels Then
                ' Illegal seeddate in CustSite
                fAssertMsg = "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's start SeedLevel is greater than the MAX NUMBER OF LEVELS."
                Failed = True
                Exit Do
            End If
            
        Loop
    End If
    If Failed Then
        Update_Assert = False ' FAILED
        mdlLog.AppendLog ModuleName, fAssertMsg, vLogCallerID, 5, vCompanyInfoID
        ProgressDlg.value = 0
        DoEvents
    End If
    
PROC_EXIT:
    rst.Close
    Set rst = Nothing
    ProgressDlg.value = 0
    DoEvents
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " Begin_Assert" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function







