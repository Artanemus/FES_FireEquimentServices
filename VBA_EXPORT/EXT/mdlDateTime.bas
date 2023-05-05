Attribute VB_Name = "mdlDateTime"
Option Compare Database
'@Folder "MODULE"
Option Explicit

Private mRunning As Boolean
Private mPrompt As String
Private mInitDate As Variant
Private vReturnValue As Variant

' +-----------------------------------------------------------
' |
' |  methods for using this module
' |

' Use this method to prompt for a date inside a procedure
Public Function InputDate(Optional Prompt As String = "Select Date", _
    Optional InitDate As Variant) As Variant
Dim msg As String
On Error GoTo PROC_ERR

    mPrompt = Prompt
    mInitDate = InitDate
    RunDialog
    InputDate = vReturnValue

PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = "mdlDateTime PROC:InputDate Error # " & CStr(err.Number) & " was generated by " & err.SOURCE & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
End Function

' Use this method to prompt for and set a new date on a textbox
Public Sub InputDateField(X As TextBox, Optional Prompt As String = "Select Date")
Dim msg As String
On Error GoTo PROC_ERR
    mPrompt = Prompt
    mInitDate = X.Value
    RunDialog
    If IsDate(vReturnValue) Then
        X.Value = vReturnValue
    End If
PROC_EXIT:
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = "mdlDateTime PROC:InputDateField Error # " & CStr(err.Number) & " was generated by " & err.SOURCE & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
End Sub

Private Sub RunDialog()
Dim msg As String
On Error GoTo PROC_ERR
    mRunning = True
    DoCmd.OpenForm "xDlgDatePicker", , , , , acDialog
    DoCmd.Close acForm, "xDlgDatePicker"
    mRunning = False
PROC_EXIT:
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = "mdlDateTime PROC:RunDialog Error # " & CStr(err.Number) & " was generated by " & err.SOURCE & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
End Sub


' +-----------------------------------------------------------
' |
' |  properties for communicating with Form_DatePicker
' |

' DON'T MESS WITH THESE PROPERTIES. CALL InputDateField() OR
' InputDate() AS SHOWN ABOVE.

Public Property Get Running() As Boolean
Running = mRunning
End Property
Public Property Get Prompt() As String
Prompt = mPrompt
End Property
Public Property Get InitDate() As Variant
InitDate = mInitDate
End Property
Public Property Let ReturnValue(X As Variant)
vReturnValue = X
End Property

