Attribute VB_Name = "_QRY_FUNCTION"
Option Compare Database
Option Explicit

Const ModuleName = "_QRY_FUNCTION"

Public Function GetContactNumHR(aHRID As Long) As String
    Dim qdf As DAO.QueryDef
    Dim rst As DAO.Recordset
    Dim dba As DAO.Database
    
    On Error GoTo PROC_ERR:
    
    GetContactNumHR = vbNullString
    If aHRID > 0 Then
        'Get the parameter query
        Set dba = CurrentDb
        Set qdf = dba.QueryDefs("xqry_HR_PRIMARYNumberParam")
        'Supply the parameter value
        qdf.Parameters("aHRID") = aHRID
        qdf.Parameters("aContactNumTypeID") = 1
        'Open a Recordset based on the parameter query
        Set rst = qdf.OpenRecordset(dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If rst.RecordCount > 0 Then
            GetContactNumHR = rst![ContactNum]
        Else
            rst.Close
            qdf.Parameters("aContactNumTypeID") = 2
            Set rst = qdf.OpenRecordset(dbOpenDynaset, dbFailOnError + dbSeeChanges)
            If rst.RecordCount > 0 Then
                GetContactNumHR = rst![ContactNum]
            End If
        
        End If
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
'    If Err.Number <> 0 Then
'        msg = ModuleName & " GetContactNumHR Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
'        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
'    End If
    Resume PROC_EXIT
    
End Function

Public Function GetContactNumCust(aCustomerID As Long) As String
    Dim qdf As DAO.QueryDef
    Dim rst As DAO.Recordset
    Dim dba As DAO.Database
    
    On Error GoTo PROC_ERR:
    
    GetContactNumCust = vbNullString
    If aCustomerID > 0 Then
        Set dba = CurrentDb
        'Get the parameter query
        Set qdf = dba.QueryDefs("xqry_Cust_PRIMARYNumberParam")
        'Supply the parameter value
        qdf.Parameters("aCustomerID") = aCustomerID
        qdf.Parameters("aContactNumTypeID") = 1
        'Open a Recordset based on the parameter query
        Set rst = qdf.OpenRecordset(dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If rst.RecordCount > 0 Then
            GetContactNumCust = rst![ContactNum]
        Else
            rst.Close
            qdf.Parameters("aContactNumTypeID") = 2
            Set rst = qdf.OpenRecordset(dbOpenDynaset, dbFailOnError + dbSeeChanges)
            If rst.RecordCount > 0 Then
                GetContactNumCust = rst![ContactNum]
            End If
        End If
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
'    If Err.Number <> 0 Then
'        msg = ModuleName & " GetContactNumCust Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
'        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
'    End If
    Resume PROC_EXIT
End Function


' get the primary number for the primary HR in the customer's list of associated contacts
Public Function GetContactNumCustHR(aCustomerID As Long) As String
    Dim qdf As DAO.QueryDef
    Dim rst As DAO.Recordset
    Dim dba As DAO.Database
    Dim aHRID As Long
    
    On Error GoTo PROC_ERR:
    
    GetContactNumCustHR = vbNullString
    If aCustomerID > 0 Then
        Set dba = CurrentDb
        'Get the parameter query
        Set qdf = dba.QueryDefs("xqry_Cust_PRIMARYHRNumberParam")
        'Supply the parameter value
        qdf.Parameters("aCustomerID") = aCustomerID
        'Open a Recordset based on the parameter query
        Set rst = qdf.OpenRecordset(dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If rst.RecordCount > 0 Then
            If Nz(rst![HRID], 0) > 0 Then
                GetContactNumCustHR = GetContactNumHR(rst![HRID])
            End If
        End If
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
'    If Err.Number <> 0 Then
'        msg = ModuleName & " GetContactNumCustHR Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
'        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
'    End If
    Resume PROC_EXIT
End Function

Private Function GetNextLifeCycle_A(aStationID As Long, Optional GetMinor As Boolean = False) As Variant
Dim v As Variant
Dim SQL As String
    Dim rst As DAO.Recordset
    Dim dbs As DAO.Database
    Dim msg As String
    Dim LifeCycleSeedDT As Date

    On Error GoTo PROC_ERR
        GetNextLifeCycle_A = Empty
        
'SELECT dbo_Station.StationID, dbo_Station.LifeCycleSeed, dbo_EquipType.MinorLifeCycle, dbo_EquipType.MajorLifeCycle
'FROM (dbo_Station INNER JOIN dbo_Equipment ON dbo_Station.EquipmentID = dbo_Equipment.EquipmentID) INNER JOIN dbo_EquipType ON dbo_Equipment.EquipTypeID = dbo_EquipType.EquipTypeID
'WHERE (((dbo_Station.StationID)=2300) AND ((dbo_Station.LifeCycleSeed) Is Not Null));
'

    ' FINDS the LIFE CYCLE datetime for the equip
    SQL = _
    "SELECT dbo_Station.StationID, dbo_Station.LifeCycleSeed, dbo_EquipType.MajorLifeCycle, dbo_EquipType.MinorLifeCycle " & _
    "FROM (dbo_Station INNER JOIN dbo_Equipment ON dbo_Station.EquipmentID = dbo_Equipment.EquipmentID) INNER JOIN dbo_EquipType ON dbo_Equipment.EquipTypeID = dbo_EquipType.EquipTypeID " & _
    "WHERE (((dbo_Station.LifeCycleSeed) Is Not Null)) AND dbo_Station.StationID = " & CStr(aStationID) & "  ;"
    If aStationID > 0 Then
            Set dbs = CurrentDb
            LifeCycleSeedDT = 0
            Set rst = dbs.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
            If rst.RecordCount > 0 Then
                LifeCycleSeedDT = rst.Fields("LifeCycleSeed").Value
                Select Case GetMinor
                Case True
                    If Nz(rst![MinorLifeCycle], 0) > 0 Then
                        GetNextLifeCycle_A = DateAdd("m", rst![MinorLifeCycle], LifeCycleSeedDT)
                    End If
                Case Else
                    If Nz(rst![MajorLifeCycle], 0) > 0 Then
                        GetNextLifeCycle_A = DateAdd("m", rst![MajorLifeCycle], LifeCycleSeedDT)
                    End If
                End Select
            End If
    End If
    
PROC_EXIT:
    'Cleanup
    Set rst = Nothing
    Set dbs = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " GetNextLifeCycle_A" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function


Private Function GetNextLifeCycle_B(aStationID As Long, Optional GetMinor As Boolean = False) As Variant
    Dim v As Variant
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim dbs As DAO.Database
    Dim msg As String
    Dim LifeCycleSeedDT As Date

    On Error GoTo PROC_ERR
    GetNextLifeCycle_B = Empty

    ' FINDS the STATIONS RequestedOn DateTime
    ' CRITERIA ....
    ' Station has been assigned a LifeCycleSeed.
    ' The Inspection Order was completed.
    ' Station PASSED it's test.
    ' Station has TestLifeCycleID FLAGGED
    
    ' LC: GetNextMajorLifeCycle([StationID])
    
    If aStationID > 0 Then
    
    
        SQL = _
               "SELECT dbo_Station.StationID, dbo_InspectionOrder.InspectionStatusID, dbo_InspectionOrder.RequestedDT, dbo_Test.Passed, dbo_Station.LifeCycleSeed, dbo_Test.TestLifeCycleID " & _
               "FROM dbo_InspectionOrder INNER JOIN (dbo_Station INNER JOIN dbo_Test ON dbo_Station.StationID = dbo_Test.StationID) ON dbo_InspectionOrder.InspectionOrderID = dbo_Test.InspectionOrderID " & _
               "WHERE (((dbo_InspectionOrder.InspectionStatusID) = 2) And ((dbo_Test.Passed) = 1) And ((dbo_Station.LifeCycleSeed) Is Not Null)) " & _
               "AND (dbo_Station.StationID) = " & CStr(aStationID) & " "
           
        Select Case GetMinor
        Case True
            ' if a Major service is done - then a Minor has been completed
            SQL = SQL & " AND ((dbo_Test.TestLifeCycleID) > 0 "
        Case Else
            ' Was a MAJOR LIFE CYCLE done?
            SQL = SQL & " AND (dbo_Test.TestLifeCycleID) = 2 "
        End Select
    
        SQL = SQL & " ORDER BY dbo_InspectionOrder.RequestedDT DESC;"
    
        Set dbs = CurrentDb
        LifeCycleSeedDT = 0
        Set rst = dbs.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If rst.RecordCount > 0 Then
            LifeCycleSeedDT = rst.Fields("LifeCycleSeed").Value
            Select Case GetMinor
            Case True
                If Nz(rst![MinorInterval], 0) > 0 Then
                    GetNextLifeCycle_B = DateAdd("m", rst![MinorInterval], LifeCycleSeedDT)
                End If
            Case Else
                If Nz(rst![MajorInterval], 0) > 0 Then
                    GetNextLifeCycle_B = DateAdd("m", rst![MajorInterval], LifeCycleSeedDT)
                End If
            End Select
        End If
    End If
    
PROC_EXIT:
    'Cleanup
    Set rst = Nothing
    Set dbs = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " GetNextLifeCycle_B" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function


Public Function GetNextMajorLifeCycle(aStationID As Long, Optional GetMinor As Boolean = False) As String
' find the next lifecycle datetime for the equipment type located in the station
    Dim msg As String
    Dim v As Variant

    On Error GoTo PROC_ERR
    
    ' on error, or no lifecycle given
    ' if LastInspection cannot be found or calculated
    GetNextMajorLifeCycle = vbNullString
    
    If aStationID > 0 Then
        v = GetNextLifeCycle_B(aStationID, GetMinor)
        If v = Empty Then
            ' use the STATIONS's seed-date to calculate the next LC DT
            v = GetNextLifeCycle_A(aStationID, GetMinor)
        End If
        If v <> Empty Then
            If IsDate(v) Then
                GetNextMajorLifeCycle = Format(CDate(v), "mm/yyyy")
            End If
        End If
    End If
    
    
PROC_EXIT:
    'Cleanup
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " GetNextMajorLifeCycle" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
End Function

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
    s = Replace(aAddress, vbNullString & vbCrLf, " ")
    If Len(s) > maxsize Then
        s = Left$(s, maxsize)
        i = InStrRev(s, " ")
        If Nz(i, 0) > 0 Then
            s = Left$(s, i)
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
            v = Mid$(v, 4)
        Else
            ' two digit area code
            ' drop 1 characters
            v = Mid$(v, 2)
        End If
        
        v = Trim$(v)
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
    Dim ContactNum As String
    
    CustName_Phone = vbNullString

    v = DLookup("[CustName]", "dbo_Customer", "[CustomerID] = " & CStr(aCustomerID))
    If Nz(v, 0) > 0 Then
        CustName_Phone = CStr(v)
        ContactNum = GetContactNumCust(aCustomerID)
        If Len(ContactNum) > 0 Then
            v = PrettyPhoneNum(ContactNum)
            If Len(Nz(v, vbNullString) > 0) Then
                CustName_Phone = CustName_Phone & " (PH:" & CStr(v) & ")"
            End If
        End If
    End If

End Function


Public Function CustPrimaryHR_Phone(aCustomerID As Long) As String
    Dim v As Variant
    Dim rst As DAO.Recordset
    Dim qdf As QueryDef
    Dim i As Variant
    Dim ContactNum As String
    
    CustPrimaryHR_Phone = vbNullString
    Set qdf = CurrentDb.QueryDefs("xqry_Cust_BESTHRNumberParam")
    qdf.Parameters("[aCustomerID]").Value = aCustomerID
    Set rst = qdf.OpenRecordset
    rst.Filter = "[CustomerID] = " & CStr(aCustomerID)
    rst.Requery
    If rst.BOF = True And rst.EOF = True Then
        ' No customerID
        Exit Function
    Else
        rst.MoveFirst
        v = rst![HRID]
        If Nz(v, 0) > 0 Then
            CustPrimaryHR_Phone = rst![FirstName] & " " & UCase(rst![LastName])
            v = PrettyPhoneNum(rst![LastOfContactNum])
            If Len(Nz(v, vbNullString) > 0) Then
                CustPrimaryHR_Phone = CustPrimaryHR_Phone & " (PH:" & CStr(v) & ")"
            End If
        End If
    End If

End Function

Public Function CustSiteContact_Phone(aCustSiteID As Long) As String
    Dim v As Variant
    Dim rst As DAO.Recordset
    Dim dbs As DAO.Database
    Dim i As Variant
    
    CustSiteContact_Phone = vbNullString

    Set dbs = CurrentDb
    Set rst = dbs.OpenRecordset("xqry_Cust_SiteContactNumber", dbOpenDynaset, dbFailOnError + dbSeeChanges)
    rst.Filter = "[CustSiteID] = " & CStr(aCustSiteID)
    rst.Requery
    If rst.BOF = True And rst.EOF = True Then
        ' No Customer Site ID
        Exit Function
    Else
        rst.MoveFirst
        v = rst![SiteContactID]
        If Nz(v, 0) > 0 Then
            CustSiteContact_Phone = rst![FirstName] & " " & UCase(rst![LastName])
            v = PrettyPhoneNum(rst![LastOfContactNum])
            If Len(Nz(v, vbNullString) > 0) Then
                CustSiteContact_Phone = CustSiteContact_Phone & " (PH:" & CStr(v) & ")"
            End If
        End If
    End If

End Function


' CHECKs if ANY hydrant in inpection order requires a major service
Public Function IsHydrantMajorMinor(aInspectionOrderID As Long, ByRef IsHydrantMajor_Err As Boolean, Optional doMinor As Boolean = False) As Boolean
    Dim rst As DAO.Recordset
    Dim dbs As DAO.Database
    Dim SQL As String
    Dim v As Variant
    Dim vInterval As Variant
    Dim qdf As DAO.QueryDef
    Dim msg As String
    
    On Error GoTo PROC_ERR:
    
    IsHydrantMajorMinor = False
    IsHydrantMajor_Err = True
    
    If Nz(aInspectionOrderID, 0) = 0 Then
        Exit Function
    End If

    Set dbs = CurrentDb
    
        'Get the parameter query
    Set qdf = dbs.QueryDefs("xqyLifeCycleHydrant")
    'Supply the parameter value
    qdf.Parameters("aInspectionOrderID") = aInspectionOrderID
    'Open a Recordset based on the parameter query
    Set rst = qdf.OpenRecordset(dbOpenDynaset, dbFailOnError + dbSeeChanges)
    
    If rst.RecordCount > 0 Then
        '#### Params held in dbo_EquipType
        ' SQL only pulls hydrants so checks and assignment can occur here.
        ' check all params
        If doMinor Then
            If IsEmpty(rst.Fields("MinorLifeCycle")) Then Exit Function
            vInterval = rst.Fields("MinorLifeCycle")
        Else
            If IsEmpty(rst.Fields("MajorLifeCycle")) Then Exit Function
            vInterval = rst.Fields("MajorLifeCycle")
        End If
        If IsEmpty(rst.Fields("ServiceInterval")) Then Exit Function
        
        ' CHECK each HYDRANT At the Site....
        Do While Not rst.EOF
            ' BAD request date in Inspection Order - BAD date in Station equipment's life-cycle seed
            If (Nz(rst.Fields("RequestedDT"), 0) <> 0) And (Nz(rst.Fields("LifeCycleSeed"), 0) <> 0) Then
                ' check all params ..
                If IsDate(rst.Fields("RequestedDT")) And IsDate(rst.Fields("LifeCycleSeed")) Then
                    ' date difference in months - divided by the Interval
                    v = DateDiff("m", rst![LifeCycleSeed], rst![RequestedDT]) / vInterval
                    '##### THE HYDRANT SERVICE INTERVAL
                    ' if this is less than the service interval - for the equipment type - it needs lifecycle service
                    If v <= rst.Fields("ServiceInterval") Then
                        IsHydrantMajor_Err = False
                        IsHydrantMajorMinor = True
                        ' SAFE TO EXIT LOOP after finding one hydrant in need of service
                        Exit Do
                    End If
                End If
            End If
        ' NEXT HYDRANT
        rst.MoveNext
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
























