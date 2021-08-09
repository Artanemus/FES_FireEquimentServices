Attribute VB_Name = "mdlDelete"
'@Folder("FES_Database")
Option Compare Database
Option Explicit

Const ModuleName As String = "mdlToolBox"
Private vReturnValue As Variant

Public Property Let ReturnValue(X As Variant)
    vReturnValue = X
End Property

Public Property Get ReturnValue() As Variant
    ReturnValue = vReturnValue
End Property


Public Function DeleteEquipment() As Boolean
    Dim msg As String
    Dim s As String
    Dim frm As Form
    Dim mOpenArgs As String
    Dim SQL As String
    Dim v As Variant
    Dim rtn As Integer
    Dim rst As DAO.Recordset

    On Error GoTo PROC_EXIT
    
    mOpenArgs = "DELETE EQUIPMENT"
    DeleteEquipment = False
    
    ' Go grab the ID
    DoCmd.OpenForm "xDlgGoto_DELETE_ID", , , , , acDialog, mOpenArgs
    DoCmd.Close acForm, "xDlgGoto_DELETE_ID"
    
    If (Nz(vReturnValue, 0) > 0) Then
        v = DLookup("[EquipmentID]", "dbo_Equipment", "[EquipmentID] = " & CStr(vReturnValue))
        If IsNull(v) Then
            'The Equipment ID doesn't exist.
            Beep
            MsgBox "The Equipment doesn't exist", vbOKOnly, "DELETE EQUIPMENT FAILED"
            Exit Function
        End If
    Else
        ' NULL VALUE EXIT
        Exit Function
    End If
    
    v = DLookup("[Caption]", "dbo_Equipment", "[EquipmentID] = " & CStr(vReturnValue))
        
    s = vbNullString
    s = Format(CStr(vReturnValue), "0000") & " " & CStr(v)
    s = s & vbCrLf & "This action will result in ...."
    s = s & vbCrLf & " ...REMOVE ALL Equipments's reference in ALL Stations (make EMPTY)."
    s = s & vbCrLf & " ...DELETE ALL Equipments's inspection order test results."
    s = s & vbCrLf
    s = s & vbCrLf & "DO YOU REALLY WANT TO DELETE THE EQUIPMENT?"
        
    rtn = MsgBox(s, vbYesNo Or vbExclamation Or vbDefaultButton2, "DELETE EQUIPMENT")
    If rtn = vbYes Then
    
        ' iterate over stations and NULL equipment and SET state of IsManaged and IsEmpty results
        SQL = "UPDATE dbo_Station SET [IsEmpty]=1,[IsManaged]=0,[EquipmentID]=NULL WHERE [EquipmentID]= " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        
        ' DELETE ALL TESTs that reference the equipment
        SQL = "DELETE * FROM dbo_Test WHERE [EquipmentID] = " & CStr(rst![InspectionOrderID])
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        rst.MoveNext
    
        ' DELETE .. DELETE .. DELETE .. DELETE .. DELETE .. DELETE
        SQL = "DELETE * FROM dbo_Equipment WHERE [EquipmentID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
    
        DeleteEquipment = True
        MsgBox "The EQUIPMENT was DELETED!", vbOKOnly, "DELETE EQUIPMENT"
    
    End If

PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " DeleteEquipment" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    
    Resume PROC_EXIT
End Function


Public Function DeleteSurveyOrder() As Boolean
    Dim msg As String
    Dim s As String
    Dim frm As Form
    Dim mOpenArgs As String
    Dim SQL As String
    Dim v As Variant
    Dim rtn As Integer
    Dim rst As DAO.Recordset

    On Error GoTo PROC_EXIT
    
    mOpenArgs = "DELETE SURVEY ORDER"
    DeleteSurveyOrder = False
    
    ' Go grab the ID
    DoCmd.OpenForm "xDlgGoto_DELETE_ID", , , , , acDialog, mOpenArgs
    DoCmd.Close acForm, "xDlgGoto_DELETE_ID"
    
    If (Nz(vReturnValue, 0) > 0) Then
        v = DLookup("[SurveyOrderID]", "dbo_SurveyOrder", "[SurveyOrderID] = " & CStr(vReturnValue))
        If IsNull(v) Then
            'The SurveyOrder ID doesn't exist.
            Beep
            MsgBox "The SurveyOrder doesn't exist", vbOKOnly, "DELETE SURVEY ORDER FAILED"
            Exit Function
        End If
    Else
        ' NULL VALUE EXIT
        Exit Function
    End If
        
    s = vbNullString
    s = Format(CStr(vReturnValue), "0000")
    s = s & vbCrLf
    s = s & vbCrLf & "DO YOU REALLY WANT TO DELETE THE SURVEY ORDER?"
        
    rtn = MsgBox(s, vbYesNo Or vbExclamation Or vbDefaultButton2, "DELETE SURVEY ORDER")
    If rtn = vbYes Then
        ' DELETE .. DELETE .. DELETE .. DELETE .. DELETE .. DELETE
        SQL = "DELETE * FROM dbo_SurveyOrder WHERE [SurveyOrderID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
    
        DeleteSurveyOrder = True
        MsgBox "The Survey Order was DELETED!", vbOKOnly, "DELETE SURVEY ORDER"
    
    End If

PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " DeleteSurveyOrder" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    
    Resume PROC_EXIT
End Function


Public Function DeleteInspectionOrder() As Boolean
    Dim msg As String
    Dim s As String
    Dim frm As Form
    Dim mOpenArgs As String
    Dim SQL As String
    Dim v As Variant
    Dim rtn As Integer
    Dim rst As DAO.Recordset

    On Error GoTo PROC_EXIT
    
    mOpenArgs = "DELETE INSPECTION ORDER"
    DeleteInspectionOrder = False
    
    ' Go grab the ID
    DoCmd.OpenForm "xDlgGoto_DELETE_ID", , , , , acDialog, mOpenArgs
    DoCmd.Close acForm, "xDlgGoto_DELETE_ID"
    
    If (Nz(vReturnValue, 0) > 0) Then
        v = DLookup("[InspectionOrderID]", "dbo_InspectionOrder", "[InspectionOrderID] = " & CStr(vReturnValue))
        If IsNull(v) Then
            'The InspectionOrder ID doesn't exist.
            Beep
            MsgBox "The InspectionOrder doesn't exist", vbOKOnly, "DELETE InspectionOrder FAILED"
            Exit Function
        End If
    Else
        ' NULL VALUE EXIT
        Exit Function
    End If
    
    s = vbNullString
    s = Format(CStr(vReturnValue), "0000")
    s = s & vbCrLf & "This action will result in ...."
    s = s & vbCrLf & " ...DELETE ALL InspectionOrder's inspection test results."
    s = s & vbCrLf
    s = s & vbCrLf & "DO YOU REALLY WANT TO DELETE THE INSPECTION ORDER?"
        
    rtn = MsgBox(s, vbYesNo Or vbExclamation Or vbDefaultButton2, "DELETE InspectionOrder")
    If rtn = vbYes Then
        ' iterate over inspection orders and delete test results
        SQL = "SELECT * FROM dbo_InspectionOrder WHERE [InspectionOrderID] = " & CStr(vReturnValue)
        Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        Do While Not rst.EOF
           SQL = "DELETE * FROM dbo_Test WHERE [InspectionOrderID] = " & CStr(rst![InspectionOrderID])
           CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
           rst.MoveNext
        Loop
        rst.Close
        Set rst = Nothing
                         
        ' DELETE .. DELETE .. DELETE .. DELETE .. DELETE .. DELETE
        SQL = "DELETE * FROM dbo_InspectionOrder WHERE [InspectionOrderID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
    
        DeleteInspectionOrder = True
        MsgBox "The Inspection Order was DELETED!", vbOKOnly, "DELETE INSPECTION ORDER"
    
    End If

PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " DeleteInspectionOrder" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    
    Resume PROC_EXIT
End Function


Public Function DeleteSite() As Boolean
    Dim msg As String
    Dim s As String
    Dim frm As Form
    Dim mOpenArgs As String
    Dim SQL As String
    Dim v As Variant
    Dim rtn As Integer
    Dim rst As DAO.Recordset

    On Error GoTo PROC_EXIT
    
    mOpenArgs = "DELETE SITE"
    DeleteSite = False
    
    ' Go grab the ID
    DoCmd.OpenForm "xDlgGoto_DELETE_ID", , , , , acDialog, mOpenArgs
    DoCmd.Close acForm, "xDlgGoto_DELETE_ID"
    
    If (Nz(vReturnValue, 0) > 0) Then
        v = DLookup("[SiteID]", "dbo_Site", "[SiteID] = " & CStr(vReturnValue))
        If IsNull(v) Then
            'The Site ID doesn't exist.
            Beep
            MsgBox "The Site doesn't exist", vbOKOnly, "DELETE SITE FAILED"
            Exit Function
        End If
    Else
        ' NULL VALUE EXIT
        Exit Function
    End If
    
    v = DLookup("[Address]", "dbo_Site", "[SiteID] = " & CStr(vReturnValue))
    
    s = vbNullString
    s = Format(CStr(vReturnValue), "0000") & " " & CStr(v)
    s = s & vbCrLf & "This action will result in ...."
    s = s & vbCrLf & " ...DELETE ALL Test results for each Site's Stations."
    s = s & vbCrLf & " ...DELETE ALL Site's Stations."
    s = s & vbCrLf & " ...DELETE ALL Site's customer-site LINKs."
    s = s & vbCrLf
    s = s & vbCrLf & "DO YOU REALLY WANT TO DELETE THE SITE?"
        
    rtn = MsgBox(s, vbYesNo Or vbExclamation Or vbDefaultButton2, "DELETE SITE")
    If rtn = vbYes Then
        ' ##############  DELETE THE Site
        
        ' Delete ALL Test's
        ' iterate over each station
        SQL = "SELECT * FROM dbo_Station WHERE [SiteID] = " & CStr(vReturnValue)
        Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        Do While Not rst.EOF
           SQL = "DELETE * FROM dbo_Test WHERE [StationID] = " & CStr(rst![StationID])
           CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
           rst.MoveNext
        Loop
        rst.Close
        Set rst = Nothing
        
        ' Delete ALL STATIONS
        SQL = "DELETE * FROM dbo_Station WHERE [SiteID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
                
        ' Delete ALL CustSite LINKS
        SQL = "DELETE * FROM dbo_CustSite WHERE [SiteID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
    
        ' DELETE .. DELETE .. DELETE .. DELETE .. DELETE .. DELETE
        SQL = "DELETE * FROM dbo_Site WHERE [SiteID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
    
        DeleteSite = True
        MsgBox "The Site was DELETED!", vbOKOnly, "DELETE SITE"
    
    End If

PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " DeleteSite" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    
    Resume PROC_EXIT
End Function




Public Function DeleteCustomer() As Boolean
    Dim msg As String
    Dim s As String
    Dim frm As Form
    Dim mOpenArgs As String
    Dim SQL As String
    Dim v As Variant
    Dim rtn As Integer
    Dim rst As DAO.Recordset

    On Error GoTo PROC_EXIT
    
    mOpenArgs = "DELETE CUSTOMER"
    DeleteCustomer = False
    
    ' Go grab the ID
    DoCmd.OpenForm "xDlgGoto_DELETE_ID", , , , , acDialog, mOpenArgs
    DoCmd.Close acForm, "xDlgGoto_DELETE_ID"
    
    If (Nz(vReturnValue, 0) > 0) Then
        v = DLookup("[CustomerID]", "dbo_Customer", "[CustomerID] = " & CStr(vReturnValue))
        If IsNull(v) Then
            'The Customer ID doesn't exist.
            Beep
            MsgBox "The Customer doesn't exist", vbOKOnly, "DELETE Customer FAILED"
            Exit Function
        End If
    Else
        ' NULL VALUE EXIT
        Exit Function
    End If
    
    v = DLookup("[CustName]", "dbo_Customer", "[CustomerID] = " & CStr(vReturnValue))
    
    s = vbNullString
    s = Format(CStr(vReturnValue), "0000") & " " & CStr(v)
    s = s & vbCrLf & "This action will result in ...."
    s = s & vbCrLf & " ...DELETE ALL Customer's contact numbers."
    s = s & vbCrLf & " ...DELETE ALL Customer's addresses."
    s = s & vbCrLf & " ...DELETE ALL Customer's emails."
    s = s & vbCrLf & " ...REMOVE ALL Customer's contact associations."
    s = s & vbCrLf & " ...DELETE ALL Customer's survey orders."
    s = s & vbCrLf & " ...DELETE ALL Customer's inspection test results."
    s = s & vbCrLf & " ...DELETE ALL Customer's inspection orders."
    s = s & vbCrLf & " ...DELETE ALL Customer's customer-site LINKs."
    s = s & vbCrLf
    s = s & vbCrLf & "DO YOU REALLY WANT TO DELETE THE CUSTOMER?"
        
    rtn = MsgBox(s, vbYesNo Or vbExclamation Or vbDefaultButton2, "DELETE Customer")
    If rtn = vbYes Then
        'DELETE THE Customer
        ' Delete ALL contact numbers
        SQL = "DELETE * FROM dbo_CustContactNum WHERE [CustomerID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        ' Delete ALL Addresses
        SQL = "DELETE * FROM dbo_CustAddress WHERE [CustomerID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        ' Delete ALL Email
        SQL = "DELETE * FROM dbo_CustEmail WHERE [CustomerID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        ' Delete ALL CustContact Info
        SQL = "DELETE * FROM dbo_CustContact WHERE [CustomerID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        ' Delete ALL Survey Orders
        SQL = "DELETE * FROM dbo_SurveyOrder WHERE [CustomerID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        
        ' iterate over inspection orders and delete test results
        SQL = "SELECT * FROM dbo_InspectionOrder WHERE [CustomerID] = " & CStr(vReturnValue)
        Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        Do While Not rst.EOF
           SQL = "DELETE * FROM dbo_Test WHERE [InspectionOrderID] = " & CStr(rst![InspectionOrderID])
           CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
           rst.MoveNext
        Loop
        rst.Close
        Set rst = Nothing
         
        ' Delete ALL Inspection Orders
        SQL = "DELETE * FROM dbo_InspectionOrder WHERE [CustomerID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
                
        ' Delete ALL CustSite
        SQL = "DELETE * FROM dbo_CustSite WHERE [CustomerID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
    
        ' DELETE .. DELETE .. DELETE .. DELETE .. DELETE .. DELETE
        SQL = "DELETE * FROM dbo_Customer WHERE [CustomerID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
    
        DeleteCustomer = True
        MsgBox "The Customer was DELETED!", vbOKOnly, "DELETE CUSTOMER"
    
    End If

PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " DeleteCustomer" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    
    Resume PROC_EXIT
End Function


    

Public Function DeleteHR() As Boolean
    Dim msg As String
    Dim s As String
    Dim frm As Form
    Dim mOpenArgs As String
    Dim SQL As String
    Dim v As Variant
    Dim v2 As Variant
    Dim rtn As Integer

    On Error GoTo PROC_EXIT
    
    mOpenArgs = "DELETE HR"
    DeleteHR = False
    
    
    
    ' Go grab the ID
    DoCmd.OpenForm "xDlgGoto_DELETE_ID", , , , , acDialog, mOpenArgs
    DoCmd.Close acForm, "xDlgGoto_DELETE_ID"
    
    If (Nz(vReturnValue, 0) > 0) Then
        v = DLookup("[HRID]", "dbo_HR", "[HRID] = " & CStr(vReturnValue))
        If IsNull(v) Then
            'The HR ID doesn't exist.
            Beep
            MsgBox "The HR doesn't exist", vbOKOnly, "DELETE HR FAILED"
            Exit Function
        End If
    Else
        ' NULL VALUE EXIT
        Exit Function
    End If
    
    v = DLookup("[LastName]", "dbo_HR", "[HRID] = " & CStr(vReturnValue))
    v2 = DLookup("[FirstName]", "dbo_HR", "[HRID] = " & CStr(vReturnValue))
    
    s = vbNullString
    s = Format(CStr(vReturnValue), "0000") & " " & CStr(v2) & " " & UCase(CStr(v))
    s = s & vbCrLf & "This action will result in ...."
    s = s & vbCrLf & " ...DELETE ALL HR's contact numbers."
    s = s & vbCrLf & " ...DELETE ALL HR's addresses."
    s = s & vbCrLf & " ...DELETE ALL HR's emails."
    s = s & vbCrLf & " ...DELETE ALL HR's zone info."
    s = s & vbCrLf & " ...DELETE ALL HR's roles assigned."
    s = s & vbCrLf & " ...REMOVE ALL HR's customer contact assoc.."
    s = s & vbCrLf & " ...REMOVE ALL HR's customer's site contact assoc.."
    s = s & vbCrLf & " ...REMOVE ALL HR's survey orders inclusion."
    s = s & vbCrLf & " ...REMOVE ALL HR's inspection orders inclusion."
    s = s & vbCrLf
    s = s & vbCrLf & "DO YOU REALLY WANT TO DELETE THE HR?"
        
    rtn = MsgBox(s, vbYesNo Or vbExclamation Or vbDefaultButton2, "DELETE HR")
    If rtn = vbYes Then
        'DELETE THE HR
        ' Delete ALL contact numbers
        SQL = "DELETE * FROM dbo_HRContactNum WHERE [HRID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        ' Delete ALL Addresses
        SQL = "DELETE * FROM dbo_HRAddress WHERE [HRID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        ' Delete ALL Email
        SQL = "DELETE * FROM dbo_HREmail WHERE [HRID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        ' Delete ALL ZONE Infor
        SQL = "DELETE * FROM dbo_HRZone WHERE [HRID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        ' Delete ALL Roles
        SQL = "DELETE * FROM dbo_RoleList WHERE [HRID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        ' Delete ALL CustContact Info
        SQL = "DELETE * FROM dbo_CustContact WHERE [HRID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        ' Update CustSite info
        SQL = "UPDATE dbo_CustSite SET [SiteContactID] = NULL WHERE [SiteContactID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        ' Update Survey Orders info
        SQL = "UPDATE dbo_SurveyOrder SET [HRID] = NULL WHERE [HRID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
        ' Update Inspection Orders info
        SQL = "UPDATE dbo_InspectionOrder SET [HRID] = NULL WHERE [HRID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
    
        ' DELETE .. DELETE .. DELETE .. DELETE .. DELETE .. DELETE
        SQL = "DELETE * FROM dbo_HR WHERE [HRID] = " & CStr(vReturnValue)
        CurrentDb.Execute SQL, dbFailOnError + dbSeeChanges
    
        DeleteHR = True
        MsgBox "The HR was DELETED!", vbOKOnly, "DELETE HR"
    
    End If

PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " DeleteHR" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    
    Resume PROC_EXIT
End Function


