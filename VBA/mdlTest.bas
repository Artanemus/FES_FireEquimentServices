Attribute VB_Name = "mdlTest"
Option Compare Database
Option Explicit

Private vReturnvalue As Variant

Const ModuleName As String = "mdlTest"


Public Property Get ReturnValue() As Variant
    If IsObject(vReturnvalue) Then
        Set ReturnValue = vReturnvalue
    Else
        ReturnValue = vReturnvalue
    End If
End Property

Public Property Let ReturnValue(ByVal RHS As Variant)
    vReturnvalue = RHS
End Property

Public Property Set ReturnValue(ByVal RHS As Variant)
    Set vReturnvalue = RHS
End Property

Public Sub ReBuildTestEquip(ByVal aInspectionOrderID As Long)
    ReBuildTestGeneric aInspectionOrderID, 1
End Sub

Public Sub ReBuildTestLight(ByVal aInspectionOrderID As Long)
    ReBuildTestGeneric aInspectionOrderID, 2
End Sub



Public Sub ReBuildTestGeneric(ByVal aInspectionOrderID As Long, lngCoreGroup As Integer)
    Dim s As String
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim rs2 As DAO.Recordset
    Dim dbs As DAO.Database
    Dim msg As String
    Dim intResponse As Integer
    Dim cCode As String
    Dim strCoreGroup As String
    Dim aSiteID As Variant
    Dim v As Variant

    On Error GoTo PROC_ERR
    
    vReturnvalue = 0
    
    v = DLookup("[Caption]", "dbo_CoreGroup", CStr(lngCoreGroup))
    If Not IsNull(v) Then
        strCoreGroup = CStr(v)
    End If
    
    ' SNIP-ITS for different station types
    ' " & cstr(lngCoreGroup) & "
    ' " & strCoreGroup & "
    
    If aInspectionOrderID > 0 Then
        ' checklist contains test records
        Set dbs = CurrentDb
        SQL = _
               "SELECT dbo_Test.TestID " & _
               "FROM dbo_Test INNER JOIN dbo_Station ON dbo_Test.StationID = dbo_Station.StationID " & _
               "WHERE (((dbo_Test.InspectionOrderID)=" & CStr(aInspectionOrderID) & ") AND ((dbo_Station.CoreGroupID)=" & CStr(lngCoreGroup) & "));"
        
        Set rst = dbs.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If rst.RecordCount > 0 Then
        
            ' MESSAGE ...
            cCode = mdlCompany.GetCompanyCode
            intResponse = MsgBox("Re-Build the " & strCoreGroup & " checklist for the inspection order? " & _
                                 vbCrLf & "(All test results that have been entered will be lost!)", _
                                 vbYesNo Or vbQuestion Or vbDefaultButton2, _
                                 cCode & " - Re-Build Check List.")
            If intResponse = vbYes Then
            
                'clear out the current test records for the given inspection order ...
                ' ---------------------------------------------------------------------
                SQL = _
                       "DELETE dbo_Test.* " & _
                       "FROM dbo_Test INNER JOIN dbo_Station ON dbo_Test.StationID = dbo_Station.StationID " & _
                       "WHERE (((dbo_Test.InspectionOrderID)=" & CStr(aInspectionOrderID) & ") AND ((dbo_Station.CoreGroupID)=" & CStr(lngCoreGroup) & "));"
            
                dbs.Execute SQL, dbFailOnError + dbSeeChanges
                
                vReturnvalue = 1
        
            Else
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
        
        
        ' iterate over the stations (filtered by CoreGroupID) ...
        ' ... for the given site (found in the inspection order)
        ' ------------------------------------------------------------------------------------------
        aSiteID = DLookup("[SiteID]", "dbo_InspectionOrder", "InspectionOrderID = " & CStr(aInspectionOrderID))
        
        If Nz(aSiteID, 0) > 0 Then
        
            SQL = _
                   "SELECT dbo_Station.StationID, dbo_Station.StationNum, dbo_Station.IsEmpty, dbo_Station.CoreGroupID, dbo_Station.Location " & _
                   "FROM dbo_Station " & _
                   "WHERE ( " & _
                   "((dbo_Station.CoreGroupID)=" & CStr(lngCoreGroup) & ") AND " & _
                   "((dbo_Station.SiteID)=" & CStr(aSiteID) & ")" & _
                   ") ORDER BY dbo_Station.StationNum ASC;"

            ' Stations to iterate (ordered by station number
            ' -----------------------------------------------
            Set rs2 = dbs.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
            If rs2.RecordCount > 0 Then
    
                SQL = "SELECT * FROM dbo_TEST"
                Set rst = dbs.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
                If Not IsNull(rst) Then
                    Do Until rs2.EOF
                        With rst
                            .AddNew
                    
                            ![StationID] = rs2![StationID]
                            ' Empty stations doesn't require a test result and therefore pass
                            If Nz(rs2![IsEmpty], 0) > 0 Then
                                ![Note] = "EMPTY STATION"
                                ![Passed] = True
                            Else
                                ![Note] = vbNullString
                                ![Passed] = 0
                            End If
                            ![InspectionOrderID] = aInspectionOrderID
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
                        rs2.MoveNext
                    Loop
                End If                           ' break on invalid recorset
            Else
                s = Format(CLng(aSiteID), "0000")
                MsgBox "The Site# " & s & " doesn't contain any " & strCoreGroup & " stations! " & _
                        vbCrLf & "Unable to build the check-list.", _
                        vbOKOnly Or vbDefaultButton1, _
                        cCode & " - Re-Build Check List."
        
            End If                               ' break on rs2 zero recordcount
        Else
            s = Format(CLng(aSiteID), "0000")
            MsgBox "The Site# " & s & " assign in this Customer-Site LINK doesn't exist!" & _
                    vbCrLf & "Unable to proceed with re-build.", _
                    vbOKOnly Or vbDefaultButton1, _
                    cCode & " - Re-Build Check List."
        
        End If                                   ' break on invalid SiteID
    End If
    
PROC_EXIT:
    'Cleanup
    Set rst = Nothing
    Set rs2 = Nothing
    Set dbs = Nothing
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




