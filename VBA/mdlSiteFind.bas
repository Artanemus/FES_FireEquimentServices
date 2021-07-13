Attribute VB_Name = "mdlSiteFind"
Option Compare Database
Option Explicit

Private mRunning As Boolean
Private mReturnValue As Variant
Private mOpenArgs As String

' +-----------------------------------------------------------
' |
' |  properties for communicating with _SiteFind
' |
Public Property Get Running() As Boolean
Running = mRunning
End Property

Public Property Let ReturnValue(X As Variant)
mReturnValue = X
End Property

Public Property Get ReturnValue() As Variant
ReturnValue = mReturnValue
End Property

' +-----------------------------------------------------------
' |
' |  Find Site
' |
Private Sub RunDialog()
Dim msg As String
On Error GoTo PROC_ERR
    mRunning = True
    DoCmd.OpenForm "_SiteFind", , , , , acDialog, mOpenArgs
    DoCmd.Close acForm, "_SiteFind"
    mRunning = False
PROC_EXIT:
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = "mdlSiteFind RunDialog" & vbCrLf & _
        "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
End Sub
