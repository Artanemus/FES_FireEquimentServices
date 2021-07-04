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


Public Function GetServiceInterval() As Double
' UNIT is given in months
    Dim v As Variant
    GetServiceInterval = 6#
    v = DLookup("[InspectOrderInterval]", "dbo_Global", "[GlobalID] = 1")
    If Not IsNull(v) Then
        GetServiceInterval = CDbl(v)
    End If
End Function


Public Function GetNumOfLevels() As Double
' UNIT is given in months
    Dim v As Variant
    GetNumOfLevels = 2
    v = DLookup("[NumOfLevels]", "dbo_Global", "[GlobalID] = 1")
    If Not IsNull(v) Then
        GetNumOfLevels = Int(v)
    End If
End Function


Public Function GetDefStartLevel() As Double
' UNIT is given in months
    Dim v As Variant
    GetDefStartLevel = 1
    v = DLookup("[DefStartLevel]", "dbo_Global", "[GlobalID] = 1")
    If Not IsNull(v) Then
        GetDefStartLevel = Int(v)
    End If
End Function


