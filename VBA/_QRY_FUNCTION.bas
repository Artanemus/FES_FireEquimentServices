Attribute VB_Name = "_QRY_FUNCTION"
Option Compare Database
Option Explicit

Const ModuleName = "_QRY_FUNCTION"

' SYNTAX for INLINE PrettyAddress
'xAddress: Replace(Replace([Address],Chr(10),""),Chr(13)," ")

Public Function PrettyAddress(aAddress As String) As String
    ' called by site form to CONCAT multi lines used in the address field.
    ' does this by stripping out vbcrlf
    
    PrettyAddress = aAddress
    If Len(aAddress) > 0 Then
        PrettyAddress = Replace(aAddress, vbLf, " ")
    End If
    If Len(PrettyAddress) = 0 Then PrettyAddress = vbNullString
        
End Function


Public Function PrettyAddress64Char(ByVal aAddress As String) As String
    Dim s As String
    Dim i As Variant
    Dim maxsize As Integer
    
    On Error GoTo err_Exit
    maxsize = 64
    PrettyAddress64Char = aAddress
    s = Replace(aAddress, "" & vbCrLf, " ")
    If Len(s) > maxsize Then
        s = Left(s, maxsize)
        i = InStrRev(s, " ")
        If Nz(i, 0) > 0 Then
            s = Left(s, i)
        End If
    End If
    PrettyAddress64Char = s
    
    If Len(PrettyAddress64Char) = 0 Then PrettyAddress64Char = vbNullString
    
err_Proc:
    On Error Resume Next
    Exit Function
    
err_Exit:
    GoTo err_Proc
    
End Function


Public Function StatusMin(StatusNum As Integer) As Integer
    If (StatusNum = 0) Then
        StatusMin = 0
    Else
        StatusMin = StatusNum
    End If
End Function


Public Function StatusMax(StatusNum As Integer) As Integer
    If (StatusNum = 0) Then
        StatusMax = 99
    Else
        StatusMax = StatusNum
    End If
End Function

Private Function PrettyPhoneNum(aPhoneNum As Variant) As String
    Dim v As Variant
    Dim i As Variant
    PrettyPhoneNum = vbNullString
    v = aPhoneNum
    If Len(Nz(v, vbNullString)) > 0 Then
        ' Trim leading zero's
        i = InStr(1, v, "00")
        If i = 1 Then
            ' no area code given
            i = InStr(1, v, "000")
            ' drop 3 character2
            v = Mid(v, 4)
        Else
            ' two digit area code
            ' drop 1 characters
            v = Mid(v, 2)
        End If
        
        v = Trim(v)
        If Len(Nz(v, vbNullString)) > 0 Then
            PrettyPhoneNum = CStr(v)
        End If
    End If
End Function


' Find the customer's name and appends the PRIMARY business phone number
' Area code tidied at head of the phone number
' Phone number is wrapped in barckets and text (PH:########)
' Returns only the customer's name if no business number is found ....
'
' INLINE QUERY STRING
' CustDetail: [CustName] & ' ' & IIf(Len([xqry_Cust_PRIMARYNumber].[ContactNUm])>0,'(PH:' & [xqry_Cust_PRIMARYNumber].[ContactNUm] & ')','')

Public Function CustName_Phone(aCustomerID As Long) As String
    Dim v As Variant
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim i As Variant
    
    CustName_Phone = vbNullString

    v = DLookup("[CustName]", "dbo_Customer", "[CustomerID] = " & CStr(aCustomerID))
    If Nz(v, 0) > 0 Then
        CustName_Phone = CStr(v)
        Set db = CurrentDb
        Set rs = db.OpenRecordset("xqry_Cust_PRIMARYNumber", dbOpenDynaset, dbFailOnError + dbSeeChanges)
        rs.Filter = "[CustomerID] = " & CStr(aCustomerID)
        rs.Requery
        If rs.BOF = True And rs.EOF = True Then
            ' No customerID
            Exit Function
        Else
            rs.MoveFirst
            v = PrettyPhoneNum(rs![ContactNum])
            If Len(Nz(v, vbNullString) > 0) Then
                CustName_Phone = CustName_Phone & "(PH:" & CStr(v) & ")"
            End If
        End If
    End If

End Function


Public Function CustPrimaryHR_Phone(aCustomerID As Long) As String
    Dim v As Variant
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim i As Variant
    
    CustPrimaryHR_Phone = vbNullString

    Set db = CurrentDb
    Set rs = db.OpenRecordset("xqry_Cust_PRIMARYHRNumber", dbOpenDynaset, dbFailOnError + dbSeeChanges)
    rs.Filter = "[CustomerID] = " & CStr(aCustomerID)
    rs.Requery
    If rs.BOF = True And rs.EOF = True Then
        ' No customerID
        Exit Function
    Else
        rs.MoveFirst
        v = rs![HRID]
        If Nz(v, 0) > 0 Then
            CustPrimaryHR_Phone = rs![FirstName] & " " & UCase(rs![LastName])
            v = PrettyPhoneNum(rs![ContactNum])
            If Len(Nz(v, vbNullString) > 0) Then
                CustPrimaryHR_Phone = CustPrimaryHR_Phone & "(PH:" & CStr(v) & ")"
            End If
        End If
    End If

End Function

Public Function CustSiteContact_Phone(aCustSiteID As Long) As String
    Dim v As Variant
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim i As Variant
    
    CustSiteContact_Phone = vbNullString

    Set db = CurrentDb
    Set rs = db.OpenRecordset("xqry_Cust_SiteContactNumber", dbOpenDynaset, dbFailOnError + dbSeeChanges)
    rs.Filter = "[CustSiteID] = " & CStr(aCustSiteID)
    rs.Requery
    If rs.BOF = True And rs.EOF = True Then
        ' No Customer Site ID
        Exit Function
    Else
        rs.MoveFirst
        v = rs![SiteContactID]
        If Nz(v, 0) > 0 Then
            CustSiteContact_Phone = rs![FirstName] & " " & UCase(rs![LastName])
            v = PrettyPhoneNum(rs![ContactNum])
            If Len(Nz(v, vbNullString) > 0) Then
                CustSiteContact_Phone = CustSiteContact_Phone & "(PH:" & CStr(v) & ")"
            End If
        End If
    End If

End Function


' CHECKs if ANY hydrant in inpection order requires a major service
Public Function IsHydrantMajorMinor(aInspectionOrderID As Long, ByRef IsHydrantMajor_Err As Boolean, Optional doMinor As Boolean = False) As Boolean
    Dim rs As DAO.Recordset
    Dim rs2 As DAO.Recordset
    Dim db As DAO.Database
    Dim strSQL As String
    Dim v As Variant
    Dim MInterval As Variant
    Dim qdf As DAO.QueryDef
    Dim msg As String
    
    On Error GoTo PROC_ERR:
    
    IsHydrantMajorMinor = False
    IsHydrantMajor_Err = True
    
    If Nz(aInspectionOrderID, 0) = 0 Then
        Exit Function
    End If

    Set db = CurrentDb
    
        'Get the parameter query
    Set qdf = db.QueryDefs("xqyLifeCycleHydrant")
    
    'Supply the parameter value
    qdf.Parameters("aInspectionOrderID") = aInspectionOrderID
    
    'Open a Recordset based on the parameter query
    Set rs = qdf.OpenRecordset(dbOpenDynaset, dbFailOnError + dbSeeChanges)
    
    'Set rs = db.OpenRecordset("xqryLifeCycle_Hydrant", dbOpenDynaset, dbFailOnError + dbSeeChanges)
    'rs.Filter = "[InspectionOrderID] = " & CStr(aInspectionOrderID)
    'rs.Requery
    
    strSQL = "SELECT * FROM dbo_EquipType WHERE EquipTypeID = 1"
    Set rs2 = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    
    If rs.BOF = True And rs.EOF = True Then
        ' No hydrants?
        Exit Function
    Else
        rs.MoveFirst
        ' CHECK each HYDRANT At the Site....
        Do While Not rs.EOF
            If rs![UseGlobalLifeCycle] = False Then
                ' use the local params for minor/major interval
            Else
                ' use the global params - DEFAULT
                ' CURRENTLY THIS IS THE ONLY OPTION
                ' load global params
                If rs2.BOF = True And rs2.EOF = True Then
                    ' No hydrant equipment type!!!
                    Exit Function
                Else
                    If doMinor Then
                        MInterval = rs2!MinorInterval
                    Else
                        MInterval = rs2!MajorInterval
                    End If
                    ' check all params ..
                    If Nz(rs![RequestedDT], 0) > 0 And Nz(rs![LifeCycleSeed], 0) > 0 And Nz(MInterval, 0) > 0 Then
                        If IsDate(rs![RequestedDT]) And IsDate(rs![LifeCycleSeed]) Then
                            ' date difference in months - divided by the majorInterval
                            v = DateDiff("m", rs![LifeCycleSeed], rs![RequestedDT]) / MInterval
                            ' if this is less than the service interval - it needs lifecycle service
                            If v <= mdlCompany.GetServiceInterval() Then
                                IsHydrantMajor_Err = False
                                ' **************************************************
                                ' TODO establish this rule
                                ' **************************************************
                                ' major hydrant services are only done on level 2
                                ' **************************************************
                                If Nz(rs![LevelNum], 0) > 0 Then
                                    If rs![LevelNum] = 2 Then
                                        IsHydrantMajorMinor = True
                                    End If
                                Else
                                    ' no levelnum data! - but the hydrant needs lifecycle service
                                    IsHydrantMajorMinor = True
                                End If
                                ' SAFE TO EXIT LOOP after finding one hydrant in need of service
                                Exit Do
                            End If
                        End If
                    End If
                End If
            End If
            ' NEXT HYDRANT
            rs.MoveNext
        Loop
    End If
    

    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    If err.Number <> 0 Then
        msg = ModuleName & " IsHydrantMajorMinor Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function
























