Attribute VB_Name = "_REPOSITORY"
Option Compare Database
Option Explicit

Private mReturnValue As Variant
Const ModuleName As String = "REPOSITORY"

Public Sub GENERTIC_SUBROUTINE(ByVal aID As Long)
    Dim s As String
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim msg As String

    On Error GoTo PROC_ERR
    
    If aID > 0 Then
        Set db = CurrentDb
        strSQL = "Select * FROM dbo_TABLENAME"
        Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If Not IsNull(rs) Then
            With rs
                .AddNew
                ![ID] = aID
                .Update
                .Bookmark = .LastModified
                mReturnValue = ![ID]
            End With
        End If
    End If
    
PROC_EXIT:
    'Cleanup
    Set rs = Nothing
    Set db = Nothing
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " GENERTIC_SUBROUTINE" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
End Sub


Private Sub CmdDisplayReport_Click()
Dim msg As String
Dim strSQL As String
Dim d1 As Date
Dim d2 As Date
Dim s As String

On Error GoTo PROC_ERR

'    mReturnValue = 0
'    TOTRangeNonCore = 0
'    TOTRangeCore = 0
'
'
'    If IsNull(Me.Form![fIntervalSF]![Start]) Then
'        MsgBox "A start date is required", , "Program Attendance Report - ERROR"
'        Exit Sub
'    End If
'
'     'Filter String has dates in AMERICANIZED format
'    d1 = Format(Me.Form![fIntervalSF]![Start], "dd/mm/yyyy")
'    If Not IsNull(Me.Form![fIntervalSF]![End]) Then
'        d2 = Format(Me.Form![fIntervalSF]![End], "dd/mm/yyyy")
'    Else
'        d2 = Date
'    End If
'
'
'    d2 = mdlFunction.AdjustInterval(d2)
'
'     'clear the table
'    strSQL = "DELETE * FROM t_ProgAttendance"
'    CurrentDb.Execute (strSQL)
'
'    If LoadTable Then
'        s = d1 & "|" & d2 & "|" & CStr(TOTRangeNonCore) & "|" & CStr(TOTRangeCore)
'        DoCmd.OpenReport "RProgramAttendanceReport", acViewReport, "", , acNormal, s
'        mReturnValue = 1
'    End If
    
PROC_EXIT:
    On Error Resume Next
'    Me.Visible = False
    Exit Sub

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " CmdDisplayReport_Click # " & str(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    mReturnValue = 0
    Resume PROC_EXIT

    
End Sub




'You can either
'
'Use a query that has parameters and specify values for parameters provided that the query uses parameters.
'
'Dim dbs As DAO.Database
'Dim qdf As DAO.QueryDef
'Dim prm As DAO.Parameter
'Dim rst As DAO.Recordset
'
'Set qdf = CurrentDb.QueryDefs("qry_SomeQueryWithParameters")
'
'qdf.Parameters("SomeParam").Value = "whatever"
'
'Set rst = qdf.OpenRecordset
'or
'
'Specify a query name as the command and use the Filter property on the recordset
'
'    Dim rs As DAO.Recordset
'    Dim rsFiltered As DAO.Recordset
'
'
'    Set rs = CurrentDb.OpenRecordset(qry_SomeQueryWithoutParameters)
'
'    rs.Filter = "field1 > 30"
'    Set rsFiltered = rs.OpenRecordset




'Sub RequeryX2()
'
' Dim dbsNorthwind As Database
' Dim qdfTemp As QueryDef
' Dim prmCountry As Parameter
' Dim rstView As Recordset2
'
' Set dbsNorthwind = OpenDatabase("Northwind.mdb")
' Set qdfTemp = dbsNorthwind.CreateQueryDef("", _
' "PARAMETERS ViewCountry Text; " & _
' "SELECT FirstName, LastName, Country FROM " & _
' "Employees WHERE Country = [ViewCountry] " & _
' "ORDER BY LastName")
' Set prmCountry = qdfTemp.Parameters!ViewCountry
'
' qdfTemp.Parameters!ViewCountry = "USA"
' Debug.Print "Data after initial query, " & _
' [ViewCountry] = USA; " "
' Set rstView = qdfTemp.OpenRecordset
' Do While Not rstView.EOF
' Debug.Print " " & rstView!FirstName & " " & _
' rstView!LastName & ", " & rstView!Country
' rstView.MoveNext
' Loop
'
' ' Change query parameter.
' qdfTemp.Parameters!ViewCountry = "UK"
' ' QueryDef argument must be included so that the
' ' resulting Recordset reflects the change in the query
' ' parameter.
' rstView.Requery qdfTemp
' Debug.Print "Requery after changing parameter, " & _
' "[ViewCountry] = UK"
' Do While Not rstView.EOF
' Debug.Print " " & rstView!FirstName & " " & _
' rstView!LastName & ", " & rstView!Country
' rstView.MoveNext
' Loop
'
' rstView.Close
' dbsNorthwind.Close
'
'End Sub