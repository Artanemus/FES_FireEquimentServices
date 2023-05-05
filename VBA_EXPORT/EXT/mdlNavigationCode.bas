Attribute VB_Name = "mdlNavigationCode"
Option Compare Database
'@Folder "MODULE"
Option Explicit

Public Sub cmdNav_Close()

    'button to close down the current form
    '(prompting to save changes)
    DoCmd.Close acForm, Screen.ActiveForm.Name, acSavePrompt
    
End Sub

Public Sub cmdNav_First()

    'button to go to the first record
    Screen.ActiveForm.AllowAdditions = False
    DoCmd.RunCommand acCmdRecordsGoToFirst
    
End Sub

Public Function cmdNav_Last()

    'button to go to the last record
    Screen.ActiveForm.AllowAdditions = False
    DoCmd.RunCommand acCmdRecordsGoToLast
    
End Function

Public Sub cmdNav_NewSurvey()
    Dim intResponse As Integer
    Dim s As String
    ' this routine may have been call via SwitchBoard
    ' prior to calling here the form was switch to _Customer
    ' ASSERT _Customer is the active form
    If Screen.ActiveForm.Name = "_Survey" Then
        s = mdlCompany.GetCompanyCode
        intResponse = MsgBox("Create a new site survey order? " & _
                             vbCrLf & "(You'll need a customer and site to complete the order!)", _
                             vbYesNo Or vbQuestion Or vbDefaultButton2, _
                             s & " - Create New Site Survey.")
        If intResponse = vbYes Then
            'create new record
            Screen.ActiveForm.AllowAdditions = True
            If Not Screen.ActiveForm.NewRecord Then
                DoCmd.RunCommand acCmdRecordsGoToNew
            End If
        End If
    End If
    
End Sub

Public Sub cmdNav_NewCust()
    Dim intResponse As Integer
    Dim s As String
    ' this routine may have been call via SwitchBoard
    ' prior to calling here the form was switch to _Customer
    ' ASSERT _Customer is the active form
    If Screen.ActiveForm.Name = "_Customer" Then
        s = mdlCompany.GetCompanyCode
        intResponse = MsgBox("Create a new customer? " & _
                             vbCrLf & "(Please check that the customer doesn't already exist!)", _
                             vbYesNo Or vbQuestion Or vbDefaultButton2, _
                             s & " - Create New Customer.")
        If intResponse = vbYes Then
            'create new record
            Screen.ActiveForm.AllowAdditions = True
            If Not Screen.ActiveForm.NewRecord Then
                DoCmd.RunCommand acCmdRecordsGoToNew
            End If
        End If
    End If
    
End Sub

Public Sub cmdNav_NewHR()
    Dim intResponse As Integer
    Dim s As String
    ' this routine may have been call via SwitchBoard
    ' prior to calling here the form was switch to _Customer
    ' ASSERT _Customer is the active form
    If Screen.ActiveForm.Name = "_HR" Then
        s = mdlCompany.GetCompanyCode
        intResponse = MsgBox("Create a new Human Resource (HR)? " & _
                             vbCrLf & "(Please check that the HR doesn't already exist!)", _
                             vbYesNo Or vbQuestion Or vbDefaultButton2, _
                             s & " - Create New Human Resource.")
        If intResponse = vbYes Then
            'create new record
            Screen.ActiveForm.AllowAdditions = True
            If Not Screen.ActiveForm.NewRecord Then
                DoCmd.RunCommand acCmdRecordsGoToNew
            End If
        End If
    End If
    
End Sub

Public Sub cmdNav_NewSite()
    Dim intResponse As Integer
    Dim s As String
    ' this routine may have been call via SwitchBoard
    ' prior to calling here the form was switch to _Customer
    ' ASSERT _Customer is the active form
    If Screen.ActiveForm.Name = "_Site" Then
        s = mdlCompany.GetCompanyCode
        intResponse = MsgBox("Create a new Site? " & _
                             vbCrLf & "(Please check that the site doesn't already exist!)", _
                             vbYesNo Or vbQuestion Or vbDefaultButton2, _
                             s & " - Create New Site.")
        If intResponse = vbYes Then
            'create new record
            Screen.ActiveForm.AllowAdditions = True
            If Not Screen.ActiveForm.NewRecord Then
                DoCmd.RunCommand acCmdRecordsGoToNew
            End If
        End If
    End If
    
End Sub


Public Sub cmdNav_NewEquip()
    Dim intResponse As Integer
    Dim s As String
    ' this routine may have been call via SwitchBoard
    ' prior to calling here the form was switch to _Customer
    ' ASSERT _Customer is the active form
    If Screen.ActiveForm.Name = "_Equipment" Then
        s = mdlCompany.GetCompanyCode
        intResponse = MsgBox("Create a new Equipment item? " & _
                             vbCrLf & "(Please check that the equipment doesn't already exist!)", _
                             vbYesNo Or vbQuestion Or vbDefaultButton2, _
                             s & " - Create New Equipment.")
        If intResponse = vbYes Then
            'create new record
            Screen.ActiveForm.AllowAdditions = True
            If Not Screen.ActiveForm.NewRecord Then
                DoCmd.RunCommand acCmdRecordsGoToNew
            End If
        End If
    End If
    
End Sub
Public Sub cmdNav_Prev()
    'if can't go to previous record, assume on first
    On Error GoTo PROC_ERR
    'button to go to the previous record
    Screen.ActiveForm.AllowAdditions = False
    DoCmd.RunCommand acCmdRecordsGoToPrevious
PROC_EXIT:
    On Error Resume Next
    Exit Sub
PROC_ERR:
    Beep
    Resume PROC_EXIT
End Sub

Public Sub cmdNav_Next()
    'if can't go to next record, assume on last
    On Error GoTo PROC_ERR
    'button to go to the previous record
    Screen.ActiveForm.AllowAdditions = False
    DoCmd.RunCommand acCmdRecordsGoToNext
PROC_EXIT:
    On Error Resume Next
    Exit Sub
PROC_ERR:
    Beep
    Resume PROC_EXIT
End Sub

Public Sub cmdNav_ToggleFilter()
    Dim i As Integer
    Dim lngPK As Long
    Dim strPK As String
    Dim f As Form
    Dim msg As String
    Dim passed As Boolean
    Dim IsNewRecord As Boolean
    
    On Error GoTo PROC_ERR
    
    lngPK = 0
    passed = False
    IsNewRecord = False
    Set f = Screen.ActiveForm.Form
    
    If Not f.NewRecord Then
        Select Case Screen.ActiveForm.Name
        Case "_Customer"
            lngPK = f!CustomerID
            strPK = "CustomerID"
            passed = True
        Case "_HR"
            lngPK = f!HRID
            strPK = "HRID"
            passed = True
        Case "_Site"
            lngPK = f!SiteID
            strPK = "SiteID"
            passed = True
        Case "_SiteSurvey"
            lngPK = f!SiteSurveyID
            strPK = "SiteSurveyID"
            passed = True
        End Select
    End If
    
    If Screen.ActiveForm.FilterOn Then
        Screen.ActiveForm.FilterOn = False
        'Screen.ActiveForm.Refresh
    Else
        i = Len(Nz(Screen.ActiveForm.Filter, 0))
        If (i <> 0) Then
            Screen.ActiveForm.FilterOn = True
            'Screen.ActiveForm.Refresh
        End If
    End If
    
    ' attempt a cue to record
    If Not f.NewRecord Then
        If (lngPK > 0) And (passed = True) Then
            With f.RecordsetClone
                .FindFirst "[" & strPK & "]=" & lngPK
                If Not .NoMatch Then
                    If f.Dirty Then
                        f.Dirty = False
                    End If
                    f.Bookmark = .Bookmark
                End If
            End With
        End If
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = "mdlNavigationCode cmdNav_ToggleFilter" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.SOURCE & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
End Sub

Public Sub cmdNav_SwitchToForm(FormNameToUseStr As String)
    Dim msg As String
    On Error GoTo PROC_ERR

    If Not mdlToolBox.IsLoaded(FormNameToUseStr) Then
        DoCmd.OpenForm FormNameToUseStr, acNormal
    End If
    DoEvents
    
    ' WAS WORKING NOW DOESN"T !!!!!!
    Forms(FormNameToUseStr).SetFocus
    Forms(FormNameToUseStr).FilterOn = False
    

PROC_EXIT:
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = "mdlNavigationCode cmdNav_SwitchToForm" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.SOURCE & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Sub

Public Sub cmdNav_SwitchToKeyBoardShortCuts()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_KeyBoardShortCuts"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToInpectScheduleForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_InspectSchedule"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToSiteSurveyForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_Survey"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToSurveyFindForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_SurveyFind"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToInspectionOrder()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_InspectOrder"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToInspectOrderFindForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_InspectOrderFind"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToCompanyInfoForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_CompanyInfo"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToGlobalForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_Global"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToEquipForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_Equipment"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToEquipFindForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_EquipFind"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToSiteForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_Site"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToSiteFindForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_SiteFind"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToCustomerForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_Customer"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToCustFindForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_CustFind"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToHRForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_HR"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub

Public Sub cmdNav_SwitchToHRFindForm()
    Dim FormNameToUseStr As String
    FormNameToUseStr = "_HRFind"
    cmdNav_SwitchToForm FormNameToUseStr
End Sub


