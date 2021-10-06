Attribute VB_Name = "mdlToolBox"
Option Compare Database
Option Explicit

Const ModuleName As String = "mdlToolBox"
Private vReturnValue As Variant

Public Property Let ReturnValue(X As Variant)
    vReturnValue = X
End Property

Public Property Get ReturnValue() As Variant
    ReturnValue = vReturnValue
End Property

Public Function LUCompanyInfoID() As Long
    LUCompanyInfoID = 1
End Function


Public Function LULogCallerID(ByVal aModuleName As String) As Long
Dim v As Variant
    LULogCallerID = 0
    v = DLookup("[LogCallerID]", "dbo_LogCaller", "[Caption] LIKE '%" & aModuleName & "%'")
    If Not IsNull(v) Then
        LULogCallerID = CLng(v)
    Else
        LULogCallerID = 0
    End If
End Function

Public Function MilitaryTime(aTime As Variant) As String
    Dim dtmMilitary As String
    dtmMilitary = vbNullString
    If Nz(aTime, 0) > 0 Then
        If Hour(aTime) < 10 Then
            dtmMilitary = "0" & Format(aTime, "hhnn")
        Else
            dtmMilitary = Format(aTime, "hhnn")
        End If
    End If
End Function



'Private Property Get HasParent(ByRef f As Form) As Boolean
'    HasParent = False
'    On Error GoTo handler
'    HasParent = TypeName(f.Parent.Name) = "String"
'    Exit Property
'handler:
'End Property

Public Function IsLoaded(ByVal strFormName As String) As Boolean
    ' Returns True if the specified form is open in Form view or Datasheet view.
    Dim oAccessObject As AccessObject
    
    On Error GoTo err_Exit

    Set oAccessObject = CurrentProject.AllForms(strFormName)
    If oAccessObject.IsLoaded Then
        If oAccessObject.CurrentView <> acCurViewDesign Then
            IsLoaded = True
        End If
    End If
    
err_Proc:
    On Error Resume Next
    Exit Function
    
err_Exit:
    IsLoaded = False
    GoTo err_Proc
    
End Function

Public Function CleanContactNum(aContactNum As String) As String
Dim rtnNumber As String
Dim msg As String

    On Error GoTo PROC_ERR
    
    'cleanup the phone number
    CleanContactNum = aContactNum
    rtnNumber = mdlToolBox.NumericOnly(aContactNum)
    If Len(rtnNumber) > 10 Then
        rtnNumber = Format(rtnNumber, "(+#) 00 0000 0000")
    ElseIf Len(rtnNumber) > 8 Then
        rtnNumber = Format(rtnNumber, "00 0000 0000")
    Else
        rtnNumber = Format(rtnNumber, "0000 0000")
    End If
    CleanContactNum = rtnNumber
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " CleanContactNum" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    
    Resume PROC_EXIT
    
End Function

Public Sub RequeryFormAndKeepCurrSelectedRecord(f As Form)
    Dim Position As Long
    Position = f.CurrentRecord
    f.Requery
    If Position > 1 Then
        f.Recordset.Move Position - 1
    End If
End Sub

Function AlphaNumericOnly(strSource As String) As String
    Dim i As Integer
    Dim strResult As String

    For i = 1 To Len(strSource)
        Select Case Asc(Mid(strSource, i, 1))
        Case 48 To 57, 65 To 90, 97 To 122:      'include 32 if you want to include space
            strResult = strResult & Mid(strSource, i, 1)
        End Select
    Next
    AlphaNumericOnly = strResult
End Function

'
' Skips all characters in the input string except digits
'
Function NumericOnly(ByVal s As String) As String
    Dim char As String
    Dim i As Integer
    NumericOnly = vbNullString
    For i = 1 To Len(s)
        char = Mid(s, i, 1)
        If char >= "0" And char <= "9" Then
            NumericOnly = NumericOnly + char
        End If
    Next i
End Function

Public Sub Form_DynamicResize(aForm As Form)
    'Me. was replaced with aForm.
    ''If Not mPassed Then Exit Sub

    'Variables
    Dim lngCount As Long
    Dim lngWindowHeight As Long
    Dim lngOldWindowHeight As Long
    Dim lngDeltaTop As Long
    Dim lngMaxRecordsToShow As Long
    Dim lngMinRecordsToShow As Long

    lngMaxRecordsToShow = 20
    lngMinRecordsToShow = 15

    'Find the amount of records in form
    Dim rst As DAO.Recordset
    Set rst = aForm.RecordsetClone
    If Not rst.EOF Then rst.MoveLast
    lngCount = rst.RecordCount

    'Assert Minimum height
    If lngCount <= lngMinRecordsToShow Then lngCount = lngMinRecordsToShow

    'Check whether there are more then Max amount of records
    If lngCount > lngMaxRecordsToShow Then
        lngCount = lngMaxRecordsToShow
        'Enable vertical scrollbar
        aForm.ScrollBars = 2                     'Vertical
    Else
        'Disable scrollbars
        aForm.ScrollBars = 0                     'None
    End If

    'Calculate new windowheight.
    'If you do not have a header/footer, or they are not visible adjust accordingly
    lngWindowHeight = aForm.FormHeader.Height + _
                      aForm.Detail.Height * lngCount + _
                      aForm.FormFooter.Height + _
                      567
    'The 567 is to account for title bar Height.
    'If you use thin border, adjust accordingly

    'The form will be "shortened" and we need to adjust the top property as well to keep it properly centered
    lngOldWindowHeight = aForm.WindowHeight
    lngDeltaTop = (lngOldWindowHeight - lngWindowHeight) / 2

    'Use the move function to move the form

    aForm.Move aForm.WindowLeft, aForm.WindowTop + lngDeltaTop, , lngWindowHeight

    'Cleanup
    Set rst = Nothing
End Sub


Public Function BuildArrayOfServiceIntervals(ByRef ArrayOfServiceIntervals() As Double, ByVal errMsg As String, ByVal LogCallerID As Long) As Boolean
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim msg As String
    Dim Failed As Boolean
    Dim str As String
    Dim v As Variant
    Dim i As Integer
    
    
    On Error GoTo PROC_ERR
    BuildArrayOfServiceIntervals = False ' FAILED
    Failed = False
    errMsg = vbNullString
    
    str = "Check that the dbo_EquipType table is correctly assigned."

    ' #### collect the service intervals being used
    SQL = _
        "SELECT dbo_EquipType.ServiceInterval FROM dbo_EquipType GROUP BY dbo_EquipType.ServiceInterval HAVING (((dbo_EquipType.ServiceInterval) Is Not Null));"
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    i = 0
    If rst.RecordCount > 0 Then
        ' count the number of service intervals
        Do While Not rst.EOF
            If rst.Fields("ServiceInterval") > 0 Then
                i = i + 1
            End If
        rst.MoveNext
        Loop
        ' EMPTY ARRAY ? - SET DYNAMIC ?
        ' TRIM UPPER BOUNDS to account for element ARRAY(0)
        i = i - 1
        ReDim ArrayOfServiceIntervals(i)
        i = 0
        rst.MoveFirst
        ' fill the array
        Do While Not rst.EOF
            If rst.Fields("ServiceInterval") > 0 Then
                ArrayOfServiceIntervals(i) = CDbl(rst.Fields("ServiceInterval"))
            End If
            rst.MoveNext
            i = i + 1
        Loop
    Else
        errMsg = "No service intervals were found in dbo_EquipType!" & _
        errMsg = errMsg & vbCrLf & str
        ' log this error
        mdlLog.AppendLog "BUILD-Array of Service Intervals", errMsg, LogCallerID, 5, LUCompanyInfoID()
        Failed = True
    End If
    
    rst.Close
    Set rst = Nothing
    
    If Not Failed Then
        BuildArrayOfServiceIntervals = True
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " BuildArrayOfServiceIntervals" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        mdlLog.AppendLog "PROC_ERR", msg, LogCallerID, 5, LUCompanyInfoID()
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT


End Function


Public Function HasServiceInterval(lngCustSiteID As Long, dblServiceInterval As Double) As Boolean
Dim msg
Dim SQL As String
Dim rst As DAO.Recordset
    
    On Error GoTo PROC_ERR
    HasServiceInterval = False
    SQL = _
        "SELECT dbo_CustSite.CustSiteID, dbo_EquipType.ServiceInterval " & _
        "FROM dbo_CustSite INNER JOIN (((dbo_Site INNER JOIN dbo_Station ON dbo_Site.SiteID = dbo_Station.SiteID) " & _
        "INNER JOIN dbo_Equipment ON dbo_Station.EquipmentID = dbo_Equipment.EquipmentID) " & _
        "INNER JOIN dbo_EquipType ON dbo_Equipment.EquipTypeID = dbo_EquipType.EquipTypeID) ON dbo_CustSite.SiteID = dbo_Site.SiteID " & _
        "GROUP BY dbo_CustSite.CustSiteID, dbo_EquipType.ServiceInterval " & _
        "HAVING (((dbo_CustSite.CustSiteID)=" & CStr(lngCustSiteID) & "));"

    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        Do While Not rst.EOF
            If rst.Fields("ServiceInterval") = dblServiceInterval Then
                HasServiceInterval = True
                Exit Do
            End If
            rst.MoveNext
        Loop
    End If
    
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " HasServiceInterval" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function


' this routine was moved into the toolbox as it's shared by UPDATE and ENABLED
Public Function HasMultiInProgress(ByVal lngCustSiteID As Long, ByVal dblServiceInterval As Double, ByRef errMsg As String) As Boolean
    Dim v As Variant
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim msg As String
    Dim Failed As Boolean
    Dim Success As Boolean
    Dim iter As Integer
    
    On Error GoTo PROC_ERR
    HasMultiInProgress = True
    Failed = False
    
    ' ########## Check for multi-inspection order that are 'IN PROGRESS'
    ' ##########    with consideration to Service Interval

        ' look for in progress orders with identical service intervals
        SQL = _
            "SELECT InspectionOrderID " & _
            "FROM dbo_InspectionOrder " & _
            "WHERE (dbo_InspectionOrder.CustSiteID = " & CStr(lngCustSiteID) & " ) AND " & _
            "((dbo_InspectionOrder.InspectionStatusID <> 2) AND (dbo_InspectionOrder.InspectionStatusID <> 3))  AND " & _
            "(dbo_InspectionOrder.ServiceInterval = " & CStr(dblServiceInterval) & ")"
            
        Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If rst.RecordCount > 0 Then
            rst.MoveLast
            If rst.RecordCount > 1 Then
                Failed = True
                errMsg = _
                       "Unable to enable the site as the customer has" & vbCrLf & _
                       "outstanding inspection orders with a status of 'IN PROGRESS'." & vbCrLf & _
                       "Fix this issue by setting CANCELLED or COMPLETED." & vbCrLf & _
                       "The action was abort."
                mdlLog.AppendLog "Enable Customer Site.", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
            End If
            rst.Close
        End If
        Set rst = Nothing

    
    If Not Failed Then
        HasMultiInProgress = False
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







