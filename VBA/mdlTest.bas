Attribute VB_Name = "mdlTest"
Option Compare Database
Option Explicit

Private mReturnValue As Variant

Const ModuleName As String = "mdlTest"


Public Property Get ReturnValue() As Variant
    If IsObject(mReturnValue) Then
        Set ReturnValue = mReturnValue
    Else
        ReturnValue = mReturnValue
    End If
End Property

Public Property Let ReturnValue(ByVal RHS As Variant)
    mReturnValue = RHS
End Property

Public Property Set ReturnValue(ByVal RHS As Variant)
    Set mReturnValue = RHS
End Property

Public Sub ReBuildTestEquip(ByVal aInspectionOrderID As Long)
    ReBuildTestGeneric aInspectionOrderID, 1
End Sub

Public Sub ReBuildTestLight(ByVal aInspectionOrderID As Long)
    ReBuildTestGeneric aInspectionOrderID, 2
End Sub



Public Sub ReBuildTestGeneric(ByVal aInspectionOrderID As Long, aStationTypeID As Integer)
    Dim s As String
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim rs2 As DAO.Recordset
    Dim db As DAO.Database
    Dim msg As String
    Dim intResponse As Integer
    Dim cCode As String
    Dim aStationTypeStr As String
    Dim aSiteID As Variant

    On Error GoTo PROC_ERR
    
    mReturnValue = 0
    
    If aStationTypeID = 1 Then
        aStationTypeStr = "EQUIPMENT"
    Else
        aStationTypeStr = "LIGHTS"
    End If
    
    ' SNIP-ITS for different station types
    ' " & cstr(aStationTypeID) & "
    ' " & aStationTypeStr & "
    
    If aInspectionOrderID > 0 Then
        ' checklist contains test records
        Set db = CurrentDb
        strSQL = _
               "SELECT dbo_Test.TestID " & _
               "FROM dbo_Test INNER JOIN dbo_Station ON dbo_Test.StationID = dbo_Station.StationID " & _
               "WHERE (((dbo_Test.InspectionOrderID)=" & CStr(aInspectionOrderID) & ") AND ((dbo_Station.StationTypeID)=" & CStr(aStationTypeID) & "));"
        
        Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If rs.RecordCount > 0 Then
        
            ' MESSAGE ...
            cCode = mdlCompany.GetCompanyCode
            intResponse = MsgBox("Re-Build the " & aStationTypeStr & " checklist for the inspection order? " & _
                                 vbCrLf & "(All test results that have been entered will be lost!)", _
                                 vbYesNo Or vbQuestion Or vbDefaultButton2, _
                                 cCode & " - Re-Build Check List.")
            If intResponse = vbYes Then
            
                'clear out the current test records for the given inspection order ...
                ' ---------------------------------------------------------------------
                strSQL = _
                       "DELETE dbo_Test.* " & _
                       "FROM dbo_Test INNER JOIN dbo_Station ON dbo_Test.StationID = dbo_Station.StationID " & _
                       "WHERE (((dbo_Test.InspectionOrderID)=" & CStr(aInspectionOrderID) & ") AND ((dbo_Station.StationTypeID)=" & CStr(aStationTypeID) & "));"
            
                db.Execute strSQL, dbFailOnError + dbSeeChanges
                
                mReturnValue = 1
        
            Else
                ' --------------------------
                ' EXIT from subroutine ...
                ' --------------------------
                Beep
                On Error Resume Next
                Exit Sub
        
            End If
        
        End If
        
        rs.Close
        Set rs = Nothing
        
        
        ' iterate over the stations (filtered by StationTypeID) ...
        ' ... for the given site (found in the inspection order)
        ' ------------------------------------------------------------------------------------------
        aSiteID = DLookup("[SiteID]", "dbo_InspectionOrder", "InspectionOrderID = " & CStr(aInspectionOrderID))
        
        If Nz(aSiteID, 0) > 0 Then
        
            strSQL = _
                   "SELECT dbo_Station.StationID, dbo_Station.StationNum, dbo_Station.IsEmpty, dbo_Station.StationTypeID, dbo_Station.Location " & _
                   "FROM dbo_Station " & _
                   "WHERE ( " & _
                   "((dbo_Station.StationTypeID)=" & CStr(aStationTypeID) & ") AND " & _
                   "((dbo_Station.SiteID)=" & CStr(aSiteID) & ")" & _
                   ") ORDER BY dbo_Station.StationNum ASC;"

            ' Stations to iterate (ordered by station number
            ' -----------------------------------------------
            Set rs2 = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
            If rs2.RecordCount > 0 Then
    
                strSQL = "SELECT * FROM dbo_TEST"
                Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
                If Not IsNull(rs) Then
                    Do Until rs2.EOF
                        With rs
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
                MsgBox "The Site# " & s & " doesn't contain any " & aStationTypeStr & " stations! " & _
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
    Set rs = Nothing
    Set rs2 = Nothing
    Set db = Nothing
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




