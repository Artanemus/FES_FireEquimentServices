Attribute VB_Name = "mdlCompany"
Option Compare Database
Option Explicit

Public Function GetCompanyCode() As String
Dim v As Variant
    v = DLookup("[CompanyCode]", "dbo_CompanyInfo", "[CompanyInfoID] = 1")
    If Not IsNull(v) Then
        GetCompanyCode = CStr(v)
    Else
        GetCompanyCode = "FES"  ' ALT: vbNullString ?
    End If
End Function

Public Function GetCompanyName() As String
Dim v As Variant
    v = DLookup("[CompanyName]", "dbo_CompanyInfo", "[CompanyInfoID] = 1")
    If Not IsNull(v) Then
        GetCompanyName = CStr(v)
    Else
        GetCompanyName = "Fire and Equipment Services."
    End If
End Function

Public Function GetCompanyInfoID() As String
    GetCompanyInfoID = 1
End Function

Public Function GetGlobalDefNumOfLevels() As Variant
' UNIT is given in months
    Dim v As Variant
    GetGlobalDefNumOfLevels = Null
    v = DLookup("[DefNumOfLevels]", "dbo_Global", "[GlobalID] = 1")
    If Not IsNull(v) Then
        If Not IsEmpty(v) Then
            ' no more than 12 - one for each month in the year ...
            If v >= 1 And v <= 12 Then
                GetGlobalDefNumOfLevels = Int(v)
            End If
        End If
    End If
End Function

Public Function GetGlobalDefStartLevel() As Variant
' UNIT is given in months
    Dim v As Variant
    GetGlobalDefStartLevel = Null
    v = DLookup("[DefStartLevel]", "dbo_Global", "[GlobalID] = 1")
    If Not IsNull(v) Then
        GetGlobalDefStartLevel = Int(v)
    End If
End Function


