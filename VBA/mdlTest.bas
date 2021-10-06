Attribute VB_Name = "mdlTest"
Option Compare Database
Option Explicit

Private vReturnValue As Variant

Const ModuleName As String = "mdlTest"


Public Property Get ReturnValue() As Variant
    If IsObject(vReturnValue) Then
        Set ReturnValue = vReturnValue
    Else
        ReturnValue = vReturnValue
    End If
End Property

Public Property Let ReturnValue(ByVal RHS As Variant)
    vReturnValue = RHS
End Property

Public Property Set ReturnValue(ByVal RHS As Variant)
    Set vReturnValue = RHS
End Property

Public Sub ClearAll(ByVal lngInspectionOrderID As Long)
Dim SQL As String
    ' #### DELETE ALL TEST RECORDS FOR SITE....
    SQL = _
           "DELETE dbo_Test.* " & _
           "FROM dbo_Test " & _
           "WHERE (( (dbo_Test.InspectionOrderID)=" & CStr(lngInspectionOrderID) & "));"
    CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
End Sub

Public Sub ClearSelected(ByVal lngInspectionOrderID As Long, ByVal lngCoreGroupID As Long)
Dim SQL As String
    'clear out the current test records for the given inspection order ...
    ' for a given Core Group ID
    ' ---------------------------------------------------------------------
    
'SELECT dbo_Test.TestID, dbo_Test.InspectionOrderID
'FROM (dbo_Test INNER JOIN dbo_Equipment ON dbo_Test.EquipmentID = dbo_Equipment.EquipmentID) INNER JOIN dbo_EquipType ON dbo_Equipment.EquipTypeID = dbo_EquipType.EquipTypeID
'WHERE (((dbo_EquipType.CoreGroupID)=1));

    SQL = _
           "DELETE dbo_Test.* " & _
           "FROM (dbo_Test INNER JOIN dbo_Equipment ON dbo_Test.EquipmentID = dbo_Equipment.EquipmentID) " & _
           "INNER JOIN dbo_EquipType ON dbo_Equipment.EquipTypeID = dbo_EquipType.EquipTypeID " & _
           "WHERE dbo_Test.InspectionOrderID = " & CStr(lngInspectionOrderID) & " AND dbo_EquipType.CoreGroupID = " & CStr(lngCoreGroupID)
    CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
End Sub


Public Sub ReBuildTestPortable(ByVal lngInspectionOrderID As Long)
Dim var As Variant
    vReturnValue = 0
    If IsLockedStatus(lngInspectionOrderID, True) Then Exit Sub
    
    var = DLookup("[SiteID]", "dbo_InspectionOrder", "[InspectionOrderID] = " & CStr(lngInspectionOrderID))
    If Nz(var, 0) <> 0 Then
        If CheckCoreGroupAssignment(CLng(var), 1) Then
            ReBuildTestGeneric lngInspectionOrderID, 1
        End If
    End If
End Sub

Public Sub ReBuildTestElectrical(ByVal lngInspectionOrderID As Long)
Dim var As Variant
    vReturnValue = 0
    If IsLockedStatus(lngInspectionOrderID, True) Then Exit Sub
    
    var = DLookup("[SiteID]", "dbo_InspectionOrder", "[InspectionOrderID] = " & CStr(lngInspectionOrderID))
    If Nz(var, 0) <> 0 Then
        If CheckCoreGroupAssignment(CLng(var), 2) Then
            ReBuildTestGeneric lngInspectionOrderID, 2
        End If
    End If
End Sub

Public Sub ReBuildTestWaterBase(ByVal lngInspectionOrderID As Long)
Dim var As Variant
    vReturnValue = 0
    If IsLockedStatus(lngInspectionOrderID, True) Then Exit Sub
    
    var = DLookup("[SiteID]", "dbo_InspectionOrder", "[InspectionOrderID] = " & CStr(lngInspectionOrderID))
    If Nz(var, 0) <> 0 Then
        If CheckCoreGroupAssignment(CLng(var), 3) Then
            ReBuildTestGeneric lngInspectionOrderID, 3
        End If
    End If
End Sub

Public Sub ReBuildTestStructual(ByVal lngInspectionOrderID As Long)
Dim var As Variant
    vReturnValue = 0
    If IsLockedStatus(lngInspectionOrderID, True) Then Exit Sub
    
    var = DLookup("[SiteID]", "dbo_InspectionOrder", "[InspectionOrderID] = " & CStr(lngInspectionOrderID))
    If Nz(var, 0) <> 0 Then
        If CheckCoreGroupAssignment(CLng(var), 4) Then
            ReBuildTestGeneric lngInspectionOrderID, 4
        End If
    End If
End Sub

Private Function IsLockedStatus(ByVal lngInspectionOrderID As Long, Optional ByVal DoMsg As Boolean = False) As Boolean
Dim var As Variant
Dim Passed As Boolean
    IsLockedStatus = False
    var = DLookup("[InspectionStatusID]", "dbo_InspectionOrder", "[InspectionOrderID] = " & CStr(lngInspectionOrderID))
    If Nz(var, 0) <> 0 Then
        If (CLng(var) = 3) Or (CLng(var) = 2) Then
            IsLockedStatus = True
            vReturnValue = 0
            If DoMsg Then
                Beep
                MsgBox "The Inspection Order : " & Format(CLng(lngInspectionOrderID), "0000") & " is CENCELLED or COMPLETED." & _
                        vbCrLf & "Finalized orders can't be modified and are locked.", _
                        vbOKOnly Or vbDefaultButton1, _
                        mdlCompany.GetCompanyCode() & " - Build Check List."
            End If
        End If
    End If
End Function

Public Sub ReBuildTestALLCoreGroups(ByVal lngInspectionOrderID As Long)
Dim intResponse As Integer
Dim iter As Integer
Dim cCode As String
Dim SQL As String
Dim msg As String
Dim varSiteID As Variant
Dim Success As Boolean
Dim rst As DAO.Recordset
            
    ' MESSAGE ...
    On Error GoTo PROC_ERR
    Success = False ' FAILED
    vReturnValue = vbNull ' FAILED
    cCode = mdlCompany.GetCompanyCode
    If IsLockedStatus(lngInspectionOrderID, True) Then Exit Sub
    
'    intResponse = MsgBox("Build ALL CORE GROUPS for this inspection order! " & _
'                         vbCrLf & "All test results that have been entered will be lost!" & _
'                         vbCrLf & "There is no undo for this operation.", _
'                         vbYesNo Or vbQuestion Or vbDefaultButton2, _
'                         cCode & " - Build ALL Check Lists.")
'    If intResponse = vbYes Then
    
    ' returns 1 on success
    DoCmd.OpenForm "xDlgInspectOrder_BuildAll", , , , , acDialog
    DoCmd.Close acForm, "xDlgInspectOrder_BuildAll", acSaveNo
    
    If vReturnValue = 1 Then
        varSiteID = DLookup("[SiteID]", "dbo_InspectionOrder", "[InspectionOrderID] = " & CStr(lngInspectionOrderID))
        If Nz(varSiteID, 0) = 0 Then
            ' UNEXPECTED SYSTEM ERROR
            MsgBox "The Site# " & Format(CLng(varSiteID), "0000") & " assigned to this LINK doesn't exist!" & _
                    vbCrLf & "Unable to proceed with re-build.", _
                    vbOKOnly Or vbDefaultButton1, _
                    cCode & " - Build Check List."
            On Error Resume Next
            Exit Sub
        End If
    
        If Not CheckALL_CoreGroupAssignment(CLng(varSiteID)) Then
            ' FAILED CHECKS .. error msg handled in CheckCoreGroupAssignment
            On Error Resume Next
            Exit Sub
        End If
        
        ' NOTE: sub uses no internal error checking - will call here (PROC_ERR:)
        ClearAll lngInspectionOrderID
        
        ' #### RE-BUILD
        ' iterate over core groups - re-build each station
        ' ------------------------------------------------------------------------------------------
        Set rst = CurrentDb.OpenRecordset("SELECT dbo_CoreGroup.CoreGroupID FROM dbo_CoreGroup", dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If rst.RecordCount > 0 Then
            Success = True
            Do While Not rst.EOF
                If Not ConstructTests(lngInspectionOrderID, CLng(varSiteID), CLng(rst.Fields("CoreGroupID")), True) Then
                    ' PERMIT MISSING STATIONS FOR COREGROUPs
                    ' FAIL (ON SYSTEM ERRORS ONLY)
                    Success = False
                    Exit Do
                End If
                rst.MoveNext
            Loop
        End If
    End If
    
    If Success Then
        vReturnValue = 1 ' SUCCESS
    Else
        vReturnValue = 0
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    vReturnValue = 0
    If err.Number <> 0 Then
        msg = ModuleName & " ReBuildTestALLCoreGroups" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
End Sub


Private Function CheckALL_CoreGroupAssignment(ByVal lngSiteID As Long) As Boolean
Dim Success As Boolean
Dim rst As DAO.Recordset
Dim msg As String
    On Error GoTo PROC_ERR
    CheckALL_CoreGroupAssignment = False
    Success = True
    ' ##### CHECK COREGROUP
    Set rst = CurrentDb.OpenRecordset("SELECT dbo_CoreGroup.CoreGroupID FROM dbo_CoreGroup", dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        Do While Not rst.EOF
            If Not CheckCoreGroupAssignment(lngSiteID, CLng(rst.Fields("CoreGroupID"))) Then
                Success = False
                Exit Do
            End If
            rst.MoveNext
        Loop
    Else
        ' UNEXPECTED SYSTEM ERROR
    End If
    rst.Close
    CheckALL_CoreGroupAssignment = Success
    Set rst = Nothing
PROC_EXIT:
    On Error Resume Next
    Exit Function
PROC_ERR:
    ' display the system error
    vReturnValue = 0
    If err.Number <> 0 Then
        msg = ModuleName & " CheckALL_CoreGroupAssignment" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
End Function

Private Function CheckCoreGroupAssignment(ByVal lngSiteID As Long, lngCoreGroupID As Integer) As Boolean
Dim Success As Boolean
Dim SQL As String
Dim rst As DAO.Recordset
Dim errMsg As String
Dim msg As String

    On Error GoTo PROC_ERR
    CheckCoreGroupAssignment = False    'FAILED
    Success = False
    SQL = _
    "SELECT dbo_Station.StationID, dbo_Station.SiteID, dbo_Station.CoreGroupID, dbo_EquipType.CoreGroupID " & _
    "FROM (dbo_Station INNER JOIN dbo_Equipment ON dbo_Station.EquipmentID = dbo_Equipment.EquipmentID) " & _
    "INNER JOIN dbo_EquipType ON dbo_Equipment.EquipTypeID = dbo_EquipType.EquipTypeID " & _
    "WHERE dbo_Station.SiteID = " & CStr(lngSiteID) & " AND (([dbo_Station].[CoreGroupID]<>[dbo_EquipType].[CoreGroupID]));"
    
   ' Does the Station's CoreGroup and the EquipmentID's coregroup don't match then ERROR
   
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        errMsg = _
               "The CoreGroupID for StationID: " & CStr(rst.Fields("StationID")) & " in SiteID: " & CStr(rst.Fields("SiteID")) & _
               vbCrLf & "doesn't match the assigned Equipment's CoreGroupID" & _
               vbCrLf & "The error must be corrected for the rountine to run."
        ' display the assert error message in the progressdlg
        DoCmd.OpenForm "xDlgUpdate_CheckFailed", , , , , acDialog, errMsg
        DoCmd.Close acForm, "xDlgUpdate_CheckFailed", acSaveNo
    Else
        CheckCoreGroupAssignment = True
    End If
    rst.Close
        
PROC_EXIT:
    'Cleanup
    Set rst = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " CheckCoreGroupAssignment" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
End Function


Public Sub ReBuildTestGeneric(ByVal lngInspectionOrderID As Long, lngCoreGroupID As Integer)
    Dim s As String
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim rs2 As DAO.Recordset
    Dim msg As String
    Dim intResponse As Integer
    Dim cCode As String
    Dim strCoreGroup As String
    Dim lngSiteID As Variant
    Dim v As Variant

    On Error GoTo PROC_ERR
    
    vReturnValue = 0
    
    v = DLookup("[Caption]", "dbo_CoreGroup", "[CoreGroupID] = " & CStr(lngCoreGroupID))
    If Not IsNull(v) Then
        strCoreGroup = CStr(v)
    End If
    
    ' SNIP-ITS for different station types
    ' " & cstr(lngCoreGroupID) & "
    ' " & strCoreGroup & "
    
    If lngInspectionOrderID > 0 Then
        ' checklist contains test records
        SQL = _
               "SELECT dbo_Test.TestID " & _
               "FROM (dbo_Test INNER JOIN dbo_Equipment ON dbo_Test.EquipmentID = dbo_Equipment.EquipmentID) INNER JOIN dbo_EquipType ON dbo_Equipment.EquipTypeID = dbo_EquipType.EquipTypeID " & _
               "WHERE dbo_Test.InspectionOrderID = " & CStr(lngInspectionOrderID) & " AND dbo_EquipType.CoreGroupID = " & CStr(lngCoreGroupID)
        
        Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If rst.RecordCount > 0 Then
            ' MESSAGE ...
            cCode = mdlCompany.GetCompanyCode
            intResponse = MsgBox("Build the " & strCoreGroup & " checklist for the inspection order? " & _
                                 vbCrLf & "(All test results that have been entered will be lost!)", _
                                 vbYesNo Or vbQuestion Or vbDefaultButton2, _
                                 cCode & " - Build Check List.")
            If Not (intResponse = vbYes) Then
                ' --------------------------
                ' EXIT from subroutine ...
                ' --------------------------
                Beep
                On Error Resume Next
                Exit Sub
            End If
        End If
        
        rst.Close
        Set rst = Nothing
        
            
        ClearSelected lngInspectionOrderID, lngCoreGroupID
                
        
        ' iterate over the stations (filtered by CoreGroupID) ...
        ' ... for the given site (found in the inspection order)
        ' ------------------------------------------------------------------------------------------
        lngSiteID = DLookup("[SiteID]", "dbo_InspectionOrder", "InspectionOrderID = " & CStr(lngInspectionOrderID))
        If Nz(lngSiteID, 0) > 0 Then
            If ConstructTests(lngInspectionOrderID, lngSiteID, lngCoreGroupID) Then
                ' SUCCESS
                vReturnValue = 1
            End If
        Else
            s = Format(CLng(lngSiteID), "0000")
            MsgBox "The Site# " & s & " assigned to this LINK doesn't exist!" & _
                    vbCrLf & "Unable to proceed with the re-build.", _
                    vbOKOnly Or vbDefaultButton1, _
                    cCode & " - Build Check List."
        
        End If
        
                                 ' break on invalid SiteID
    End If
    
PROC_EXIT:
    'Cleanup
    Set rst = Nothing
    Set rs2 = Nothing
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " ReBuildTestGeneric" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
End Sub

Private Function ConstructTests(ByVal lngInspectionOrderID As Long, ByVal lngSiteID As Long, ByVal lngCoreGroupID As Long, Optional ByVal IgnoreMissingErr As Boolean = False) As Boolean
    Dim s As String
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim rs2 As DAO.Recordset
    Dim rs3 As DAO.Recordset
    Dim msg As String
    Dim v As Variant
    Dim strCoreGroup As String
    Dim dblServiceInterval As Double
    
    On Error GoTo PROC_ERR
    ConstructTests = False

    SQL = _
           "SELECT * " & _
           "FROM dbo_Station " & _
           "WHERE ( " & _
           "((dbo_Station.CoreGroupID)=" & CStr(lngCoreGroupID) & ") AND " & _
           "((dbo_Station.SiteID)=" & CStr(lngSiteID) & ")" & _
           ") ORDER BY dbo_Station.StationNum ASC;"
           
    ' Get the service interval for the inspection order
    v = DLookup("ServiceInterval", "dbo_InspectionOrder", "[InspectionOrderID] = " & CStr(lngInspectionOrderID))
    If Nz(v, 0) = 0 Then
        ' UNEXPECTED SYSTEM ERROR
        MsgBox "Unable to determine the Service Interval for the Inspection Order.", _
        vbOKOnly Or vbDefaultButton1, _
        mdlCompany.GetCompanyCode() & " - Build Check List."
        Exit Function
    Else
        dblServiceInterval = CDbl(v)
    End If

    ' Stations to iterate (ordered by station number
    ' -----------------------------------------------
    Set rs2 = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rs2.RecordCount > 0 Then
        SQL = "SELECT * FROM dbo_TEST"
        Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If Not IsNull(rst) Then
            Do While Not rs2.EOF
                ' LOOKUP the service interval for the equipment
                If Nz(rs2![EquipmentID], 0) <> 0 Then
                SQL = _
                    "SELECT dbo_Equipment.EquipmentID, dbo_EquipType.ServiceInterval " & _
                    "FROM dbo_Equipment INNER JOIN dbo_EquipType ON dbo_Equipment.EquipTypeID = dbo_EquipType.EquipTypeID " & _
                    "WHERE (((dbo_Equipment.EquipmentID)=" & CStr(rs2.Fields("EquipmentID")) & "));"
                    
                    Set rs3 = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
                    If rs3.RecordCount > 0 Then
                        If rs3.Fields("ServiceInterval") <> dblServiceInterval Then
                            ' SKIP THIS STATION - EQUIPMENT DOESN"T USE THE SERVICE INTERVAL USED BY THE INSPECTION ORDER.
                            GoTo JUMP_001
                        End If
                    Else
                        ' UNEXPECTED ERROR - NO EQUIPMENT DESCRIPTION
                        MsgBox "Unable to the find Service Interval for Equipment ID: " & CStr(rs3.Fields("EquipmentID")) & ".", _
                        vbOKOnly Or vbDefaultButton1, _
                        mdlCompany.GetCompanyCode() & " - Build Check List."
                        rs3.Close
                        rs2.Close
                        rst.Close
                        Exit Function
                    End If

                End If
            
                With rst
                    ' ##############################################################
                    ' #### TAKE A SNAP SHOT OF THE CURRENT STATE OF THE STATION
                    ' ##############################################################
                    .AddNew
                    .Fields("InspectionOrderID") = lngInspectionOrderID
                    ' NON-SPECIFIC RELATIONSHIP with the Reference Parent (the Station) that seeded this Test
                    ' As the site changes this reference may become useless.
                    .Fields("ReferenceID") = rs2.Fields("StationID")
                    ' USE THE CoreGroupID found in EquipmentID ... EquipmentTypeID ...
                    '.Fields("CoreGroupID") = rs2.Fields("CoreGroupID") ' TODO:
                    .Fields("StationNum") = rs2.Fields("StationNum")
                    .Fields("Location") = rs2.Fields("Location")
                    .Fields("IsManaged") = rs2.Fields("IsManaged") ' TODO:
                    
                    ' Empty stations doesn't require a test result and therefore passes
                    If Nz(rs2![EquipmentID], 0) = 0 Then
                        ![Note] = "EMPTY STATION"
                        ![Passed] = True
                        .Fields("EquipmentID") = Null
                    Else
                        ![Note] = vbNullString
                        ![Passed] = 0
                        .Fields("EquipmentID") = rs2.Fields("EquipmentID") ' CORE GROUP IS FOUND IN EquipmentID
                    End If
                    
                    ' TODO: Test life cycle ....
                    ' CALCULATE MINOR OR MAJOR life cycle for this Equipment as this station ....
                    '![TestLifeCycleID] = vbNull
                    ' Inspector populates this parameter
                    ' REPLACE, REPAIR OR RESUPPLY
                    '![TestActionID] = vbNull
            
                    .Update
                    
                    '.Bookmark = .LastModified
                    'ReturnValue = ![TestID]
                    
                End With
JUMP_001:
                rs2.MoveNext
            Loop
        End If                           ' break on invalid recorset
        ConstructTests = True
    Else
        ' used by BUILD ALL ....
        If IgnoreMissingErr = True Then
            ConstructTests = True
        Else
            v = DLookup("[Caption]", "dbo_CoreGroup", "[CoreGroupID] = " & CStr(lngCoreGroupID))
            If Not IsNull(v) Then
                strCoreGroup = CStr(v)
            Else
                strCoreGroup = "FES_ERROR"
            End If
    
            s = Format(CLng(lngSiteID), "0000")
            MsgBox "The SiteID: " & s & " doesn't contain any " & strCoreGroup & " stations.", _
                    vbOKOnly Or vbDefaultButton1, _
                    mdlCompany.GetCompanyCode() & " - Build Check List."
        End If

    End If                               ' break on rs2 zero recordcount

        
PROC_EXIT:
    'Cleanup
    Set rst = Nothing
    Set rs2 = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " ReBuildTestGeneric" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
End Function




