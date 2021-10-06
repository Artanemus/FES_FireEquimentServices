Attribute VB_Name = "mdlBatchPrint"
Option Compare Database
Option Explicit

'Private Const OptionalRootPath As String = "C:\FES\Schedule\"
Private Const ModuleName As String = "mdlBatchPrint"
Private vReturnValue As Variant
Private lngStatusID As Long
Private ProgBarForm As frmProgress

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

Public Property Let StatusID(ByVal RHS As Long)
    lngStatusID = RHS
End Property


'Public Property Set ReturnValue(ByVal RHS As Variant)
'    Set vReturnValue = RHS
'End Property

Function dmwListAllReports() As String
    On Error GoTo errHandler
    Dim msg$
    Dim rpt As Access.Report, dB As Object
    
    Set dB = Application.CurrentProject
    For Each rpt In Reports
    Debug.Print rpt.Name
    Next rpt
    msg$ = "Reports listing complete"
procDone:
    dmwListAllReports = msg$
    Exit Function
    
errHandler:
    msg$ = err.Number & " " & err.Description
    Resume procDone

End Function

'Then in its Immediate Window type ?dmwListAllReports and press Enter. The leading question mark is essential.

'Dim rpt As Report
'For Each rpt In Reports
'    Debug.Print rpt.Name
'Next
'will only iterate through Reports that are currently open. To iterate through all reports you need to do
'
'Dim rpt As Object
'For Each rpt In Application.CurrentProject.AllReports
'    Debug.Print rpt.Name
'Next


Public Function BatchPrintRptTech(ByVal dtDate As Date) As Boolean
Dim obj As AccessObject
Dim rptReport As Access.Report
Dim lngInspectionOrderID As Long
Dim SQL As String
Dim intMonth As Integer
Dim intYear As Integer
Dim rst As DAO.Recordset
Dim outputFile As String
Dim msg As String
Dim strInspectOrder As String
Dim strCustID As String
Dim strFolder As String
Dim TechName As String
Dim RootPath As Variant
Dim v As Variant

    On Error GoTo PROC_ERR
    
    intYear = DatePart("YYYY", dtDate)
    intMonth = DatePart("m", dtDate)
    BatchPrintRptTech = False
    ' Find the globals
    v = DLookup("[GlobalID]", "dbo_CompanyInfo", "[CompanyInfoID] = 1")
    If Not IsNull(v) Then
        ' get the output export path (part)
        RootPath = DLookup("[TechInspectOrderRootPath]", "dbo_Global", "[GlobalID] = " & CLng(v))
        If IsNull(RootPath) Then
            MsgBox "No Root-Batch-Path for printing technicians reports! Check Globals.", vbOKOnly Or VbMsgBoxStyle.vbCritical, "Batch Print"
            Exit Function ' UEXPECTED ERROR
        End If
        ' check for trailing character
        If Not Right$(RootPath, 1) = "\" Then
            RootPath = RootPath & "\"
        End If
        ' test if this root path exists
        If Len(Dir(RootPath, vbDirectory)) = 0 Then
            MsgBox "The Root-Batch-Path must exist! Check Globals.", vbOKOnly Or VbMsgBoxStyle.vbCritical, "Batch Print"
            Exit Function
        End If
    Else
        MsgBox "No Company Info!", vbOKOnly Or VbMsgBoxStyle.vbCritical, "Batch Print"
        Exit Function ' UEXPECTED ERROR
    End If
        
    SQL = _
        "SELECT dbo_InspectionOrder.InspectionOrderID, dbo_InspectionOrder.CustomerID, dbo_InspectionOrder.ServiceInterval, dbo_HR.LastName FROM dbo_InspectionOrder " & _
        "LEFT JOIN dbo_HR ON dbo_InspectionOrder.HRID = dbo_HR.HRID " & _
        "WHERE DatePart('m', [RequestedDT]) = " & CStr(intMonth) & " AND DatePart('yyyy', [RequestedDT]) = " & CStr(intYear) & _
        " AND InspectionStatusID = 1"
    vReturnValue = vbNull
    DoCmd.OpenForm "xDlgBatchPrintRptTech", , , , , acDialog
    DoCmd.Close acForm, "xDlgBatchPrintRptTech", acSaveNo
    ' User said YES
    If vReturnValue = 1 Then
    
        If lngStatusID = 0 Then
            lngStatusID = 1 'trap illegal
        End If
    
        ' XXXXXXXXXXXXXXXXXXXXX
        '#### Setup the UserForm - progress bar dialogue
        Set ProgBarForm = New frmProgress 'max=100 value=0 dosmooth=true
        If Not ProgBarForm Is Nothing Then
            ProgBarForm.xInitialize
            Load ProgBarForm
            ProgBarForm.lblTitle.Caption = "Batch Print Technician's Inspection Form."
            ProgBarForm.lblCaption.Caption = "..."
            ProgBarForm.BorderStyle = fmBorderStyleSingle
            ProgBarForm.StartUpPosition = 2
            ProgBarForm.Show
            DoEvents
        End If
        
        'Load ProgBarForm
    
        Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If rst.RecordCount > 0 Then
        
            ' XXXXXXXXXXXXXXXXXXXXX init MIN MAX in ProgBarForm
            If Not ProgBarForm Is Nothing Then
                rst.MoveLast
                ProgBarForm.xMax = rst.RecordCount
                rst.MoveFirst
            End If
                        
            ' TEST IF THE REPORT IS MOUNTED
            Set obj = Application.CurrentProject.AllReports("_rpt_InspectTech")
            If Not obj Is Nothing Then
                If Not obj.IsLoaded Then
                    ' LOAD A BLANK TECHNICIAN'S REPORT
                    DoCmd.OpenReport "_rpt_InspectTech", acViewReport, , , acHidden, "0|1"
                End If
            End If
            
            Set obj = Nothing
            
            ' ASSIGN POINTER TO REPORT - FOR CODE READABLIITY
            Set rptReport = Reports("_rpt_InspectTech")
            
            ' PRIMITIVE ERROR CHECK ON POINTER ASSIGNMENT
            If rptReport Is Nothing Then
                rst.Close
                MsgBox "UNEXPECTED SYSTEM ERROR! Contact developer.", vbOKOnly Or VbMsgBoxStyle.vbCritical, "Batch Print"
                ' XXXXXXXXXXXXXXXXXXXXX ASSERT USERFORM MEMORY - TRAP LEAKS
                If Not ProgBarForm Is Nothing Then
                    Unload ProgBarForm
                    Set ProgBarForm = Nothing
                End If
                Exit Function ' UEXPECTED ERROR
            End If

           'rptReport.FilterOnLoad = True
            
            ' XXXXXXXXXXXXXXXXXXXXX Ready to output - ENABLE ESCAPE BATCH PRINT
            If Not ProgBarForm Is Nothing Then
                ProgBarForm.lblCaption.Caption = "Output of reports in progress..."
                ProgBarForm.cmdCancel.Visible = True
                DoEvents
            End If
            
            Do While Not rst.EOF
                
                rptReport.FilterOn = False
                rptReport.Filter = "[InspectionOrderID] = " & CStr(rst.Fields("InspectionOrderID")) & " AND [ServiceInterval] = " & CStr(rst.Fields("ServiceInterval"))
                rptReport.FilterOn = True ' FORCES REQUERY

                
                strInspectOrder = Format(rst.Fields("InspectionOrderID"), "0000")
                strCustID = Format(rst.Fields("CustomerID"), "0000")
                
                ' VBA IS PRIMATIVE - WE MUST CHECK & BUILD EACH FOLDER SEPERATELY
                strFolder = RootPath & Format(intYear, "0000") & "\"
                If Len(Dir(strFolder, vbDirectory)) = 0 Then
                    ' create the folder
                    MkDir strFolder
                End If
                
                ' VBA IS PRIMATIVE - WE MUST CHECK & BUILD EACH FOLDER SEPERATELY
                strFolder = strFolder & Format(intMonth, "00") & "\"
                If Len(Dir(strFolder, vbDirectory)) = 0 Then
                    ' create the folder
                    MkDir strFolder
                End If
                
                If IsNull(rst.Fields("lastName")) Then
                    TechName = "NON-GIVEN"
                Else
                    TechName = rst.Fields("lastName")
                End If
                
                outputFile = strFolder & "TechRPT_" & TechName & "_" & strInspectOrder & "_" & strCustID & ".pdf"
                
                'acFormatPDF, RTF, HTML, SNP, TXT, XLS, XPS
                
                DoCmd.OutputTo acOutputReport, "_rpt_InspectTech", acFormatPDF, outputFile, False, "", , acExportQualityPrint

                ' XXXXXXXXXXXXXXXXXXXXX
                If Not ProgBarForm Is Nothing Then
                    ProgBarForm.xIncrement
                    DoEvents
                
'                    ABORT OUTPUT OF REPORTS
                    If ProgBarForm.xAbort = True Then
                        ProgBarForm.lblCaption.Caption = "Aborting Batch Print..."
                        DoEvents
                        Exit Do
                    End If

                End If
                
                rst.MoveNext
            Loop
            ' Unload rptReport
            Set rptReport = Nothing
            DoCmd.Close acReport, "_rpt_InspectTech", acSaveNo
            ' Unload recordset
            rst.Close
            Set rst = Nothing
            ' FLAG - SUCCESS
            BatchPrintRptTech = True
            
            ' XXXXXXXXXXXXXXXXXXXXX - UNLOAD USERFORM MEMORY
            If Not ProgBarForm Is Nothing Then
                ProgBarForm.Hide
                Unload ProgBarForm
                Set ProgBarForm = Nothing
            End If
            
            MsgBox "Batch Print - completed ", vbOKOnly, "Batch Print"

        End If
    End If
    
        
PROC_EXIT:
    On Error Resume Next
    
    ' XXXXXXXXXXXXXXXXXXXXX ASSERT USERFORM MEMORY - TRAP LEAKS
    If Not ProgBarForm Is Nothing Then
        Unload ProgBarForm
        Set ProgBarForm = Nothing
    End If
    
    Exit Function

PROC_ERR:
    ' XXXXXXXXXXXXXXXXXXXXX CLEAR THE SCREEN
    If Not ProgBarForm Is Nothing Then
        ProgBarForm.Hide
    End If
    
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " BatchPrintRptTech" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
End Function
