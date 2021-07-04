Attribute VB_Name = "mdlLifeCycle"
Option Compare Database
Option Explicit

Const ModuleName As String = "mdlLifeCycle"


Public Function PrettyIntervalStr(days As Double) As String
    Dim f As Double
    Dim s As String
    Dim r As Integer
    
    PrettyIntervalStr = vbNullString
    
    If days >= 365 Then
        ' calc the number of years
        f = (days / 365#)
        r = (days Mod 365#)
        If r = 0 Then
            s = CStr(Int(days / 365#))
        Else
            s = Format(f, "0.0")
        End If
        If Len(s) > 0 Then
            PrettyIntervalStr = s & " year"
        End If
    End If
    If ((days < 365) And (days >= 30)) Then
        f = (days / 30#)
        s = Format(f, "0.0")
        If Len(s) > 0 Then
            PrettyIntervalStr = s & " month"
        End If
    End If
    If days < 30 Then
        PrettyIntervalStr = CStr(Int(days)) & " day"
    End If

End Function


Public Function GetMajorIntervalStation(aStationID) As Double
    Dim v As Variant
    Dim strSQL As String
    Dim db As Database
    Dim rs As Recordset
    Dim msg As String

    On Error GoTo PROC_ERR
    
    GetMajorIntervalStation = 0
    v = Null

    strSQL = _
           "SELECT dbo_Station.StationID, dbo_Station.IsEmpty, dbo_Station.EquipmentID " & _
           "FROM dbo_Station " & _
           "WHERE (((dbo_Station.StationID)= " & CStr(aStationID) & "));"

    Set db = CurrentDb
    Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    
    If rs.RecordCount > 0 Then
        rs.MoveFirst
        If Nz(rs![IsEmpty], 0) = 0 Then
            If Nz(rs![EquipmentID], 0) > 0 Then
                GetMajorIntervalStation = GetMajorIntervalEquip(CLng(v))
            End If
        End If
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " GetMajorIntervalStation" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function

Public Function GetMajorIntervalEquip(aEquipmentID) As Double
    Dim v As Variant
    Dim strSQL As String
    Dim db As Database
    Dim rs As Recordset
    Dim msg As String

    On Error GoTo PROC_ERR
    
    GetMajorIntervalEquip = 0
    v = Null

    strSQL = _
           "SELECT dbo_Equipment.UseGlobalLifeCycle, dbo_EquipType.MajorInterval AS ET, dbo_Equipment.MajorInterval " & _
           "FROM dbo_Equipment " & _
           "LEFT JOIN dbo_EquipType ON dbo_Equipment.EquipTypeID = dbo_EquipType.EquipTypeID " & _
           "WHERE [EquipmentID] = " & CStr(aEquipmentID)
    
    Set db = CurrentDb
    Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    
    If rs.RecordCount > 0 Then
        rs.MoveFirst
        If Nz(rs![UseGlobalLifeCycle], 0) = 0 Then
            v = rs![MajorInterval]
        End If
        
        If IsNull(v) Then
            v = rs![ET]
        End If
        
        If Nz(v, 0) > 0 Then
            GetMajorIntervalEquip = CDbl(v)
        End If
    End If
    
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " GetMajorIntervalEquip" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function


