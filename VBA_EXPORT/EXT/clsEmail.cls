VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsEmail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Compare Database
'@Folder("CLASS")
Option Explicit

Private mInspectO_Info As String
Private mSender_HRID As Long
Private mSender_FName As String
Private mSender_EmailAddress As String
Private mCompany_EmailAddress As String
Private mCompany_OfficeNumber As String
' EMAIL STRUCT -----------------
Private mSubject As String
Private mBody As String
   
Public Property Get Subject() As Variant
    Subject = mSubject
End Property

Public Property Let Subject(ByVal RHS As Variant)
    mSubject = RHS
End Property
Public Property Get Body() As Variant
    Body = mBody
End Property

Public Property Let Body(ByVal RHS As Variant)
    mBody = RHS
End Property


Public Function GetUserHRID() As Variant
Dim s As String
Dim v As Variant
    GetUserHRID = Null
    s = GetUserName()
    v = DLookup("[HRID]", "dbo_HR", "[UserLoginName] = """ & s & """")
    If Len(Nz(v, "")) > 0 Then
        GetUserHRID = v
    End If
End Function

Public Function GetUserFName() As String
Dim v1 As Variant, v2 As Variant, v As Variant
        GetUserFName = vbNullString
        v = GetUserHRID()
        If Not IsNull(v) Then
            v1 = DLookup("[FirstName]", "dbo_HR", "[HRID] = " & CStr(v))
            v2 = DLookup("[LastName]", "dbo_HR", "[HRID] = " & CStr(v))
            GetUserFName = CStr(Nz(v1, "")) & " " & CStr(Nz(v2, ""))
        End If
End Function

Public Function GetUserEmailAddress() As String
Dim v As Variant
        GetUserEmailAddress = vbNullString
        v = GetUserHRID()
        If Not IsNull(v) Then
            ' ---------------------------------
            ' Office administrator WORK EMAIL
            ' ---------------------------------
            v = DLookup("Email", "dbo_HREmail", "[EmailTypeID] = 1 AND [HRID] = " & CStr(v))
            If Len(Nz(v, "")) > 0 Then
                GetUserEmailAddress = CStr(v)
            End If
        End If
    
End Function

' SEND
Public Function exeSendEmail(ByRef aArray_To As Variant, ByRef aArray_Cc() As Variant, ByRef aArray_Bc() As Variant, ByRef aArray_Attachments() As Variant, Optional DoShowErrMsgs As Boolean = False) As Boolean
    exeSendEmail = exeEmail(aArray_To, aArray_Cc, aArray_Bc, aArray_Attachments, 0, False)
End Function
' SAVE - CREATE DRAFT EMAIL
Public Function exeSaveEmail(ByRef aArray_To As Variant, ByRef aArray_Cc() As Variant, ByRef aArray_Bc() As Variant, ByRef aArray_Attachments() As Variant, Optional DoShowErrMsgs As Boolean = False) As Boolean
    exeSaveEmail = exeEmail(aArray_To, aArray_Cc, aArray_Bc, aArray_Attachments, 1, False)
End Function
' POST
Public Function exePostEmail(ByRef aArray_To As Variant, ByRef aArray_Cc() As Variant, ByRef aArray_Bc() As Variant, ByRef aArray_Attachments() As Variant, Optional DoShowErrMsgs As Boolean = False) As Boolean
    exePostEmail = exeEmail(aArray_To, aArray_Cc, aArray_Bc, aArray_Attachments, 2, False)
End Function

      
Public Function exeEmail(ByRef aArray_To As Variant, ByRef aArray_Cc() As Variant, ByRef aArray_Bc() As Variant, ByRef aArray_Attachments() As Variant, ByVal EmailMode As Integer, Optional DoShowErrMsgs As Boolean = False) As Boolean
    Dim msg As String
    Dim v As Variant
    Dim X As Long
    ' ===================================================================================
    ' Variations in Outlook Object on different OS (windows 10, Vista, XP)
    ' ===================================================================================
    '            because you are currently mixing early binding and late binding.  So, since
    '            you are using the CreateObject method (late binding) use it all of the way.
    '            --
    '            Bob Larson
    '            Access World Forums Super Moderator
    '
    ' BSA FIX ...
    ' this is the standard assignment syntax
    '
    '    Dim objOutlook As Outlook.Application
    '    Dim objOutlookMailItem As Outlook.MailItem
    '    Dim objOutlookRecipients As Outlook.Recipient
    '    Dim objOutlookAttach As Outlook.Attachment

    ' It's now Working !!!! - don't know why!!!!
    Dim objOutlook As Outlook.Application
    Dim objOutlookMailItem As Outlook.MailItem
    Dim objOutlookRecipients As Outlook.Recipients
    'Dim objOutlookAttachments As Outlook.Attachments
    Dim aRecipient As Outlook.Recipient
    
    'This syntax is proven to removes compile errors
    ' Dim objOutlookRecipients As Object
    ' Dim objOutlookAttach As Object
    
    
    On Error GoTo exit_err
        
    
    exeEmail = False
  
    ' ===================================================================================
    ' Create the Microsoft Outlook session.
    ' CASE MAY BE IMPORTANT IN STRING !!!!!!!
    ' ===================================================================================
    Set objOutlook = CreateObject("Outlook.application")
    ' Create the e-mail message.
    Set objOutlookMailItem = objOutlook.CreateItem(olMailItem)
    
    
    ' ===================================================================================
    ' this may be important - it takes time for Outlook to construct mail item
    ' ===================================================================================
    DoEvents
    ' ===================================================================================
    
    
    With objOutlookMailItem
        Set objOutlookRecipients = .Recipients

        ' Add the AddressTo recipient(s) to the e-mail message.
        ' As this email is being SAVED not SENT or POSTED ...
        ' an empty recipient address is permitted.
        '----------------------------------------------------------------------
        If mdlToolBox.IsArrayEmpty(aArray_To) And (EmailMode = 0 Or EmailMode = 2) Then
            ' not permitted to SEND OR POST an email without valid email address.
            Exit Function
        End If
        
        If Not mdlToolBox.IsArrayEmpty(aArray_To) Then
            For X = LBound(aArray_To) To UBound(aArray_To)
                If Not IsEmpty(aArray_To(X)) Then
                    Set aRecipient = objOutlookRecipients.Add(CStr(aArray_To(X)))
                    aRecipient.Type = olTo
                End If
            Next X
        End If
        
        ' Add the Cc recipients to the e-mail message.
        '----------------------------------------------------------------------
        Set objOutlookRecipients = .Recipients
        If Not mdlToolBox.IsArrayEmpty(aArray_Cc) Then
            For X = LBound(aArray_Cc) To UBound(aArray_Cc)
                If Not IsEmpty(aArray_Cc(X)) Then
                    Set aRecipient = objOutlookRecipients.Add(CStr(aArray_Cc(X)))
                    aRecipient.Type = olCC
                End If
            Next X
        End If
        
        ' Add the Bc recipients to the e-mail message.
        '----------------------------------------------------------------------
        Set objOutlookRecipients = .Recipients
        If Not mdlToolBox.IsArrayEmpty(aArray_Bc) Then
            For X = LBound(aArray_Bc) To UBound(aArray_Bc)
                If Not IsEmpty(aArray_Bc(X)) Then
                    Set aRecipient = objOutlookRecipients.Add(CStr(aArray_Bc(X)))
                    aRecipient.Type = olBCC
                End If
            Next X
        End If
        
        
        ' Add attachments
        '----------------------------------------------------------------------
        'Set objOutlookAttachments = .Attachments
        If Not mdlToolBox.IsArrayEmpty(aArray_Attachments) Then
            For X = LBound(aArray_Attachments) To UBound(aArray_Attachments)
                If Not IsEmpty(aArray_Attachments(X)) Then
                    .Attachments.Add (CStr(aArray_Attachments(X)))
                End If
            Next X
        End If
        
        ' Set the Subject, the Body, and the Importance of the e-mail message.
        '----------------------------------------------------------------------
        .Subject = mSubject
        .Body = mBody
        
        'Add the attachment to the e-mail message.
        '----------------------------------------------------------------------
        ' Set objOutlookAttach = .Attachments.Add(mAttachment)
        ' .Attachments.Add (mAttachment)
        
        ' =====================================================================
        ' D E B U G   . . .  D E B U G   . . .  D E B U G   . . .
        ' disable line during debug.
        ' =====================================================================
        ' .Display
        ' Doesn't POST OR SEND message - saves to default folder for message type....
        ' SAVE TO (ROOT) DRAFT FOLDER...
        Select Case EmailMode
            Case 0
                .Send
                ' creates exception error - missing object?
                If (.Sent) Then
                    exeEmail = True
                End If
            Case 1
                .Save
                If (.Saved) Then
                    exeEmail = True
                End If
            Case 2
                .Post
                If (.Posted) Then
                    exeEmail = True
                End If
        End Select
    End With
    
exit_ok:
    On Error Resume Next
    Set objOutlookMailItem = Nothing
    Set objOutlook = Nothing
    Exit Function
   
exit_err:
    ' display the system error
    If err.Number <> 0 Then
        If DoShowErrMsgs Then
            msg = "CLASS EMAIL - exeEmailActionSend" & vbCrLf & _
                  "Error # " & str(err.Number) & " was generated by " & err.SOURCE & vbCrLf & err.Description
            MsgBox msg, , "Error", err.HelpFile, err.HelpContext
        End If
    End If

    GoTo exit_ok
    
End Function


