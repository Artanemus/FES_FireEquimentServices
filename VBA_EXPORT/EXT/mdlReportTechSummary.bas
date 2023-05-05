Attribute VB_Name = "mdlReportTechSummary"
Option Compare Database
'@Folder "TECH"
Option Explicit

Private Const ModuleName As String = "mdlTechReportSummary"
Private vReturnValue As Variant

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

Private Function exeHREmail( _
        ByVal BCC As String, _
        ByVal FileToAttach As String, _
        ByVal FileToAttach2 As String, _
        ByVal HRID As Long, _
        Optional ByVal RunSilent As Boolean = False, _
        Optional ByVal EmailMode As Integer = 1) As Boolean
        
    Dim v As Variant, v1 As Variant, v2 As Variant
    Dim s As String
    Dim msg As String
'    Dim strSQL As String
'    Dim rst As DAO.Recordset
    
    ' PARAMETER DEFINED FOR EMAIL-OUT
    Dim Email As clsEmail
    Dim mSubject As String
    Dim mBody As String
    Dim mBody_Part As String
    Dim EnableEmail As Boolean
    Dim aArray_To() As Variant
    Dim aArray_Cc() As Variant
    Dim aArray_Bc() As Variant
    Dim aArray_Attachments() As Variant

    ' TECHNICIAN'S EMAIL AND CONTACT NUMBER
    Dim strHREmailAddress As String
    Dim strHRContactSingleLine As String

    On Error GoTo PROC_ERR
    exeHREmail = False
    Set Email = New clsEmail
    strHREmailAddress = vbNullString
    strHRContactSingleLine = vbNullString
    
    ' Use the global BCC address to track and archive email traffic
    If Len(BCC) > 0 Then
        ReDim aArray_Bc(1)
        aArray_Bc(0) = BCC
    End If
    
    ' ---------------------------------
    ' INCLUDE USEFUL INSPECTION ORDER INFORMATION ?
    ' ---------------------------------
    mBody_Part = vbNullString
    
    If HRID = 0 Then
        ' nothing to send
        GoTo PROC_EXIT
    Else
        ' SLUG LINE FOR EMAIL
        mSubject = "IDFES Technicians Summary Report"
        
        strHREmailAddress = "TECHNICIAN'S EMAIL ADDRESS IS UNKNOW."
        v = [_QRY_SQLEXPRESS].GetHREmail(HRID)
        If Len(Nz(v, vbNullString)) > 0 Then
            ReDim aArray_To(1)                   ' assign single element
            strHREmailAddress = CStr(v)          ' TECHNICIAN'S EMAIL ADDRESS
            aArray_To(0) = strHREmailAddress     ' NOTE: BASE ZERO
        End If
        
        ' "HRID" is permitted to be null or invalid - scalar function returns vbNullString
        ' HOWEVER the VBA routine to call Scalar Function only accepts LONG
        strHRContactSingleLine = "THE TECH FOR THIS SUMMARY REPORT IS UNKNOWN."
        v = [_QRY_SQLEXPRESS].GetHRContactSingleLine(HRID)
        If Len(Nz(v, vbNullString)) > 0 Then
            strHRContactSingleLine = CStr(v)     ' TECHNICIAN'S FULLNAME AND CONTACT NUMBER
        End If
        
    End If
    
    ' OPENING TITLE - double lined spaced
    mBody = "Ipswich District Fire and Emergency Services." & vbCrLf
    mBody = mBody & "Technicians Summary Report" & vbCrLf & vbCrLf
    ' GENERAL INFO  - double lined spaced
    If Len(mBody_Part) > 0 Then
        mBody = mBody & mBody_Part & vbCrLf & vbCrLf
    End If
    ' MAIN CLIENT LETTER AREA - including metadata
    ' Salutation
    mBody = mBody & "IDFES Technician: " & strHRContactSingleLine & vbCrLf
    mBody = mBody & "EMAIL: " & strHREmailAddress
    mBody = mBody & vbCrLf
    mBody = mBody & "Attached is ... " & vbCrLf
    mBody = mBody & mdlToolBox.ExtractFileName(FileToAttach) & vbCrLf & " " & _
    mBody = mBody & " ...the IDFES Technician's Summary Report." & vbCrLf & _
    mBody = mBody & vbCrLf
    
    mBody = mBody & vbCrLf
    mBody = mBody & "Cheers ..."
    Email.Body = mBody
    Email.Subject = mSubject
    
    
    ' ----------------------------------------------------
    ' ATTACHMENTS
    ' ----------------------------------------------------
    If Len(FileToAttach) > 0 Then
        ReDim aArray_Attachments(1)
        aArray_Attachments(0) = FileToAttach
    End If
    If Len(FileToAttach2) > 0 Then
        ReDim Preserve aArray_Attachments(2)
        aArray_Attachments(1) = FileToAttach2
    End If
    
    ' ----------------------------------------------------
    ' GO Post or create draft THE EMAIL
    ' ----------------------------------------------------
    If EmailMode = 1 Then
        ' SAVE A DRAFT
        exeHREmail = Email.exeSaveEmail(aArray_To, aArray_Cc, aArray_Bc, aArray_Attachments)
    Else
        ' CAN'T POST NOTHING IF A RECIPIENT EMAIL IS GIVEN.
        If mdlToolBox.IsArrayEmpty(aArray_To) Then
            exeHREmail = Email.exeSaveEmail(aArray_To, aArray_Cc, aArray_Bc, aArray_Attachments)
        Else
            ' POST THE EMAIL
            exeHREmail = Email.exePostEmail(aArray_To, aArray_Cc, aArray_Bc, aArray_Attachments)
        End If
    End If
    ' FREE CLASS
    Set Email = Nothing
    
    If Not RunSilent Then
        If exeHREmail Then
            If EmailMode = 1 Then
                s = "A draft email was successfully created."
            Else
                s = "The email was POSTED to the technician."
            End If
            MsgBox s, vbInformation Or vbOKOnly, "Email Customers Inspection Order."
        Else
            s = "An Outlook error occurred when creating the draft email."
            MsgBox s, vbExclamation Or vbOKOnly, "Email Customers Inspection Order."
        End If
    End If
        
PROC_EXIT:
    On Error Resume Next
    If Not Email Is Nothing Then
        Set Email = Nothing
    End If
    Exit Function

PROC_ERR:
    ' DEFAULT - disable report on - system errors
    If Not RunSilent Then
        If err.Number <> 0 Then
            msg = ModuleName & " exeHREmail" & vbCrLf & _
                  "Error # " & CStr(err.Number) & " was generated by " & err.SOURCE & vbCrLf & err.Description
            MsgBox msg, , "Error", err.HelpFile, err.HelpContext
        End If
    End If
    Resume PROC_EXIT
End Function

Public Function exeReportTechSummary() As Boolean
    Dim obj As AccessObject
    Dim rst As DAO.Recordset
    Dim ProgBarForm As frmProgress
    Dim frm As Form_DlgReportTechSummary
    Dim ctrl As Access.Control
    
    Dim RootPath As Variant, v As Variant
    Dim lngInspectionOrderID As Long, lngHRID As Long, lngInspectionOrderStatusID As Long
    Dim intYear As Integer, intMonth As Integer, intDay As Integer
    Dim intIndex As Integer, msgBoxRexults As Integer
    Dim SQL As String, WhereClause As String, msg As String
    Dim strInspectOrder As String, strCustID As String, strFolder As String, TechName As String
    Dim StartDate As Variant, EndDate As Variant
    Dim s As String, DateRangeStr As String, EmailAddressStr As String
    Dim SenderName As String
    
    'OUTPUT ATTACHMENTS 1
    Dim outputFile As String                     ' technician's Summary Report
    Dim outputFile2 As String                    ' NO USED
    Dim UserOutputFolder As String               ' user has specified a FOLDER
    
    Dim EmailMode As Integer                     ' 0 = DON'T EMAIL, 1 = DRAFT EMAIL, 2 = POST EMAIL, 3 = SEND EMAIL (not implemented)
    
    ' LONG LIST OF BOOLEANS USED IN SUBROUTINE
    Dim GroupOnTechName As Boolean
    Dim CleanOutputDirectory As Boolean
    Dim CheckTestResults As Boolean
    Dim GroupedSubFolders As Boolean
'    Dim CheckAttachServiceHistory As Boolean
'    Dim CheckBuildSummarySheet As Boolean
    Dim EnableEmail As Boolean
    Dim lngCustomerID As Long
    Dim CustCode As String
    Dim success As Boolean
    
    
    On Error GoTo PROC_ERR
    ' ******************************************************
    ' INITIALIZATION OF PARAMS
    ' ******************************************************
    exeReportTechSummary = False
    TechName = vbNullString
    outputFile = vbNullString
    outputFile2 = vbNullString

    DoCmd.OpenForm "DlgReportTechSummary", , , , , acDialog
    
    If vReturnValue = 0 Then
        DoCmd.Close acForm, "DlgReportTechSummary", acSaveNo
        Exit Function                            ' user Aborted
    End If
        
    
    ' ------------------------------------------------------------------------------------------------------
    ' START - EXTRACT USER'S INPUT DATA FROM FORM DlgReportCust
    ' ------------------------------------------------------------------------------------------------------
    Set frm = Forms("DlgReportTechSummary")
    ' quick - unsafe method to get params
    With frm
        Set ctrl = .Controls("cmbxHRID")
        ' BOUND to COL 0 - NO DEFAULT VALUE - EXPECT NULL
        If Not IsNull(ctrl) Then
            lngHRID = ctrl.Column(0)
        Else
            ' DISPLAY ALL CUSTOMERS FOR DATE RANGE....
            lngHRID = 0
        End If
        
        Set ctrl = .Controls("cmbxInspectOrderStatusID")
        ' BOUND to COL 0 - GIVEN DEFAULT VALUE AT DESIGN TIME = 1
        If Not IsNull(ctrl) Then
            lngInspectionOrderStatusID = ctrl.Column(0)
        Else
            lngInspectionOrderStatusID = 1
        End If
        
        Set ctrl = .Controls("optgDateRange")
        ' GIVEN DEFAULT VALUE AT DESIGN TIME
        intIndex = ctrl.Value
        
        Select Case intIndex
        Case 1
            ' SELECT MONTH THIS YEAR
            Set ctrl = .Controls("cmbxMonths")
            If IsNull(ctrl) Or ctrl.ListIndex = -1 Then
                ' no input from user - calc the current month
                StartDate = DateSerial(DatePart("yyyy", Date), DatePart("m", Date), 1)
                EndDate = DateSerial(DatePart("YYYY", Date), DatePart("m", Date) + 1, 1)
                ' less a day equals last day of the previous month.
                EndDate = DateAdd("d", -1, EndDate)
            Else
                ' user selects month from combobox
                intMonth = ctrl.Column(0)        '
                StartDate = DateSerial(DatePart("yyyy", Date), intMonth, 1)
                EndDate = DateSerial(DatePart("YYYY", Date), intMonth + 1, 1)
                ' less a day equals last day of the previous month.
                EndDate = DateAdd("d", -1, EndDate)
            End If
        Case 2
            ' SELECT DATE RANGE - START\ENDDATE ARE VARIANT
            Set ctrl = .Controls("edtStartDate")
            StartDate = ctrl.Value
            
            Set ctrl = .Controls("edtEndDate")
            If IsNull(ctrl) Then
                EndDate = Date                   ' as of today - both month and day ....
            Else
                EndDate = ctrl.Value
            End If
            
        End Select
            
        
        ' CHECK BOXES ... (ALL GIVEN DEFAULT VALUES AT DESIGN TIME)
        Set ctrl = .Controls("chkCleanOutputDirectory")
        CleanOutputDirectory = ctrl.Value
        
        Set ctrl = .Controls("chkGroupOnTechName")
        GroupOnTechName = .Controls("chkGroupOnTechName").Value
        
        Set ctrl = .Controls("chkGroupedSubFolders")
        GroupedSubFolders = ctrl.Value
        
        EmailMode = 0                            ' DO NOT EMAIL REPORT
        
        Set ctrl = .Controls("chkUsePostEmailMode")
        If ctrl.Value = True Then
            EmailMode = 2
        End If
        ' Note: DRAFT hides POST
        Set ctrl = .Controls("chkUseDraftEmailMode")
        If ctrl.Value = True Then
            EmailMode = 1
        End If
               
        ' a user defined output path
        UserOutputFolder = vbNullString
        Set ctrl = .Controls("txtOutputFolder")
        If Not IsNull(ctrl) Then
            UserOutputFolder = ctrl.Value
        End If
        
        ' ASSERT DATERANGE
        
    End With
    ' finished with dialogue
    DoCmd.Close acForm, "DlgReportTechSummary", acSaveNo
    ' ------------------------------------------------------------------------------------------------------
    ' END - EXTRACT USER'S INPUT DATA FROM FORM DlgReportCust
    ' ------------------------------------------------------------------------------------------------------
    
    
    ' ------------------------------------------------------------------------------------------------------
    ' START - CHECK USER INPUT DATA
    ' ------------------------------------------------------------------------------------------------------
    ' ABORT ON NULL OR BAD DATE RANGE
    If IsNull(EndDate) Or Not IsDate(EndDate) Then
        MsgBox "Bad end date. Abort.", vbOKOnly Or VbMsgBoxStyle.vbCritical, "Batch Print"
        Exit Function                            ' UNEXPECTED ERROR
    End If
    If IsNull(StartDate) Or Not IsDate(StartDate) Then
        MsgBox "Bad start date. Abort.", vbOKOnly Or VbMsgBoxStyle.vbCritical, "Batch Print"
        Exit Function                            ' UNEXPECTED ERROR
    End If
    
    ' adjust time to end at midnight - so date range is fully 'inclusive'.
    EndDate = mdlToolBox.AdjustDTCeiling(EndDate)
    
    If lngInspectionOrderStatusID = 0 Then
        MsgBox "Bad Inspection Status ID. Abort.", vbOKOnly Or VbMsgBoxStyle.vbCritical, "Batch Print"
        Exit Function                            ' UNEXPECTED ERROR
    End If

    If Len(UserOutputFolder) = 0 Then
        ' use the FES global output path ...
        RootPath = mdlToolBox.GetBatchPrintRootPath()
        If Len(RootPath) = 0 Then
            Exit Function                        ' UNEXPECTED ERROR
        End If
        RootPath = RootPath & "TechInspectionOrders\"
    Else
        ' use the user's select path...
        RootPath = UserOutputFolder
    End If
    ' ------------------------------------------------------------------------------------------------------
    ' END - CHECK USER INPUT DATA
    ' ------------------------------------------------------------------------------------------------------
    
    
    ' BUILD OUTPUT DIRECTORY ....
    ' VBA IS PRIMATIVE - WE MUST CHECK & BUILD EACH SUB-FOLDER SEPERATELY
    ' BUILD THE TECH FOLDER TO DUMP INSPECTION ORDERS INTO
    If Len(Dir(RootPath, vbDirectory)) = 0 Then
        ' create the folder
        MkDir RootPath
    End If

    ' BUILD SQL - WHERE CLAUSE - DATE RANGE CRITERIA
    WhereClause = "( " & _
                  "([RequestedDT] >= #" & Format(CDate(StartDate), "mm/dd/yyyy") & "#) " & _
                  " AND " & _
                  "([RequestedDT] < #" & Format(CDate(EndDate), "mm/dd/yyyy hh:nn") & "#)" & _
                  ")"
            
    ' BUILD SQL - CORE + ATTACH WHERE CLAUSE
    ' MUST HAVE VALID [RequestedDT] VALUE
    SQL = _
        " SELECT dbo_HR.HRID " & _
        " FROM dbo_HR INNER JOIN dbo_InspectionOrder ON dbo_HR.HRID = dbo_InspectionOrder.HRID " & _
        " WHERE " & WhereClause & _
        " AND InspectionStatusID = " & CStr(lngInspectionOrderStatusID)

    ' BUILD SQL - EXTEND WHERE CLAUSE - FILTER ON HR ID
    If lngHRID > 0 Then
        SQL = SQL & " AND dbo_HR.HRID = " & CStr(lngHRID)
    End If
    ' GROUP ON HR - ie. A list of HR's that performed these inspection orders that met with criteria.
    SQL = SQL & " GROUP BY dbo_HR.HRID;"

    ' PREPARE - PROGRESS BAR - CONSTRUCTION
    Set ProgBarForm = New frmProgress            'max=100 value=0 dosmooth=true
    If Not ProgBarForm Is Nothing Then
        ProgBarForm.xInitialize
        Load ProgBarForm
        ProgBarForm.lblTitle.Caption = "Batch Print Technician's Summary Reports."
        ProgBarForm.lblCaption.Caption = "..."
        ProgBarForm.BorderStyle = fmBorderStyleSingle
        ProgBarForm.StartUpPosition = 2
        ' don't display the progress dialogue until after the confirm dlg
        'ProgBarForm.Show
        DoEvents
    End If
        
    ' ------------------------------------------------------------------------------------------------------
    ' START - RECORDSET - OPEN QUERY ...
    ' ------------------------------------------------------------------------------------------------------
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenSnapshot, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        
        rst.MoveLast
    
        ' PLEASE CONFIRM BATCH REPORT
        DateRangeStr = Format(CDate(StartDate), "mm/dd/yyyy") & " - " & Format(CDate(EndDate), "mm/dd/yyyy")
        
        If EmailMode > 0 Then
            msg = "Enabled."
        Else
            msg = "Not enabled."
        End If
                                                
        s = _
          str(rst.RecordCount) & "|" & _
          Format(CDate(StartDate), "dd/mm/yyyy") & " - " & Format(CDate(EndDate), "dd/mm/yyyy") & _
          "|" & msg & "|" & RootPath
        
        DoCmd.OpenForm "DlgReportTechSummaryConfirm", , , , , acDialog, s
        DoCmd.Close acForm, "DlgReportTechSummaryConfirm", acSaveNo
        
        If vReturnValue = 0 Then
            GoTo PROC_EXIT                       ' USER ABORTED
        Else
            ' display the progressDlg
            If Not ProgBarForm Is Nothing Then
                ProgBarForm.xMax = rst.RecordCount
                ProgBarForm.Show
                DoEvents
            End If
        End If
    
        rst.MoveFirst
                        
        ' IF REPORT IS MOUNTED - CLOSE IT
        Set obj = Application.CurrentProject.AllReports("_rpt_TechRptSummary")
        If Not obj Is Nothing Then
            If obj.IsLoaded Then
                DoCmd.Close acReport, "_rpt_TechRptSummary", acSaveNo
            End If
        End If
        Set obj = Nothing
            
        ' PROGRESS BAR - Ready to output - ENABLE ESCAPE BATCH PRINT
        If Not ProgBarForm Is Nothing Then
            ProgBarForm.lblCaption.Caption = "Output of reports in progress..."
            ProgBarForm.cmdCancel.Visible = True
            DoEvents
        End If
        
        
        ' ------------------------------------------------------------------------------------------------------
        ' START - MAIN LOOP ACROSS QUERY ...
        ' ------------------------------------------------------------------------------------------------------
            
        Do While Not rst.EOF
                
            'strInspectOrder = Format(rst.Fields("InspectionOrderID"), "0000")
            'strCustID = Format(rst.Fields("CustomerID"), "0000")
            
            ' TODO: GET THE TECHNAME
            TechName = "UNKNOW"
            If Nz(rst.Fields("HRID"), 0) > 0 Then
                ' Exclude contact number from name.
                v = [_QRY_SQLEXPRESS].GetHRContactSingleLine(CLng(rst.Fields("HRID")), 0)
                If Len(Nz(v, vbNullString)) > 0 Then
                    TechName = CStr(v)
                End If
            End If
                            
            If Not ProgBarForm Is Nothing Then
                ProgBarForm.lblCaption.Caption = "Output IO: " & str(rst.Fields("HRID"))
                DoEvents
            End If
            
            strFolder = RootPath                 ' DEFAULT INITIALISATION
            
            If GroupOnTechName Then
                strFolder = RootPath & TechName & "\"
                If Len(Dir(strFolder, vbDirectory)) = 0 Then
                    ' create the folder
                    MkDir strFolder
                End If
            End If
            
'            If GroupedSubFolders Then
'                ' VBA IS PRIMATIVE - WE MUST CHECK & BUILD EACH FOLDER SEPERATELY
'                intYear = DatePart("yyyy", rst.Fields("RequestedDT"))
'                strFolder = strFolder & Format(intYear, "0000") & "\"
'                If Len(Dir(strFolder, vbDirectory)) = 0 Then
'                    ' create the folder
'                    MkDir strFolder
'                End If
'
'                ' VBA IS PRIMATIVE - WE MUST CHECK & BUILD EACH FOLDER SEPERATELY
'                intMonth = DatePart("m", rst.Fields("RequestedDT"))
'                strFolder = strFolder & Format(intMonth, "00") & "\"
'                If Len(Dir(strFolder, vbDirectory)) = 0 Then
'                    ' create the folder
'                    MkDir strFolder
'                End If
'            End If
                
            outputFile = strFolder & "TechRPT_" & TechName & "_" & strInspectOrder & ".pdf"
                
            ' if ACCESS throw exception error while processing the report - skip to next record.
            On Error GoTo SKIP_001
            
            'acFormatPDF, RTF, HTML, SNP, TXT, XLS, XPS
            ' PRINT PDF - TECHNICIAN'S SUMMARY REPORT
            ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            DoCmd.OpenReport "_rpt_TechRptSummary", acViewReport, , , acHidden, _
                CStr(rst.Fields("HRID")) & "|" & Format(CDate(StartDate), "dd/mm/yyyy") & "|" & Format(CDate(EndDate), "dd/mm/yyyy")
            DoCmd.OutputTo acOutputReport, "_rpt_TechRptSummary", acFormatPDF, outputFile, False, "", , acExportQualityPrint
            DoCmd.Close acReport, "_rpt_TechRptSummary", acSaveNo
            ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            

                    
            ' BLIND COPY - BCC - EMAIL TO FES COMPANY ADMINISTRATOR
            ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            If EmailMode > 0 Then
                ' GET BCC email address
                v = mdlCompany.GetGlobalBCCEmailAddress()
                ' send the email to office admin
                success = exeHREmail(v, outputFile, outputFile2, rst.Fields("HRID"), True, EmailMode)
            End If
            ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SKIP_001:
            On Error GoTo PROC_ERR
            
            
            ' XXXXXXXXXXXXXXXXXXXXX
            If Not ProgBarForm Is Nothing Then
                ProgBarForm.xIncrement
                DoEvents
                
                '  ABORT OUTPUT OF REPORTS
                If ProgBarForm.xAbort = True Then
                    ProgBarForm.lblCaption.Caption = "Aborting Batch Print..."
                    DoEvents
                    Exit Do
                End If

            End If
                
            rst.MoveNext
        Loop
        ' ------------------------------------------------------------------------------------------------------
        ' END - MAIN LOOP ACROSS QUERY ...
        ' ------------------------------------------------------------------------------------------------------
        
        ' Unload recordset
        rst.Close
        Set rst = Nothing
                
        exeReportTechSummary = True                     ' FLAG - SUCCESS
        
        ' HIDE VISIBILITY OF PROGRESS BAR
        If Not ProgBarForm Is Nothing Then
            ProgBarForm.Hide
        End If
        
    Else
        ' -------------------------------------------------------------------------------------------------
        ' NO RECORDS FOUND.... THE RECORDSET WAS EMPTY
        ' NO TECHNICIANS FOUND
        ' NO INSPECTION ORDERS WITHIN DATE RANGE
        If Not ProgBarForm Is Nothing Then
            ProgBarForm.Hide
        End If
        ' Unload recordset
        If Not rst Is Nothing Then
            rst.Close
        End If
        Set rst = Nothing
        MsgBox "Nothing to process." & _
        vbCrLf & "Technician(s) not found OR no Inspection Orders within the report range." & _
        vbCrLf & "(Check that technicians are assigned to Inspection Orders.)", _
        vbOKOnly Or VbMsgBoxStyle.vbInformation, "Batch Print"

    End If
    ' ------------------------------------------------------------------------------------------------------
    ' END - RECORDSET - CLOSE QUERY ...
    ' ------------------------------------------------------------------------------------------------------
    
        
PROC_EXIT:
    On Error Resume Next
    
    ' PROGRESS BAR - RELEASE USERFORM MEMORY
    ' Performed prior to final message box
    If Not ProgBarForm Is Nothing Then
        ' ASSERT VISIBILITY ...
        If ProgBarForm.Visible = True Then
            ProgBarForm.Hide
        End If
        ' CLEAN MEMORY
        Unload ProgBarForm
        Set ProgBarForm = Nothing
    End If
    
    ' only shown if no errors
    If exeReportTechSummary Then
        MsgBox "Batch Print - completed ", vbOKOnly, "Batch Print"
    End If
    
    Exit Function

PROC_ERR:
    ' PROGRESS BAR - CLEAR THE SCREEN
    If Not ProgBarForm Is Nothing Then
        ProgBarForm.Hide
    End If
    
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " exeReportTechSummary" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.SOURCE & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
End Function






