Attribute VB_Name = "mdlSite"
Option Compare Database
Option Explicit

Private mReturnValue As Variant
Private mOpenArgs As String
Private mDoReseed As Boolean
Private mSeedDate As Date
Private mSeedLevel As Integer
Private mMode As Integer
Private mInspectOrderID_Active As Long

Const ModuleName As String = "mdlSite"

Private Property Get HasParent(ByRef f As Form) As Boolean
    HasParent = False
    On Error GoTo handler
    HasParent = TypeName(f.Parent.Name) = "String"
    Exit Property
handler:
End Property

Public Property Get ReturnValue() As Variant
    ReturnValue = mReturnValue
End Property

Public Property Let ReturnValue(X As Variant)
    mReturnValue = X
End Property


Public Property Get DoReseed() As Boolean
    DoReseed = mDoReseed
End Property

Public Property Let DoReseed(X As Boolean)
    mDoReseed = X
End Property

Public Property Get SeedDate() As Date
    SeedDate = mSeedDate
End Property

Public Property Let SeedDate(X As Date)
    mSeedDate = X
End Property

Public Property Get SeedLevel() As Integer
    SeedLevel = mSeedLevel
End Property

Public Property Let SeedLevel(X As Integer)
    mSeedLevel = X
End Property

Public Property Get Mode() As Integer
    Mode = mMode
End Property

Public Property Let Mode(X As Integer)
    mMode = X
End Property

Public Property Get InspectOrderID_Active() As Long
    InspectOrderID_Active = mInspectOrderID_Active
End Property

Public Property Let InspectOrderID_Active(X As Long)
    mInspectOrderID_Active = X
End Property


Public Function GetSitexAddress(ByVal aSiteID As Long) As String
Dim v As Variant
Dim s As String
    Dim msg As String
    On Error GoTo PROC_ERR
    
    If Nz(aSiteID, 0) = 0 Then
        Exit Function
    End If

    GetSitexAddress = vbNullString
    v = DLookup("[Address]", "dbo_Site", "[SiteID] = " & CStr(aSiteID))
    If Nz(v, 0) > 0 Then
        s = PrettyAddress64Char(CStr(v))
        GetSitexAddress = s
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " GetSitexAddress" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
End Function


Public Function Site_Exists(ByVal aAddress As String) As Boolean
    Dim strSQL As String
    Dim db As Database
    Dim rs As Recordset
    Dim str1 As String
    Dim str2 As String
    Dim msg As String
    On Error GoTo PROC_ERR

    Site_Exists = False
    str1 = Trim(UCase(Nz(aAddress, vbNullString)))
    strSQL = _
           "SELECT dbo_Site.SiteID, UCase(Nz([Address],'')) AS s1 " & _
           "FROM dbo_Site " & _
           "WHERE UCase(Nz([Address],'')) = UCase( '" & str1 & "');"
    
    Set db = CurrentDb
    Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rs.RecordCount > 0 Then Site_Exists = True
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " SiteExists" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT

End Function

Public Function Site_SiteManager(aSiteID As Long) As String
    ' Return the primary phone (PRIMARY) , modbile phone (Mobile), office phone (Office) , home phone (Home)

End Function

Public Function Site_PrimaryPhone_SiteManager(aSiteID As Long) As String
    ' Returns the PRIMARY email address

End Function

Public Sub GotoSite(aSiteID As Long)
    Dim strCriteria As String
    Dim rst As DAO.Recordset
    Dim FormNameToUseStr As String
    ' Reference re - directed
    ' Me! ... Cutomer ID hasn't been placed in the form but included in Query.
    If (aSiteID > 0) Then
        FormNameToUseStr = "_Site"
        If Not IsLoaded(FormNameToUseStr) Then
            DoCmd.OpenForm FormNameToUseStr, acNormal
        End If
        Forms(FormNameToUseStr).FilterOn = False
        Set rst = Forms(FormNameToUseStr).RecordsetClone
        strCriteria = "[SiteID] = " & CStr(aSiteID)
        rst.FindFirst strCriteria
        If Not rst.NoMatch Then
            Forms(FormNameToUseStr).Bookmark = rst.Bookmark
            Forms(FormNameToUseStr).SetFocus
            Exit Sub
        Else
            MsgBox "NoMatch :: Unable to bookmark ID.", , "Error finding booking..."
        End If
        Set rst = Nothing
    Else
        Beep
    End If
    
End Sub


Public Function DisableSite(ByVal aCustSiteID As Long) As Boolean
    Dim v As Variant
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim msg As String
    Dim results As Integer
    Dim aOpenArgs As String
    Dim CancelledOrderStr As String
    Dim doDisplayCancelledOrders As Boolean

    On Error GoTo PROC_ERR
       
    DisableSite = False
    CancelledOrderStr = vbNullString
    doDisplayCancelledOrders = False
    
    strSQL = "Select [IsEnabled] from dbo_CustSite where [CustSiteID] = " & CStr(aCustSiteID)
    Set db = CurrentDb
    Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If Not IsNull(rs) Then
        rs.MoveFirst
        If rs![IsEnabled] = False Then
            Beep
            Exit Function
        Else
            aOpenArgs = CStr(aCustSiteID)
            DoCmd.OpenForm "xDlgSite_Disable", , , , , acDialog, aOpenArgs
            DoCmd.Close acForm, "xDlgSite_Disable"
        
            If mReturnValue = 1 Or mReturnValue = 2 Then
                rs.Edit
                rs![IsEnabled] = False
                rs.Update
                DisableSite = True
                If mReturnValue = 2 Then
                    ' cancell all outstanding inspection orders
                    rs.Close
                    Set rs = Nothing
                    strSQL = _
                           "SELECT dbo_InspectionOrder.InspectionOrderID, dbo_InspectionOrder.InspectionStatusID, dbo_InspectionOrder.CustSiteID " & _
                           "FROM dbo_InspectionOrder " & _
                           "WHERE (((dbo_InspectionOrder.InspectionStatusID)<>2 " & _
                           "Or (dbo_InspectionOrder.InspectionStatusID)<>3) " & _
                           "AND ((dbo_InspectionOrder.CustSiteID)=" & CStr(aCustSiteID) & " ));"
                    Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
                    If (rs.RecordCount > 0) Then
                        rs.MoveFirst
                        Do Until rs.EOF
                            If (rs![InspectionStatusID] <> 2) And (rs![InspectionStatusID] <> 3) Then
                                CancelledOrderStr = CancelledOrderStr & ", " & CStr(rs![InspectionOrderID])
                                doDisplayCancelledOrders = True
                                rs.Edit
                                rs![InspectionStatusID] = 3
                                rs.Update
                            End If
                            rs.MoveNext
                        Loop
                    End If
                End If
            End If
        End If
    End If
    
    If doDisplayCancelledOrders Then
    
        msg = "The following inspection orders were cancelled." & vbCrLf & _
              CancelledOrderStr
        results = MsgBox(msg, _
        VbMsgBoxStyle.vbOKOnly Or VbMsgBoxStyle.vbInformation Or VbMsgBoxStyle.vbDefaultButton1, _
        mdlCompany.GetCompanyCode() & " - CANCELLED ORDERS")
    
    End If
    
PROC_EXIT:
    'Cleanup
    Set rs = Nothing
    Set db = Nothing
    Exit Function

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " DisableSite" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
    
End Function

Public Function EnableSite(ByVal aCustSiteID As Long) As Boolean
    Dim v As Variant
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim msg As String
    Dim results As Integer
    Dim aSiteID As Long
    Dim aCustomerID As Long
    Dim aOpenArgs As String
    Dim cCode As String
    Dim success As Boolean
    

    On Error GoTo PROC_ERR
       
    EnableSite = False
    
    Set db = CurrentDb
    
    If aCustSiteID = 0 Then
        Beep
        Exit Function
    End If
    
    ' CHECK is the customer site isn't already enabled?
    ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    v = DLookup("[IsEnabled]", "dbo_CustSite", "[CustSiteID] = " & CStr(aCustSiteID))
    ' value can be NULL or 0 if disabled else TRUE (-1)
    If Nz(v, 0) <> 0 Then
        Beep
        Exit Function
    End If
    
    ' CHECK has another customer got this site enabled?
    ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    v = DLookup("[SiteID]", "dbo_CustSite", "[CustSiteID] = " & CStr(aCustSiteID))
    If Nz(v, 0) > 0 Then
        aSiteID = CLng(v)
        strSQL = _
               "SELECT dbo_CustSite.CustSiteID, dbo_CustSite.SiteID, dbo_CustSite.CustomerID, dbo_CustSite.IsEnabled, dbo_Customer.CustName " & _
               "FROM dbo_CustSite INNER JOIN dbo_Customer ON dbo_CustSite.CustomerID = dbo_Customer.CustomerID " & _
               "WHERE (((dbo_CustSite.CustSiteID)<> " & CStr(aCustSiteID) & ") AND ((dbo_CustSite.SiteID)= " & _
               CStr(aSiteID) & ") AND ((dbo_CustSite.IsEnabled) = True));"


        Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If Not IsNull(rs) Then
            If rs.RecordCount > 0 Then
                rs.MoveFirst
                ' found a customer who is using this site
                msg = "Unable to enable this site as it's being used by." & vbCrLf & _
                      "CustomerID: " & CStr(rs!CustomerID) & " " & rs![CustName] & vbCrLf & _
                      "The action will abort."
                cCode = mdlCompany.GetCompanyCode
                results = MsgBox(msg, _
                VbMsgBoxStyle.vbOKOnly Or VbMsgBoxStyle.vbExclamation Or VbMsgBoxStyle.vbDefaultButton1, _
                cCode & " Error - Enable Site")
                
                ' EXIT FUNCTION
                ' ----------------------
                Exit Function
                
            End If
        End If
        rs.Close
        Set rs = Nothing
    Else
        Exit Function
    End If
    
    mDoReseed = False
    mSeedDate = Empty
    mSeedLevel = 0
    
    ' DOES THE CUSTOMER HAVE  A INSPECTION ORDER HISTORY? ARE THEY A NEW CUSTOMER?
    strSQL = _
        "SELECT InspectionOrderID " & _
        "FROM dbo_InspectionOrder " & _
        "WHERE (dbo_InspectionOrder.CustSiteID = " & CStr(aCustSiteID) & " ) "
        
    Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    mMode = 0
    If rs.RecordCount > 0 Then
        ' RUN DIALOGUE - CUSTOMER HAS INSPECTION ORDER HISTORY
        ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        ' return fMode 1 or 2
        ' mode 1 - user input or reference past inspection order
        ' mode 2 - make active future inspection order via fMakeActive_InspectionOrderID
        aOpenArgs = CStr(aCustSiteID)
        DoCmd.OpenForm "xDlgSite_Enable", , , , , acDialog, aOpenArgs
        DoCmd.Close acForm, "xDlgSite_Enable"
    
    Else
        ' RUN DIALOGUE - NEW CUSTOMER
        ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        aOpenArgs = CStr(aCustSiteID)
        DoCmd.OpenForm "xDlgSite_Enable_NewCust", , , , , acDialog, aOpenArgs
        DoCmd.Close acForm, "xDlgSite_Enable_NewCust"
        ' RE-SEED
        mMode = 1
    
    End If
    rs.Close
    Set rs = Nothing
    
    
    ' ENABLE CUSTOMER SITE
    ' +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    If mReturnValue = 1 Then
        strSQL = "SELECT [IsEnabled], [DoReseed], [SeedDate], [SeedLevel] FROM dbo_CustSite WHERE [CustSiteID] = " & CStr(aCustSiteID)
        Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If Not IsNull(rs) Then
            Select Case mMode
            Case 1
                ' RE-SEED INSPECTION ORDER
                ' NewCustomer and ref.InspectionOrder (predated) enter here
                rs.Edit
                rs![IsEnabled] = True
                rs![DoReseed] = mDoReseed
                ' only change these params on user request for reseed
                If mDoReseed = True Then
                    If Not IsEmpty(mSeedDate) Then
                        rs![SeedDate] = mSeedDate
                        rs![SeedLevel] = mSeedLevel
                    End If
                End If
                rs.Update
                EnableSite = True
            Case 2
                ' reference past (completed or cancelled) inspection order
                ' or user inputed seeddate and seedlevel
                ' valid reference to future cancelled inspection order. MAKE ACTIVE
                ' locate mInspectOrderID_Active (InspectionOrderID)
                success = False
                If mInspectOrderID_Active > 0 Then
                    success = SetInspectionOrderActive(mInspectOrderID_Active)
                End If
                If success = True Then
                    rs.Edit
                    rs![IsEnabled] = True
                    rs![DoReseed] = False
                    rs.Update
                    EnableSite = True
                    
                    msg = "The inspection order " & CStr(mInspectOrderID_Active) & " was made ACTIVE."
                    results = MsgBox(msg, VbMsgBoxStyle.vbOKOnly Or VbMsgBoxStyle.vbInformation Or VbMsgBoxStyle.vbDefaultButton1, _
                                mdlCompany.GetCompanyCode() & " - ACTIVATED INSPECTION ORDER")
                End If
            End Select
        End If
    End If
    
    
    
    
    
        
PROC_EXIT:
    'Cleanup
    Set rs = Nothing
    Set db = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " EnableSite" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
    
End Function


Public Function SetInspectionOrderActive(ByVal aInspectionOrderID As Long) As Boolean
    Dim strSQL As String
    Dim db As Database
    Dim rs As Recordset
    Dim msg As String
    
    On Error GoTo PROC_ERR
    SetInspectionOrderActive = False
    If aInspectionOrderID > 0 Then
        strSQL = _
                "UPDATE dbo_InspectionOrder SET dbo_InspectionOrder.InspectionStatusID = 1" & _
                " WHERE (((dbo_InspectionOrder.InspectionOrderID)=" & CStr(aInspectionOrderID) & "));"
        Set db = CurrentDb
        db.Execute strSQL, dbFailOnError + dbSeeChanges
        SetInspectionOrderActive = True
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " SetInspectionOrderActive" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
        
End Function


' +---------------------------------------------
' Insert a Site into the dbo_CustSite
' +---------------------------------------------

Public Sub LinkSite(ByVal aSiteID As Long, ByVal aCustomerID As Long)
    Dim s As String
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim msg As String

    On Error GoTo PROC_ERR
       
    If aSiteID > 0 And aCustomerID > 0 Then
        'create a new contactlink record for the customer
        Set db = CurrentDb
        strSQL = "Select * FROM dbo_CustSite"
        ' BSA correct method to use DAO to connect to MSSQL
        ' else use
        Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If Not IsNull(rs) Then
            With rs
                .AddNew
                ![SiteID] = aSiteID              ' manatory
                ![CustomerID] = aCustomerID      ' manatory
                ![CreatedOn] = Date
                ![IsEnabled] = False             ' Ensures inspection orders are not generated
                ![DoReseed] = True               ' Actual state isn't important here, but init is.
                ![SeedDate] = Empty           ' Must have a valid date for inspection orders to be generated
                ![SeedLevel] = mdlCompany.GetDefStartLevel ' Safe
                ![IsArchived] = False            ' Default
                .Update
                
                ' RETURN NEW CUSTSITE RECORD?
                ' ------------------------------
                '.Bookmark = .LastModified
                'NewSiteID = ![CustSiteID]
                ' ------------------------------
            End With
        End If
    End If
    
PROC_EXIT:
    'Cleanup
    Set rs = Nothing
    Set db = Nothing
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " LinkSiteToCust" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
End Sub

' +---------------------------------------------
' remove a Site from the dbo_CustSite
' +---------------------------------------------

Public Sub UnLinkSite(ByVal aSiteID As Long, ByVal aCustomerID As Long)
    Dim s As String
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim msg As String

    On Error GoTo PROC_ERR
       
    If aSiteID > 0 And aCustomerID > 0 Then
        'create a new contactlink record for the customer
        Set db = CurrentDb
        strSQL = "Select * FROM dbo_CustSite WHERE [CustomerID] = " & CStr(aCustomerID) & " AND [SiteID] = " & CStr(aSiteID)
        ' TODO : TEST FOR WORKORDERS
        ' ###########################################################################
        ' IF NO WORKORDERS THEN....
        Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If Not IsNull(rs) Then
            With rs
                ' clear the customer contact details within the site
                .Delete
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
        msg = ModuleName & " removeCustSiteLink" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
End Sub

Public Sub ArchiveLinkSite(ByVal aSiteID As Long, ByVal aCustomerID As Long)
    Dim s As String
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim msg As String

    On Error GoTo PROC_ERR
       
    If aSiteID > 0 And aCustomerID > 0 Then
        'create a new contactlink record for the customer
        Set db = CurrentDb
        strSQL = "Select * FROM dbo_CustSite WHERE [CustomerID] = " & CStr(aCustomerID) & " AND [SiteID] = " & CStr(aSiteID)
        Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If Not IsNull(rs) Then
            With rs
                ' clear the customer contact details within the site
                ![IsArchived] = True
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
        msg = ModuleName & " removeCustSiteLink" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
End Sub

Public Function IsCustLinkedToSite(ByVal aCustomerID As Long, ByVal aSiteID As Long) As Boolean
Dim v As Variant
    IsCustLinkedToSite = False
    v = DLookup("CustSiteID", "dbo_CustSite", "[SiteID] = " & CStr(aSiteID) & " AND [CustomerID] = " & CStr(aCustomerID))
    If Nz(v, 0) > 0 Then
        IsCustLinkedToSite = True
    End If
End Function

Public Function ConfirmDisableCustSite(ByVal aCustSiteID As Long) As Boolean
    Dim aOpenArgs As String
    Dim msg As String

    On Error GoTo PROC_ERR

    ConfirmDisableCustSite = False
    
    aOpenArgs = CStr(aCustSiteID)
    DoCmd.OpenForm "xDlgSite_Disable", , , , , acDialog, aOpenArgs
    DoCmd.Close acForm, "xDlgSite_Disable"
    If mReturnValue = 1 Then
        ' Disable custSite
        DisableSite aCustSiteID
        ConfirmDisableCustSite = True
    ElseIf mReturnValue = 2 Then
        'Disable custSite and cancell all outstanding orders
        DisableSite aCustSiteID
        mdlInspection.CancelOutstandingInspectionOrders aCustSiteID
        ConfirmDisableCustSite = True
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " ConfirmDisableCustSite Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
    
End Function

Public Function ConfirmLinkCustToSite(ByVal aCustomerID As Long, ByVal aSiteID As Long) As Boolean
    Dim aOpenArgs As String
    Dim msg As String

On Error GoTo PROC_ERR

    ConfirmLinkCustToSite = False
    
    aOpenArgs = CStr(aCustomerID) & "|" & CStr(aSiteID)
    DoCmd.OpenForm "xDlgSite_Link", , , , , acDialog, aOpenArgs
    DoCmd.Close acForm, "xDlgSite_Link"
    If mReturnValue = 1 Or mReturnValue = True Then
        ConfirmLinkCustToSite = True
    End If
    ' returns true of false
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " ConfirmLinkCustToSite Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
    

End Function

Public Function CountLinksToSite(ByVal aSiteID As Long) As Long
    Dim s As String
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim msg As String

    On Error GoTo PROC_ERR
    
    CountLinksToSite = 0
       
    If aSiteID > 0 Then
        'create a new contactlink record for the customer
        Set db = CurrentDb
        strSQL = _
            "SELECT dbo_CustSite.SiteID, dbo_CustSite.CustomerID, dbo_CustSite.IsEnabled " & _
            "FROM dbo_CustSite " & _
            "WHERE (((dbo_CustSite.SiteID)= " & CStr(aSiteID) & " ) );"

        Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If Not IsNull(rs) Then
            rs.MoveLast
            CountLinksToSite = rs.RecordCount
        End If
    End If
    
PROC_EXIT:
    'Cleanup
    Set rs = Nothing
    Set db = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If Err.Number <> 0 Then
        msg = ModuleName & " CountLinksToSite" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
End Function

' +---------------------------------------------
' addNew SiteStation (Equipment)
' +---------------------------------------------
Public Sub addNewSiteStation(ByVal aSiteID As Long, ByVal aEquipmentID As Long)
    Dim s As String
    Dim strSQL As String
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim msg As String

    On Error GoTo PROC_ERR
    
    If aSiteID > 0 And aEquipmentID > 0 Then
        'create a new contactlink record for the customer
        Set db = CurrentDb
        strSQL = "Select * FROM dbo_SiteStation"
        ' BSA correct method to use DAO to connect to MSSQL
        ' else use
        Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If Not IsNull(rs) Then
            With rs
                .AddNew
                ![SiteID] = aSiteID
                ![EquipmentID] = aEquipmentID
                ![CreatedOn] = Date
                .Update
                .Bookmark = .LastModified
                mReturnValue = ![SiteStationID]
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
        msg = ModuleName & " addNewSiteStation" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
End Sub

Public Sub SetHydrantCommissionDate(StationID As Long)
    Dim v As Variant
    Dim msg As String
    Dim cCode As String
    
    mReturnValue = vbNull
    
    If Nz(StationID, 0) = 0 Then
        Exit Sub
    End If
    
    ' Get the  equipment type of the station
    v = DLookup("[EquipmentID]", "dbo_Station", "[StationID] = " & CStr(StationID))
    If Nz(v, 0) > 0 Then
        v = DLookup("[EquipTypeID]", "dbo_Equipment", "[EquipmentID] = " & CStr(CLng(v)))
        If Nz(v, 0) > 0 Then
            If v <> 1 Then
                ' message dialogue
                msg = "The Equipment for this station isn't a Hydrant." & vbCrLf & _
                      "The dialogue will exit."
                cCode = mdlCompany.GetCompanyCode
                MsgBox msg, VbMsgBoxStyle.vbOKOnly Or VbMsgBoxStyle.vbCritical, cCode & " Error"
                
                Exit Sub
            Else
                mOpenArgs = CStr(StationID)
                ' run the dialogue .....
                
                DoCmd.OpenForm "xDlgSite_Hydrant", , , , , acDialog, mOpenArgs
                DoCmd.Close acForm, "xDlgSite_Hydrant"
                
                ' Return value is the hydrants commission date
                '                If mReturnValue <> 0 Then
                '                End If
            End If
        End If
    End If


End Sub


Public Sub SetHoseReelCommissionDate(StationID As Long)
    Dim v As Variant
    Dim msg As String
    Dim cCode As String
    
    mReturnValue = vbNull
    
    If Nz(StationID, 0) = 0 Then
        Exit Sub
    End If
    
    ' Get the  equipment type of the station
    v = DLookup("[EquipmentID]", "dbo_Station", "[StationID] = " & CStr(StationID))
    If Nz(v, 0) > 0 Then
        v = DLookup("[EquipTypeID]", "dbo_Equipment", "[EquipmentID] = " & CStr(CLng(v)))
        If Nz(v, 0) > 0 Then
            If v <> 9 Then
                ' message dialogue
                msg = "The Equipment for this station isn't a Hose Reel." & vbCrLf & _
                      "The dialogue will exit."
                cCode = mdlCompany.GetCompanyCode
                MsgBox msg, VbMsgBoxStyle.vbOKOnly Or VbMsgBoxStyle.vbCritical, cCode & " Error"
                
                Exit Sub
            Else
                mOpenArgs = CStr(StationID)
                ' run the dialogue .....
                
                DoCmd.OpenForm "xDlgSite_HoseReel", , , , , acDialog, mOpenArgs
                DoCmd.Close acForm, "xDlgSite_HoseReel"
                
                ' Return value is the hose reel's commission date
                '                If mReturnValue <> 0 Then
                '                End If
            End If
        End If
    End If


End Sub


Public Sub SetExtingisherCommissionDate(StationID As Long)
    Dim v As Variant
    Dim msg As String
    Dim cCode As String
    
    mReturnValue = vbNull
    
    If Nz(StationID, 0) = 0 Then
        Exit Sub
    End If
    
    ' Get the  equipment type of the station
    v = DLookup("[EquipmentID]", "dbo_Station", "[StationID] = " & CStr(StationID))
    If Nz(v, 0) > 0 Then
        v = DLookup("[EquipTypeID]", "dbo_Equipment", "[EquipmentID] = " & CStr(CLng(v)))
        If Nz(v, 0) > 0 Then
            If ((v < 3) Or (v > 8)) Then
                ' message dialogue
                msg = "The Equipment for this station isn't a Fire Extingisher." & vbCrLf & _
                      "The dialogue will exit."
                cCode = mdlCompany.GetCompanyCode
                MsgBox msg, VbMsgBoxStyle.vbOKOnly Or VbMsgBoxStyle.vbCritical, cCode & " Error"
                
                Exit Sub
            Else
                mOpenArgs = CStr(StationID)
                ' run the dialogue .....
                
                DoCmd.OpenForm "xDlgSite_Extingisher", , , , , acDialog, mOpenArgs
                DoCmd.Close acForm, "xDlgSite_Extingisher"
                
                ' Return value is the hose reel's commission date
                '                If mReturnValue <> 0 Then
                '                End If
            End If
        End If
    End If


End Sub

Public Function GetCurrLinkedCustomer(aSiteID As Long) As String
    Dim rs As DAO.Recordset
    Dim db As DAO.Database
    Dim msg As String
    Dim strSQL As String

    On Error GoTo PROC_ERR

    GetCurrLinkedCustomer = vbNullString

    strSQL = _
    "SELECT dbo_CustSite.SiteID, dbo_Customer.CustName, dbo_CustSite.IsEnabled" & _
    " FROM dbo_CustSite INNER JOIN dbo_Customer ON dbo_CustSite.CustomerID = dbo_Customer.CustomerID" & _
    " WHERE SiteID = " & CStr(aSiteID) & _
    " ORDER BY dbo_CustSite.IsEnabled DESC , dbo_CustSite.CreatedOn DESC; "
    
    If aSiteID > 0 Then
        Set db = CurrentDb
        Set rs = db.OpenRecordset(strSQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
        If rs.RecordCount > 0 Then
            If Not IsNull(rs![CustName]) Then
                GetCurrLinkedCustomer = rs![CustName]
                If rs![IsEnabled] <> 0 Then
                    GetCurrLinkedCustomer = GetCurrLinkedCustomer & " (ENABLED)"
                End If
            End If
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
        msg = ModuleName & " GetCurrLinkedCustomer" & vbCrLf & _
              "Error # " & CStr(Err.Number) & " was generated by " & Err.Source & vbCrLf & Err.Description
        MsgBox msg, , "Error", Err.HelpFile, Err.HelpContext
    End If
    Resume PROC_EXIT
End Function


