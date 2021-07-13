Attribute VB_Name = "mdlCustContact"
Option Compare Database
Option Explicit

Const ModuleName As String = "mdlCustContact"


Private mReturnValue As Variant                  'Routines called by this module write to this param
Private mHRID As Variant
Private mCustContactID As Variant

Public Property Let ReturnValue(X As Variant)
    mReturnValue = X
End Property

Public Property Let HR_ID(X As Variant)
    mHRID = X
End Property

Public Property Get HR_ID() As Variant
    HR_ID = mHRID
End Property

Public Property Let CustContact_ID(X As Variant)
    mCustContactID = X
End Property

Public Property Get CustContact_ID() As Variant
    CustContact_ID = mCustContactID
End Property

Public Function RemoveCustContact(ByVal aCustContactID As Variant) As Boolean
Dim db As Database
Dim strSQL As String
Dim msg As String

    On Error GoTo PROC_ERR

    RemoveCustContact = False
    If Nz(aCustContactID, 0) > 0 Then
        strSQL = "DELETE FROM dbo_CustContact WHERE CustContactID = " & CStr(aCustContactID)
        Set db = CurrentDb
        db.Execute strSQL, dbFailOnError + dbSeeChanges
        RemoveCustContact = True
    End If
    
PROC_EXIT:
    Set db = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " RemoveCustContact" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
    
End Function


Public Function ExeCustAddContact(ByVal aCustID As Variant) As Boolean
    mHRID = Null
    mReturnValue = Null
    ExeCustAddContact = False
    If (Nz(aCustID, 0) > 0) Then
    
        ' select a HR from the picker return 0 if none picked
        mHRID = mdlPicker.PickHR_CustContact
        
        '########################################################################
        If mHRID = 0 Then
            ' extended function of mdlPicker ... user pressed 'Create New Contact'
            If mdlPicker.DoCreateNewContact = 1 Then
                ' -------------------------------------------------------------
                ' Create New Contact Button ...
                ' -------------------------------------------------------------
                ' execute the add new contact Dialogue ....
                DoCmd.OpenForm "xDlgCustAddNewContact", , , , , acDialog
                DoCmd.Close acForm, "xDlgCustomerAddNewContact"
                If Nz(mReturnValue, 0) > 0 Then
                    ' return value holds the newly created HRID
                    mHRID = mReturnValue
                    'create a new contactlink record for the customer
                    addNewCustContact mHRID, CLng(aCustID)
                        
                    ' +---- STATE OF Module PARAMS ---------------------------+
                    ' mHRID = HR to include in customer list
                    ' mCustContactID = new contact linklist ID
                    ' +-------------------------------------------------------+
                    ExeCustAddContact = True     ' return success
                
                Else
                    ' USER ABORTED CREATENEWCONTACT ... NO HRID PICKED
                    ' +---- STATE OF Module PARAMS ---------------------------+
                    mHRID = Null                 ' Assert
                    mCustContactID = Null
                    ' +-------------------------------------------------------+
                    ExeCustAddContact = False    ' return user aborted
                
                End If
            Else
                ' USER ABORTED PICKER ... NO HRID PICKED
                ' +---- STATE OF Module PARAMS ---------------------------+
                mHRID = Null                     ' Assert
                mCustContactID = Null
                ' +-------------------------------------------------------+
                ExeCustAddContact = False        ' return user aborted
            End If
            
            '########################################################################
        Else
            If TestForCustContact(mHRID, aCustID) = False Then
                'create a new contactlink record for the customer
                addNewCustContact mHRID, CLng(aCustID)
            
                ' +---- STATE OF Module PARAMS ---------------------------+
                '   mHRID = an existing HR to include in customer list
                '   mCustContactID = new contact linklist ID
                ' +-------------------------------------------------------+
                ExeCustAddContact = True         ' return success
            Else
                ' HR is already a contact for the customer
                MsgBox "The HR is already a contact for this customer!" & _
                vbCrLf & "Check that the contact isn't archived.", vbOKOnly Or vbExclamation, "Contact already exists."
            End If
        End If
        
    End If
End Function

Public Function TestForCustContact(ByVal aHRID As Long, ByVal aCustomerID As Long) As Boolean
    Dim s As String
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim msg As String

    On Error GoTo PROC_ERR
    
    TestForCustContact = False
    
    If aHRID > 0 And aCustomerID > 0 Then
        'create a new contactlink record for the customer
        Set db = CurrentDb
        strSQL = "Select * FROM dbo_CustContact WHERE CustomerID = " & CStr(aCustomerID) & " AND HRID = " & CStr(aHRID)
        ' BSA correct method to use DAO to connect to MSSQL
        ' else use
        Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If rs.RecordCount > 0 Then
            TestForCustContact = True
        End If
    End If
    
PROC_EXIT:
    'Cleanup
    Set rs = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " TestForCustContact" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
End Function

' +---------------------------------------------
' Insert a HR into the customer contact list
' +---------------------------------------------

Public Sub addNewCustContact(ByVal aHRID As Long, ByVal aCustomerID As Long)
    Dim s As String
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim msg As String

    On Error GoTo PROC_ERR
    
    If aHRID > 0 And aCustomerID > 0 Then
        'create a new contactlink record for the customer
        Set db = CurrentDb
        strSQL = "Select * FROM dbo_CustContact"
        ' BSA correct method to use DAO to connect to MSSQL
        ' else use
        Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If Not IsNull(rs) Then
            With rs
                .AddNew
                ![HRID] = aHRID
                ![CustomerID] = aCustomerID
                ![CreatedOn] = Date
                ![Caption] = "Contact added on " & Format(Date, "dd/mmm/yyyy")
                ![ContactTypeID] = 1             'PRIMARY ...
                .Update
                .Bookmark = .LastModified
                mCustContactID = ![CustContactID]
            End With
        End If
    End If
    
PROC_EXIT:
    'Cleanup
    Set rs = Nothing
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " addNewCustContact" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
End Sub



