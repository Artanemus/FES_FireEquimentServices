Attribute VB_Name = "mdlOpenArgs"
Option Compare Database
Option Explicit

' ======================================================
' OpenArgs
'   X as Variant is Base 0
' ======================================================

Public Function ParseOpenArgs(aOpenArgs As String, X As Variant) As Variant
Dim Var As Variant
    On Error Resume Next
    Var = Split(aOpenArgs, "|", -1)
    ParseOpenArgs = Var(X)
End Function

Public Function fNumberOfOpenArgs(aOpenArgs As String) As Variant
On Error GoTo Err_fNumberOfOpenArgs
    fNumberOfOpenArgs = UBound(Split(aOpenArgs, "|")) + 1
Exit_fNumberOfOpenArgs:
    Exit Function
Err_fNumberOfOpenArgs:
    If Err.Number = 94 Then       'No OpenArgs
        fNumberOfOpenArgs = Null
    Else
        MsgBox Err.Description, vbExclamation, "Error in fNumberOfOpenArgs()"
        Resume Exit_fNumberOfOpenArgs
    End If
    Resume Exit_fNumberOfOpenArgs
End Function

' --------------------------------------------------------------------------------
'   AssertParseOpenArgs( ...)
'       PARAMS :
'           aOpenArgs : The string expression specified by the OpenArgs
'                       argument of the OpenForm method that opened a form.
'                       Read/write Variant.
'           X : Index of variant - BASE 0
'       RETURNS : Variant
'       ERRORS : NULL on return
' --------------------------------------------------------------------------------
Public Function AssertParseOpenArgs(aOpenArgs As Variant, X As Variant) As Variant
Dim v As Variant
    AssertParseOpenArgs = Null
    On Error Resume Next
    If IsNull(aOpenArgs) Then Exit Function
    If Len(CStr(aOpenArgs)) > 0 Then
        v = fNumberOfOpenArgs(CStr(aOpenArgs))
        If Not IsNull(v) Then
            If v > X Then
                AssertParseOpenArgs = ParseOpenArgs(CStr(aOpenArgs), X)
            End If
        Else
            ' the number of args is null
            ' special case - return the whole OpenArgs string
            If X = 0 Then AssertParseOpenArgs = CStr(aOpenArgs)
        End If
    End If
End Function
