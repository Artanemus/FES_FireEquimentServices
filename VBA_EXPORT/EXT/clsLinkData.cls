VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsLinkData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Compare Database
'@Folder("CLASS")
Option Explicit

Dim aClassName As String

' Used by system log
Dim CallerID As Long
Dim aCompanyInfoID As Long
Dim aCode As String

'  -----------------------
' DataBase params
'  -----------------------
' dbo_CustSite
Dim fCustSiteID As Long
Dim fCustomerID As Long
Dim fSiteID As Long
Dim fSeedDate As Variant
Dim fSeedLevel As Variant
Dim fDoReseed As Boolean
Dim fIsEnabled As Boolean
' dbo_InspectionOrder
Dim fLastInspectionOrderID As Long
Dim fLastInspectionStatusID As Long
Dim fLastAssignedTechnician As Long
Dim fLastRequestedDT As Variant
Dim fLastLevelNum As Variant
Dim fLastInProgress As Boolean
Dim fServiceInterval As Variant
' calculated
Dim fIsNewCustomer As Boolean
Dim fCalcNextRequestedDT As Date
Dim fCalcNextLevelNum As Integer
'SYSTEM DATA
Dim fMaxNumOfLevels As Integer

' DataBase Fields used in class
' GET

Public Property Get IsNewCustomer() As Boolean
    IsNewCustomer = fIsNewCustomer
End Property

Public Property Get DoReseed() As Boolean
    DoReseed = fDoReseed
End Property

Public Property Get IsEnabled() As Boolean
    IsEnabled = fIsEnabled
End Property


Public Property Get CustSiteID() As Integer
    CustSiteID = fCustSiteID
End Property

Public Property Get SiteID() As Integer
    SiteID = fSiteID
End Property

Public Property Get ServiceInterval() As Integer
    ServiceInterval = fServiceInterval
End Property

Public Property Get LastInProgress() As Boolean
    LastInProgress = fLastInProgress
End Property

Public Property Get LastInspectionOrderID() As Long
    LastInspectionOrderID = fLastInspectionOrderID
End Property

Public Property Get LastInspectionStatusID() As Long
    LastInspectionStatusID = fLastInspectionStatusID
End Property

Public Property Get LastAssignedTechnician() As Long
    LastAssignedTechnician = fLastAssignedTechnician
End Property

Public Property Get LastRequestedDT() As Date
    LastRequestedDT = Empty
    If Nz(fLastRequestedDT, 0) > 0 Then
        If IsDate(fLastRequestedDT) Then
            LastRequestedDT = CDate(fLastRequestedDT)
        End If
    End If
End Property

Public Property Get LastLevelNum() As Integer
    LastLevelNum = CInt(Nz(fLastLevelNum, 0))
End Property

Public Property Get SeedDate() As Date
    SeedDate = Empty
    If Nz(fSeedDate, 0) > 0 Then
        If IsDate(fSeedDate) Then
            SeedDate = CDate(fSeedDate)
        End If
    End If
End Property

Public Property Get SeedLevel() As Integer
    SeedLevel = CInt(Nz(fSeedLevel, 0))
End Property

' LET assign to variable
Public Property Let CustSiteID(ByVal RHS As Integer)
    fCustSiteID = RHS
End Property

' LET assign to variable
Public Property Let DoReseed(ByVal RHS As Boolean)
    fDoReseed = RHS
End Property


'' assign to object
'
'Private m_Prices As Collection
'
'' Get/Set Properties
'Property Get Prices() As Collection
'    Set Prices = m_Prices
'End Property
'
'Property Set Prices(newPrices As Collection)
'    Set m_Prices = newPrices
'End Property


Public Sub DisableCustSite()
    Dim SQL As String
    Dim dbs As Database
    Dim rst As Recordset
    Dim msg As String
    
    On Error GoTo PROC_ERR
    If fCustSiteID > 0 Then
        SQL = _
                "UPDATE dbo_CustSite SET dbo_CustSite.IsEnabled = False" & _
                " WHERE (((dbo_CustSite.CustSiteID)=" & CStr(fCustSiteID) & "));"
        Set dbs = CurrentDb
        dbs.Execute SQL, dbFailOnError + dbSeeChanges
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = aClassName & " DisableCustSite" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.SOURCE & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
        
End Sub


Public Sub ClearDoReseed()
    Dim SQL As String
    Dim dbs As Database
    Dim rst As Recordset
    Dim msg As String
    
    On Error GoTo PROC_ERR
    If fCustSiteID > 0 Then
        SQL = _
                "UPDATE dbo_CustSite SET dbo_CustSite.DoReseed = False" & _
                " WHERE (((dbo_CustSite.CustSiteID)=" & CStr(fCustSiteID) & "));"
        Set dbs = CurrentDb
        dbs.Execute SQL, dbFailOnError + dbSeeChanges
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = aClassName & " ClearReseed" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.SOURCE & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
        
End Sub

Private Sub ClearParams()
    fCalcNextRequestedDT = Empty
    fCalcNextLevelNum = 0
    fLastInspectionStatusID = 0
    fLastInProgress = False
    fLastInspectionOrderID = 0
    fLastAssignedTechnician = 0
    fLastLevelNum = 0
    fLastRequestedDT = Empty
    fIsNewCustomer = False
    fCustSiteID = 0
    fCustomerID = 0
    fSiteID = 0
    fDoReseed = False
    fIsEnabled = False
    fSeedDate = Empty
    fSeedLevel = 0
End Sub

Private Sub Class_Initialize()
    Dim msg As String
    On Error GoTo PROC_ERR
    aClassName = "clsLinkData"
    ' Parameters to pass to LOG
    CallerID = 2
    aCompanyInfoID = mdlCompany.GetCompanyInfoID
    aCode = mdlCompany.GetCompanyCode
    ClearParams

PROC_EXIT:
    On Error Resume Next
    Exit Sub

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = aClassName & " Class_Initialize" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.SOURCE & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
        
End Sub


Private Function AssertDate(ByVal Var As Variant, ByRef errMsg As String) As Boolean
    AssertDate = True
    errMsg = vbNullString
    If IsNull(Var) Then
        ' UNKNOWN state
        errMsg = "The Date is UNKNOWN."
        AssertDate = False
        Exit Function
    End If
    
    If IsEmpty(Var) Then
        ' SeedDate hasn't been assigned
        errMsg = "The Date is EMPTY."
        AssertDate = False
        Exit Function
    End If
    If CDbl(Var) < 0 Then
        ' Illegal seeddate
        errMsg = "The Date value is ILLEGAL."
        AssertDate = False
        Exit Function
    End If
    If Not IsDate(Var) Then
        ' Illegal seeddate
        errMsg = "The Date value ISN'T a DATE."
        AssertDate = False
        Exit Function
    End If
End Function

Private Function AssertLevelNum(ByVal Var As Variant, ByRef errMsg As String) As Boolean
    AssertLevelNum = True
    errMsg = vbNullString
    If IsNull(Var) Then
        ' UNKNOWN state
        errMsg = "The level number is UNKNOWN."
        AssertLevelNum = False
        Exit Function
    End If
    If IsEmpty(Var) Then
        ' SeedDate has been assigned
        errMsg = "The level number is EMPTY."
        AssertLevelNum = False
        Exit Function
    End If
    If CInt(Var) < 1 Then
        ' Illegal level in CustSite
        errMsg = "The level number value is ILLEGAL."
        AssertLevelNum = False
        Exit Function
    End If
    If CInt(Var) > fMaxNumOfLevels Then
        ' out of bounds
        errMsg = "The level number is greater than the MAX NUMBER OF LEVELS."
        AssertLevelNum = False
        Exit Function
    End If
End Function


Public Function PrepareData(aCustSiteID As Long, ByRef errMsg As String, ByVal dblServiceInterval As Double) As Boolean
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim rst2 As DAO.Recordset
    Dim msg As String
    Dim v As Variant
    Dim success As Boolean
    Dim A_ID As Long
    Dim A_DT As Date
    Dim B_ID As Long
    Dim B_DT As Date

    On Error GoTo PROC_ERR
    PrepareData = False ' FAILED to assign customer's link.
    errMsg = vbNullString
    ClearParams
    
    ' customer site parameters
    SQL = _
           "SELECT CustSiteID, CustomerID, SiteID, SeedDate, SeedLevel, DoReseed, IsEnabled FROM dbo_CustSite WHERE [CustSiteID] = " & CStr(aCustSiteID)
    Set rst2 = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    '#### POPULATE
    ' safe - manatory parameters
    fCustSiteID = rst2.Fields("CustSiteID")
    fCustomerID = rst2.Fields("CustomerID")
    fSiteID = rst2.Fields("SiteID")
    fSeedDate = rst2.Fields("SeedDate")
    fSeedLevel = rst2.Fields("SeedLevel")
    fIsEnabled = rst2.Fields("IsEnabled")
    fServiceInterval = dblServiceInterval
    
    '### SYSTEM DATA
    fMaxNumOfLevels = mdlCompany.GetGlobalDefNumOfLevels()
    
    ' Read DoReseed State
    ' The user may have asked on last customer site 'enable' to do a re-seed for the next new inspection order.
    ' This will be reset to false after a re-seeded inspection order is created.
    ' For return customers with LastInspectionOrder IN PROGRESS ie. fLastInProgress = true - DoReseed will be ignored.
    fDoReseed = rst2.Fields("DoReseed")
    
    'test if the last completed (or cancelled) order is the most recent order on the stack
'    fTestA = False
'    A_ID = FindLastInspectOrderID(fCustSiteID, A_DT, dblServiceInterval)
'    If A_ID > 0 Then
'        B_ID = FindLastFinalizedInspectOrderID(fCustSiteID, B_DT, dblServiceInterval)
'        If B_ID > 0 Then
'            If B_DT >= A_DT Then
'                fTestA = True
'            End If
'        End If
'    End If
    
    ' pulls the most recent inspection order for the customer site
    SQL = _
           "SELECT Top 1 InspectionOrderID, ServiceInterval, CustSiteID, CustomerID, SiteID, RequestedDT, LevelNum, InspectionStatusID, dbo_InspectionOrder.HRID " & _
           "FROM dbo_InspectionOrder " & _
           "WHERE (dbo_InspectionOrder.CustSiteID = " & CStr(aCustSiteID) & " ) " & _
           " AND dbo_InspectionOrder.ServiceInterval = " & CStr(dblServiceInterval) & _
           " ORDER BY dbo_InspectionOrder.RequestedDT DESC;"
    
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
    
        ' CUSTOMER HAS INSPECTION ORDER HISTORY
        fIsNewCustomer = False
        fLastInspectionOrderID = CLng(Nz(rst.Fields("InspectionOrderID"), 0))
        fLastInProgress = False
        
        ' Technician that performed the last service.
        ' PROC assigns zero if none exists.
        fLastAssignedTechnician = CLng(Nz(rst.Fields("HRID"), 0))
        
        ' #### CHECK inspection order STATUS
        If Nz(rst.Fields("InspectionStatusID"), 0) = 0 Then
            ' ######## FAILED
            errMsg = _
                "The Inspection Order " & CStr(rst.Fields("InspectionOrderID")) & " had a MISSING or BAD Inspection Status ID." & _
                vbCrLf & "Locate the inspection order and assign it a valid status!"
            Exit Function
        Else
            fLastInspectionStatusID = CLng(rst.Fields("InspectionStatusID"))
            If ((fLastInspectionStatusID <> 2) And (fLastInspectionStatusID <> 3)) Then
                fLastInProgress = True
                ' if the user wants to reseed - then do not permit
                ' no reseeding allowed on 'IN PROGRESS' state
                fDoReseed = False
            End If
        End If
        
        ' #### CHECK inspection order RequestedDT
        success = AssertDate(rst.Fields("RequestedDT"), errMsg)
        If Not success Then
            ' ######## FAILED
            errMsg = _
                "The Inspection Order " & CStr(rst.Fields("InspectionOrderID")) & " RequestedDT - " & errMsg & _
                vbCrLf & "Locate the inspection order and assign it a valid 'Requested' date && time!"
            Exit Function
        Else
            fLastRequestedDT = rst![RequestedDT]
        End If
        
        ' #### CHECK inspection order level number
        success = AssertLevelNum(rst.Fields("LevelNum"), errMsg)
        If Not success Then
            ' ######## FAILED
            errMsg = _
                "The Inspection Order " & CStr(rst.Fields("InspectionOrderID")) & " LevelNum - " & errMsg & _
                vbCrLf & "Locate the inspection order and assign it a valid level number!"
            Exit Function
        Else
            fLastLevelNum = rst![LevelNum]
        End If
        
        If success Then
            PrepareData = True
        End If
    Else
        ' NO INSPECTION RECORDS FOUND - NEW CUSTOMER
        fIsNewCustomer = True
        ' New customers must always re-seed.
        fDoReseed = True
        PrepareData = True
        
        ' this is ommitted so ENABLE LINK DLG will work ....
        
'        ' #### CHECK inspection order RequestedDT
'        Success = AssertDate(fSeedDate, errMsg)
'        If Not Success Then
'            ' ######## FAILED
'            errMsg = _
'                "The CustSite ID:" & CStr(rst.Fields("CustSiteID")) & " RequestedDT - " & errMsg & _
'                vbCrLf & "Locate the LINK and assign it a valid 'Requested' date && time!"
'            Exit Function
'        Else
'            fLastRequestedDT = rst![RequestedDT]
'        End If
'
'        ' #### CHECK inspection order level number
'        Success = AssertLevelNum(rst.Fields("LevelNum"), errMsg)
'        If Not Success Then
'            ' ######## FAILED
'            errMsg = _
'                "The CustSite ID:" & CStr(rst.Fields("CustSiteID")) & " LevelNum - " & errMsg & _
'                vbCrLf & "Locate the LINK and assign it a valid level number!"
'            Exit Function
'        Else
'            fLastLevelNum = rst![LevelNum]
'        End If
'
'        If Success Then
'            PrepareData = True
'        End If
    
    
    
    End If
    
    

PROC_EXIT:
    Set rst = Nothing
    Set rst2 = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = aClassName & " SetUp" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.SOURCE & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function

Public Function incLevel(aLevelNum As Integer) As Integer
    incLevel = 0
    aLevelNum = aLevelNum + 1
    If aLevelNum > fMaxNumOfLevels Then
        aLevelNum = 1
    End If
    incLevel = aLevelNum
End Function

Public Function CalcNextInspection(ByRef CalcLevelNum As Integer, ByRef ErrState As Integer, Optional DoPostErr As Boolean = True) As Date

    Dim msg As String
    Dim v As Variant
    Dim WarnA As Boolean
    Dim WarnB As Boolean
    Dim success As Boolean

    On Error GoTo PROC_ERR

    CalcNextInspection = Empty
    CalcLevelNum = 0
    
    ErrState = 4
    WarnA = True
    WarnB = True

    
    ' ###############################################################
    ' ENTRY POINT FOR NEW CUSTOMER
    ' ###############################################################
    If ((fIsNewCustomer = True)) Then
        ' -----------------------------------------------
        ' NEW CUSTOMER - RE-SEED ...
        ' -----------------------------------------------
        
        If Nz(fSeedDate, 0) > 0 Then    'Not null or empty
            If IsDate(fSeedDate) Then   ' is a valid date
                If CDbl(fSeedDate) > 0 Then ' has both date and time
                    WarnA = False   ' post log message
                    If Nz(fSeedLevel, 0) > 0 Then
                        If fSeedLevel <= fMaxNumOfLevels Then
                            WarnB = False 'post log message
                            ' SUCCESS
                            CalcLevelNum = fSeedLevel
                            CalcNextInspection = CDate(fSeedDate)
                            ErrState = 0    ' flags SUCCESS
                        End If
                    End If
                End If
            End If
        End If
        
        
        If (ErrState > 0) And DoPostErr Then
            ' send an error message to log?
            mdlLog.AppendLog aCode & " - Bad SEED DATA.", _
                             "The seed data in the customer site LINK ID: " & CStr(fCustSiteID) & " " & _
                             "was either NULL or invalid. The site will be skipped!" & _
                             vbCrLf & "(A valid date and level number is needed to 'seed' the inspection order.)", _
                             CallerID, 4, aCompanyInfoID
        End If
        
        If (WarnA = True) And DoPostErr Then
            ' send an WARNING message to log?
            mdlLog.AppendLog aCode & " - Bad SEED DateTime.", _
                             "Bad DateTime in the customer site LINK ID: " & CStr(fCustSiteID) & "." & _
                             vbCrLf & " The site will be skipped!", _
                             CallerID, 2, aCompanyInfoID
        End If
        
        If (WarnB = True) And DoPostErr Then
            ' send an WARNING message to log?
            mdlLog.AppendLog aCode & " - Bad SEED Level Number.", _
                             "The seed level in the customer site LINK ID: " & CStr(fCustSiteID) & " was invalid." & _
                             vbCrLf & "The site will be skipped!", _
                             CallerID, 2, aCompanyInfoID
        End If
    
    ' ###############################################################
    ' ENTRY POINT FOR RETURN CUSTOMER
    ' ###############################################################
    Else
        ' UPDATES can only be performed if the previous inspection order is completed or cancelled.
        If (fLastInProgress = True) Then
            ' customer has it's last inspection orders still in IN PROGRESS
            ' shouldn't call here .... abort
            If DoPostErr Then
                ' send an WARNING message to log?
                mdlLog.AppendLog aCode & " - IN PROGRESS.", _
                                 "Customer site LINK ID: " & CStr(fCustSiteID) & "." & CStr(ServiceInterval) & _
                                 vbCrLf & "The LAST inspection order isn't COMPLETED or CANCELLED." & _
                                 vbCrLf & "The order cannot be updated until all work is done!", _
                                 CallerID, 2, aCompanyInfoID
            End If
            Exit Function
        End If
        
        ' USER REQUESTED A RESEED
        ' --------------------------------------------------------------
        If (fDoReseed = True) Then
            ' -----------------------------------------------
            ' CUSTOMER with a least one previous inspection order
            ' -----------------------------------------------
            ' ADD INTERVAL ..... TO LAST INSPECTION ORDER
            success = CalcNextRequestedDT(fSeedDate, fCalcNextRequestedDT, DoPostErr)
            If success Then
                ' INC LEVEL ..... TO LAST INSPECTION ORDER
                success = CalcNextLevelNum(fSeedLevel, fCalcNextLevelNum, DoPostErr)
                If success Then
                    CalcNextInspection = fCalcNextRequestedDT
                    CalcLevelNum = fCalcNextLevelNum
                    ErrState = 0
                End If
            End If
            
        ' use the LAST Inspection Order data to calculate the next data
        ' --------------------------------------------------------------
        Else
            success = CalcNextRequestedDT(fLastRequestedDT, fCalcNextRequestedDT, DoPostErr)
            If success Then
                ' INC LEVEL ..... TO LAST INSPECTION ORDER
                success = CalcNextLevelNum(fLastLevelNum, fCalcNextLevelNum, DoPostErr)
                If success Then
                    CalcNextInspection = fCalcNextRequestedDT
                    CalcLevelNum = fCalcNextLevelNum
                    ErrState = 0
                End If
            End If
        End If
        
    End If

PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = aClassName & " CalcNextInspection" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.SOURCE & vbCrLf & err.Description
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function


' ADD INTERVAL ..... TO LAST INSPECTION ORDER - SeedDate HAS BEEN VALIDATED PRIOR TO CALLING HERE?
Private Function CalcNextRequestedDT(ByVal SeedDate As Variant, ByRef CalcDT As Date, Optional DoPostErr As Boolean = True) As Boolean
Dim success As Boolean
    CalcNextRequestedDT = False
    CalcDT = Empty
    If Nz(SeedDate, 0) > 0 Then
        If IsDate(SeedDate) Then
            CalcDT = DateAdd("m", fServiceInterval, CDate(SeedDate))
            success = True
        End If
    End If
    
    If (success = False) And DoPostErr Then
        ' send an error message to log?
        mdlLog.AppendLog aCode & " - Bad or invalid RequestedDT.", _
                         "The NEXT requested date time couldn't be calculated." & _
                         vbCrLf & "The site will be skipped!", _
                         CallerID, 4, aCompanyInfoID
    End If
    If success Then
        CalcNextRequestedDT = True
    End If
    
End Function

' INC LEVEL ..... TO LAST INSPECTION ORDER  - SeedLevel HAS BEEN VALIDATED PRIOR TO CALLING HERE?
Private Function CalcNextLevelNum(ByVal SeedLevel As Variant, ByRef CalcLevelNum As Integer, Optional DoPostErr As Boolean = True) As Boolean
Dim success As Boolean
    CalcNextLevelNum = False
    CalcLevelNum = 0
    If Nz(SeedLevel, 0) > 0 Then
        CalcLevelNum = incLevel(CInt(SeedLevel))
        If CalcLevelNum > 0 Then
            success = True
        End If
    End If
    
    If (success = False) And DoPostErr Then
        ' send an WARNING message to log?
        mdlLog.AppendLog aCode & " - Bad Level Number.", _
                         "The NEXT Level Number couldn't be calculated." & _
                         vbCrLf & "The site will be skipped!", _
                         CallerID, 2, aCompanyInfoID
    End If
    If success Then
        CalcNextLevelNum = True
    End If
    
End Function




' ##########################################################################################################################
' HELPER - Get the last COMPLETED (or CANCELLED) inspection order
' ##########################################################################################################################

Private Function FindLastFinalizedInspectOrderID(CustSiteID As Long, ByRef RequestedBy As Date, ByRef LevelNum As Long, ByVal dblServiceInterval As Double) As Long
    Dim SQL As String
    Dim rst As DAO.Recordset

    FindLastFinalizedInspectOrderID = 0
    RequestedBy = Empty

    ' pulls the most recent inspection order for the customer site
    SQL = _
           "SELECT Top 1 InspectionOrderID, RequestedDT, LevelNum  FROM dbo_InspectionOrder " & _
           "WHERE (dbo_InspectionOrder.CustSiteID = " & CStr(CustSiteID) & " ) AND (dbo_InspectionOrder.RequestedDT IS NOT NULL) " & _
           "AND (dbo_InspectionOrder.InspectionStatusID = 2 OR dbo_InspectionOrder.InspectionStatusID = 3) " & _
           " AND dbo_InspectionOrder.ServiceInterval = " & CStr(dblServiceInterval) & _
           " ORDER BY dbo_InspectionOrder.RequestedDT DESC;"

    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        RequestedBy = CDate(rst.Fields("RequestedDT"))
        FindLastFinalizedInspectOrderID = rst.Fields("InspectionOrderID")
    End If

End Function


' ##########################################################################################################################
' HELPER - Get the last inspection order
' ##########################################################################################################################

Private Function FindLastInspectOrderID(CustSiteID As Long, ByRef RequestedBy As Date, ByRef LevelNum As Long, ByRef InspectionOrderStatusID As Long, ByVal dblServiceInterval As Double) As Long
    Dim SQL As String
    Dim rst As DAO.Recordset

    FindLastInspectOrderID = 0
    RequestedBy = Empty

    ' pulls the most recent inspection order for the customer site
    SQL = _
           "SELECT Top 1 InspectionOrderID, RequestedDT, LevelNum, InspectionStatusID as long,  FROM dbo_InspectionOrder " & _
           "WHERE (dbo_InspectionOrder.CustSiteID = " & CStr(CustSiteID) & " ) AND dbo_InspectionOrder.RequestedDT IS NOT NULL " & _
           " AND dbo_InspectionOrder.ServiceInterval = " & CStr(dblServiceInterval) & _
           " ORDER BY dbo_InspectionOrder.RequestedDT DESC;"

    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        RequestedBy = CDate(rst.Fields("RequestedDT"))
        FindLastInspectOrderID = rst.Fields("InspectionOrderID")
    End If

End Function

Public Function SeedDatePreDateLastInspection() As Boolean
'Dim v As Variant
'    'If date1 refers to a later point in time than date2, the DateDiff function returns a negative number.
'    v = DateDiff("m", fLastRequestedDT, fSeedDate)
'    If v < 0 Then
'        SeedDatePreDateLastInspection = True
'    End If

    SeedDatePreDateLastInspection = False
    
    If fLastRequestedDT > fSeedDate Then
        SeedDatePreDateLastInspection = True
    End If
    
    
End Function
