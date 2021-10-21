Attribute VB_Name = "mdlLog"
Option Compare Database
Option Explicit


Const ModuleName As String = "mdlLog"
Const MAXRECORDS As Long = 100

Public Sub AppendLog(aTitle As String, _
        aDetail As String, _
        aCallerID As Long, _
        Optional aErrLevelID As Long = 1, _
        Optional aCompanyInfoID As Long = 1)
        
Dim SQL As String
Dim rst As Recordset
Dim dbs As Database
Dim Msg As String
On Error GoTo PROC_ERR

    Set dbs = CurrentDb

    ' count the number of records
    SQL = _
    "SELECT dbo_Log.LogID, dbo_Log.Title, dbo_Log.Detail, dbo_Log.CreatedOn, dbo_Log.CompanyInfoID, " & _
    "dbo_Log.LogCallerID, dbo_Log.LogErrLevelID FROM dbo_Log;"
    
    TrimStack aCompanyInfoID
    
    Set rst = dbs.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        rst.AddNew
        rst![Title] = aTitle
        rst![Detail] = aDetail
        rst![CreatedOn] = Now()
        rst![CompanyInfoID] = aCompanyInfoID 'default = 1
        ' Accept zero in aCallerID
        If aCallerID > 0 Then
            rst![LogCallerID] = aCallerID
        Else
            rst![LogCallerID] = Empty
        End If
        rst![LogErrLevelID] = aErrLevelID 'default = NONE
        rst.Update
    rst.Close
    dbs.Close
    
PROC_EXIT:
    Set rst = Nothing
    Set dbs = Nothing
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        Msg = ModuleName & " AppendLog" & vbCrLf & _
        "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox Msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT


End Sub

Public Sub ViewLog()
Dim Msg As String
Dim mOpenArgs As String
Dim aID As Long

On Error GoTo PROC_ERR
    aID = mdlCompany.GetCompanyInfoID()
    TrimStack aID
    mOpenArgs = CStr(aID)
    DoCmd.OpenForm "xDlgLog_View", , , , , acDialog, mOpenArgs
    DoCmd.Close acForm, "xDlgLog_View"
PROC_EXIT:
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        Msg = ModuleName & " ViewLog" & vbCrLf & _
        "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox Msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
End Sub

Public Function ClearLog() As Boolean
    Dim dbs As Database
    Dim Msg As String
    Dim intResponse As Integer
    Dim s As String

    On Error GoTo PROC_ERR
    ClearLog = False

    Set dbs = CurrentDb
    s = mdlCompany.GetCompanyCode()
    
    intResponse = MsgBox("Clear the log of all system messages? ", _
                         vbYesNo Or vbQuestion Or vbDefaultButton2, _
                         s & " - Clear Log?")
    If intResponse = vbYes Then
        ' clear the log of all records
        dbs.Execute "DELETE * FROM dbo_Log", dbFailOnError + dbSeeChanges
        ClearLog = True
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
    
        ClearLog = False
        
        Msg = ModuleName & "ClearLog" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox Msg, , "Error", err.HelpFile, err.HelpContext
        
    End If
    Resume PROC_EXIT
End Function

Public Function ExeClearLog() As Boolean
    Dim Msg As String
    On Error GoTo PROC_ERR
    ExeClearLog = False
    CurrentDb.Execute "DELETE * FROM dbo_Log", dbFailOnError + dbSeeChanges
    ExeClearLog = True
PROC_EXIT:
    On Error Resume Next
    Exit Function
PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        Msg = ModuleName & "ExeClearLog" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox Msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
End Function

Public Sub TrimStack(aCompanyInfoID As Long)
Dim SQL As String
Dim rst As Recordset
Dim dbs As Database
Dim Count As Long
Dim diff As Long
Dim Msg As String
Dim qdf As QueryDef
Dim fCreatedOn As Date

    On Error GoTo PROC_ERR

    If Nz(aCompanyInfoID, 0) = 0 Then
        Exit Sub
    End If
    
    Set dbs = CurrentDb
    Count = 0

    ' count the number of records
    SQL = "SELECT TOP " & CStr(MAXRECORDS) & " dbo_Log.* FROM dbo_Log WHERE (dbo_Log.CompanyInfoID = " & CStr(aCompanyInfoID) & " ) ORDER BY dbo_Log.CreatedOn DESC;"
    Set rst = dbs.OpenRecordset(SQL, dbOpenSnapshot, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        rst.MoveLast
        If Nz(rst.Fields("CreatedOn"), 0) > 0 Then
            Count = rst.RecordCount
            fCreatedOn = CDate(rst.Fields("CreatedOn"))
        End If
    End If
    rst.Close
    Set rst = Nothing

    ' FORMAT DATE STRING FOR SQL EXPRESSION
    If Count >= MAXRECORDS Then
        SQL = "DELETE * FROM dbo_Log WHERE (dbo_Log.CreatedOn < #" & Format(fCreatedOn, "mm/dd/yyyy hh:nn") & "#) AND (dbo_Log.CompanyInfoID = " & CStr(aCompanyInfoID) & " );"
        rst.Close
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
    End If
    
    
    
PROC_EXIT:
        Set dbs = Nothing
        Set rst = Nothing

    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        Msg = ModuleName & " TrimStack" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox Msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    

End Sub
