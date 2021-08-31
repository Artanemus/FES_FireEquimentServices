Attribute VB_Name = "mdlCheck"
Option Compare Database
Option Explicit

Private Const ModuleName As String = "mdlCheck"

Private ArrayOfServiceIntervals() As Double

Public Function CheckCustSiteSeeds(ByRef errMsg As String) As Boolean
    Dim msg As String
    Dim Failed As Boolean
    Dim str As String
    Dim str2 As String
    Dim rst As DAO.Recordset
    Dim SQL As String
    
    Dim dateDT As Date
    Dim dateMINDT As Date
    
    
    
    On Error GoTo PROC_ERR
    CheckCustSiteSeeds = False ' FAILED
    Failed = False
    errMsg = vbNullString
            
    str = "Locate the customer's site (LINK) and check the SeedDate and SeedLevel."
    str2 = "CHECK-CustSite Seed Values"
    
    ' ******************************************************************
    ' check for SeedDate in Site ACROSS valid 'ENABLED' CustSites
    ' seed dates are only required for custsites that have DoReeseed = true
    ' ******************************************************************
    SQL = _
        "SELECT dbo_CustSite.CustSiteID, dbo_CustSite.SeedDate, dbo_CustSite.SeedLevel " & _
        "FROM dbo_CustSite " & _
        "WHERE ((dbo_CustSite.IsEnabled) = True) AND ((dbo_CustSite.DoReseed) = True) " & _
        "ORDER BY dbo_CustSite.CustSiteID;"

    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        Do While Not rst.EOF
            ' ######## test for valid SeedDate
            If IsNull(rst.Fields("SeedDate")) Then
                ' UNKNOWN state
                errMsg = _
                    "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's SeedDate is UNKNOWN." & _
                    vbCrLf & "(Required to Re-Seed.)."
                Failed = True
                Exit Do
            End If
            
            If (CDbl(rst.Fields("SeedDate")) < 1) Then
                ' Illegal SeedDate in CustSite
                errMsg = _
                    "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's SeedDate value is ILLEGAL." & _
                    vbCrLf & "(Required to Re-Seed.)."
                Failed = True
                Exit Do
            End If
            
            If Not IsDate(rst.Fields("SeedDate")) Then
                ' Illegal SeedDate in CustSite
                errMsg = _
                    "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's SeedDate value ISN'T a DATE." & _
                    vbCrLf & "(Required to Re-Seed.)."
                Failed = True
                Exit Do
            End If
            
            ' TEST FOR OUT OF BOUNDS
            dateDT = CDate(rst.Fields("SeedDate"))
            dateMINDT = DateSerial(2020, 1, 1)
            
            If dateDT < dateMINDT Then
                errMsg = _
                    "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's SeedDate is out of range." & _
                    vbCrLf & "It must be greater than 1/1/2020. (Required to Re-Seed.)."
                Failed = True
                Exit Do
            End If
        
            If DatePart("h", CDate(rst.Fields("SeedDate"))) = 0 Then
                errMsg = _
                    "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's SeedDate doesn't include a time." & _
                    vbCrLf & "(Required to Re-Seed.)."
                Failed = True
                Exit Do
            End If
        
            
            ' ######## test for valid SeedLevel
            If IsNull(rst.Fields("SeedLevel")) Then
                ' UNKNOWN state
                errMsg = "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's start SeedLevel is UNKNOWN."
                Failed = True
                Exit Do
            End If
            
            If CInt(rst.Fields("SeedLevel")) < 1 Then
                ' Illegal seeddate in CustSite
                errMsg = "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's start SeedLevel value is ILLEGAL."
                Failed = True
                Exit Do
            End If
            If CInt(rst.Fields("SeedLevel")) > mdlCompany.GetGlobalDefNumOfLevels Then
                ' Illegal seeddate in CustSite
                errMsg = "(" & CStr(rst.Fields("CustSiteID")) & ") The LINK's start SeedLevel is greater than the MAX NUMBER OF LEVELS."
                Failed = True
                Exit Do
            End If
            rst.MoveNext
        Loop
    End If
    If Failed Then
        mdlLog.AppendLog str2, errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        DoEvents
    Else
        ' ############################################
        ' PASSED
        ' ############################################
        CheckCustSiteSeeds = True ' PASSED
    End If
        
    
PROC_EXIT:
    rst.Close
    Set rst = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " CheckCustSiteSeeds" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        mdlLog.AppendLog "PROC_ERR", msg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function

Public Function CheckEquipType(ByRef errMsg As String) As Boolean
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim msg As String
    Dim Failed As Boolean
    Dim str As String
    Dim v As Variant
    
    On Error GoTo PROC_ERR
    CheckEquipType = False ' FAILED
    Failed = False
    errMsg = vbNullString
    
    str = "Goto SWITCHBOARD-SYSTEM-GLOBALS-EQUIPMENT_CONFIGURATION and enter a valid value."
    
    ' ############ CHECK THE EQUIPMENTTYPE
    SQL = _
        "SELECT dbo_EquipType.EquipTypeID, dbo_EquipType.Caption, dbo_EquipType.MinorLifeCycle, " & _
        "dbo_EquipType.MajorLifeCycle, dbo_EquipType.NumOfLevels, dbo_EquipType.ServiceInterval, dbo_EquipType.CoreGroupID " & _
        "FROM dbo_EquipType;"
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        Do While Not rst.EOF
            If IsNull(rst.Fields("MinorLifeCycle")) Or IsEmpty(rst.Fields("MinorLifeCycle")) Then
                ' UNKNOWN state
                errMsg = _
                       "The MinorLifeCycle in dbo_EquipmentType " & CStr(rst.Fields("Caption")) & _
                       " is UNKNOWN OR EMPTY." & vbCrLf & str
                Failed = True
                Exit Do
            End If
            If IsNull(rst.Fields("MajorLifeCycle")) Or IsEmpty(rst.Fields("MajorLifeCycle")) Then
                ' UNKNOWN state
                errMsg = _
                       "The MajorLifeCycle in dbo_EquipmentType " & CStr(rst.Fields("Caption")) & _
                       " is UNKNOWN OR EMPTY." & vbCrLf & str
                Failed = True
                Exit Do
            End If
            If IsNull(rst.Fields("NumOfLevels")) Or IsEmpty(rst.Fields("NumOfLevels")) Then
                ' UNKNOWN state
                errMsg = _
                       "The NumOfLevels in dbo_EquipmentType " & CStr(rst.Fields("Caption")) & _
                       " is UNKNOWN OR EMPTY." & vbCrLf & str
                Failed = True
                Exit Do
            End If
            If IsNull(rst.Fields("ServiceInterval")) Or IsEmpty(rst.Fields("ServiceInterval")) Then
                ' UNKNOWN state
                errMsg = _
                       "The ServiceInterval in dbo_EquipmentType " & CStr(rst.Fields("Caption")) & _
                       " is UNKNOWN OR EMPTY." & vbCrLf & str
                Failed = True
                Exit Do
            Else
                If rst.Fields("ServiceInterval") < 1 Or rst.Fields("ServiceInterval") > 12 Then
                    ' OUT OF BOUNDS
                    errMsg = _
                           "The ServiceInterval in dbo_EquipmentType " & CStr(rst.Fields("Caption")) & _
                           " is OUT OF BOUNDS." & vbCrLf & str
                    Failed = True
                    Exit Do
                End If
            End If
            If IsNull(rst.Fields("CoreGroupID")) Or IsEmpty(rst.Fields("CoreGroupID")) Then
                ' UNKNOWN state
                errMsg = _
                       "The CORE GROUP ID in dbo_EquipmentType " & CStr(rst.Fields("Caption")) & _
                       " is UNKNOWN OR EMPTY." & vbCrLf & str
                Failed = True
                Exit Do
            End If
            rst.MoveNext
        Loop
    Else
        ' NOTHING THERE !!!
        errMsg = _
               "The table dbo_EquipmentType is EMPTY!" & _
               vbCrLf & "Goto SWITCHBOARD-SYSTEM-GLOBALS-EQUIPMENT_CONFIGURATION and assign equipment types and their parameters."
        mdlLog.AppendLog "CHECK-Equipment Type", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        Failed = True
    End If
    
    rst.Close
    Set rst = Nothing
    
    ' CHECK that ALL Equipment has a valid EquipTypeID
    SQL = _
        "SELECT EquipmentID FROM dbo_Equipment WHERE EquipTypeID IS NULL"
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        errMsg = _
               "The Equipment " & CStr(rst.Fields("EquipmentID")) & " in dbo_Equipment has UNDEFINED equipment type." & _
               vbCrLf & "Locate the equipment and assign a valid EquipTypeID."
        Failed = True
    End If
    
    
    If Not Failed Then
        CheckEquipType = True
    End If
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " CheckEquipType" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        mdlLog.AppendLog "PROC_ERR", msg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT
    
End Function

Public Function CheckInspectOrdersSI(ByRef errMsg As String) As Boolean
    Dim msg As String
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim Failed As Boolean
    Dim iter As Integer
    Dim Success As Boolean
    
    On Error GoTo PROC_ERR
    
    CheckInspectOrdersSI = False ' FAILED
    Failed = False
    errMsg = vbNullString
    
    ' #### TEST inspection order service interval and levelnum
    ' GENERAL CHECK - includes all inspections orders that have been created.
    SQL = _
        "SELECT dbo_InspectionOrder.InspectionOrderID, dbo_InspectionOrder.ServiceInterval, dbo_InspectionOrder.LevelNum FROM dbo_InspectionOrder "
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    ' OK to have no inspection orders to check
    If rst.RecordCount > 0 Then
        Do While Not rst.EOF
            ' INVALID LevelNum
            If IsNull(rst.Fields("LevelNum")) Or CInt(rst.Fields("LevelNum")) = 0 Or rst.Fields("LevelNum") > mdlCompany.GetGlobalDefNumOfLevels Then
                errMsg = _
                       "The inspection order " & CStr(rst.Fields("InspectionOrderID")) & " LevelNum is ERRONOUS." & _
                       vbCrLf & "Locate the inspection order and assign a valid level number."
                Failed = True
                Exit Do
            End If
            ' INVALID ServiceInterval
            If IsNull(rst.Fields("ServiceInterval")) Or CLng(rst.Fields("ServiceInterval")) = 0 Then
                errMsg = _
                       "The inspection order " & CStr(rst.Fields("InspectionOrderID")) & " service interval is ERRONOUS." & _
                       vbCrLf & "Locate the inspection order and assign a valid service interval."
                Failed = True
                Exit Do
            End If
            rst.MoveNext
        Loop
    End If
    rst.Close
    
    If Failed Then
        mdlLog.AppendLog "CHECK-Inspection Orders", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
    Else
        CheckInspectOrdersSI = True
    End If
    
PROC_EXIT:
    Set rst = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " CheckInspectOrdersSI" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        mdlLog.AppendLog "PROC_ERR", msg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function


Public Function CheckSystemGlobals(ByRef errMsg As String) As Boolean
    Dim msg As String
    Dim rst As DAO.Recordset
    Dim SQL As String
    Dim Failed As Boolean
    Dim str As String
    Dim str2 As String
    Dim v As Variant
    
    On Error GoTo PROC_ERR
    CheckSystemGlobals = False ' FAILED
    Failed = False
    errMsg = vbNullString
            
    ' ############ CHECK THE GLOBALS
    str = "Goto SWITCHBOARD-SYSTEM-GLOBALS and enter a valid value."
    str2 = "CHECK-System Globals"
    v = mdlCompany.GetGlobalDefNumOfLevels()
    If IsNull(v) Then
        errMsg = "The GLOBAL value 'default number of levels' is invalid."
        errMsg = errMsg & vbCrLf & str
        mdlLog.AppendLog str2, errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        Exit Function
    End If
    v = mdlCompany.GetGlobalDefStartLevel()
    If IsNull(v) Then
        errMsg = "The GLOBAL value 'default start level' is invalid."
        errMsg = errMsg & vbCrLf & str
        mdlLog.AppendLog str2, errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        Exit Function
    End If
    
    ' ############################################
    ' PASSED
    ' ############################################
    CheckSystemGlobals = True ' PASSED
        
    
PROC_EXIT:
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " CheckSystemGlobals" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        mdlLog.AppendLog "PROC_ERR", msg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function

Private Function ListDuplicates(ByVal CustSiteID As Long, ByVal index As Integer, ByVal ServiceInterval As Double) As String
    Dim msg As String
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim v As Variant
    Dim str As String
    On Error GoTo PROC_ERR
    
    ListDuplicates = vbNullString
    str = vbNullString
    
    Select Case index
    Case 1
        SQL = _
            "SELECT dbo_InspectionOrder.InspectionOrderID FROM dbo_InspectionOrder " & _
            "WHERE dbo_InspectionOrder.CustSiteID = " & CStr(CustSiteID) & _
            " AND (((dbo_InspectionOrder.InspectionStatusID)=2 Or (dbo_InspectionOrder.InspectionStatusID)=3) AND ((dbo_CustSite.IsEnabled)=1))" & _
            " AND dbo_InspectionOrder.ServiceInterval = " & CStr(ServiceInterval)
    Case 2
        SQL = _
            "SELECT dbo_InspectionOrder.InspectionOrderID FROM dbo_InspectionOrder " & _
            "WHERE dbo_InspectionOrder.CustSiteID = " & CStr(CustSiteID) & _
            " AND (((dbo_InspectionOrder.InspectionStatusID)=1 Or (dbo_InspectionOrder.InspectionStatusID)>3) AND ((dbo_CustSite.IsEnabled)=1))" & _
            " AND dbo_InspectionOrder.ServiceInterval = " & CStr(ServiceInterval)
    Case 3
        SQL = _
            "SELECT dbo_InspectionOrder.InspectionOrderID FROM dbo_InspectionOrder " & _
            "WHERE dbo_InspectionOrder.CustSiteID = " & CStr(CustSiteID) & _
            " AND (((dbo_InspectionOrder.InspectionStatusID)=1 Or (dbo_InspectionOrder.InspectionStatusID)>3) AND ((dbo_CustSite.IsEnabled)=0))" & _
            " AND dbo_InspectionOrder.ServiceInterval = " & CStr(ServiceInterval)
    End Select
    
        
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        Do While rst.EOF
            str = str & ", " & CStr(rst.Fields("InspectionOrderID"))
            rst.MoveNext
        Loop
        ' remove the redundant first 2 characters
        ' This string function can return NULL. NULL can only be assigned to a variant.
        v = Mid(str, 3)
    End If
    If Not IsNull(v) Then
        ListDuplicates = CStr(v)
    End If
    
PROC_EXIT:
    rst.Close
    Set rst = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " Begin_Assert" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        mdlLog.AppendLog "PROC_ERR", msg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function

' #######################     CHECK FOR MULTI ORDERS
Public Function CheckMultiInProgress(ByRef errMsg As String) As Boolean

    Dim msg As String
    Dim SQL As String
    Dim rst As DAO.Recordset
    Dim Failed As Boolean
    Dim iter As Integer
    Dim Success As Boolean
    On Error GoTo PROC_ERR

    CheckMultiInProgress = False ' FAILED
    Failed = False
    errMsg = vbNullString

    ' BUILD the service interval array ...
    Success = BuildArrayOfServiceIntervals(ArrayOfServiceIntervals(), errMsg, LULogCallerID(ModuleName))
    If Not Success Then
        mdlLog.AppendLog "CHECK-ServiceIntervals", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        Exit Function
    End If
    
    ' only enabled custsites
    SQL = _
        "SELECT dbo_CustSite.CustSiteID " & _
        "FROM dbo_CustSite WHERE (dbo_CustSite.IsEnabled = True) "
    Set rst = CurrentDb.OpenRecordset(SQL, dbOpenDynaset, dbFailOnError + dbSeeChanges)
    If rst.RecordCount > 0 Then
        Do While Not rst.EOF
            ' iterate over service interval
            For iter = LBound(ArrayOfServiceIntervals()) To UBound(ArrayOfServiceIntervals())
                Failed = mdlToolBox.HasMultiInProgress(rst.Fields("CustSiteID"), ArrayOfServiceIntervals(iter), errMsg)
                If Failed Then Exit For  ' Multi-Inspect FOUND
            Next iter
            If Failed Then Exit Do ' Multi-Inspect FOUND
            rst.MoveNext
        Loop
        rst.Close
    End If

    If Failed Then
        mdlLog.AppendLog "CHECK-Multi-In Progress", errMsg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
    Else
        CheckMultiInProgress = True ' PASSED
    End If

PROC_EXIT:
    Set rst = Nothing
    On Error Resume Next
    Exit Function

PROC_ERR:
    ' display the system error
    If err.Number <> 0 Then
        msg = ModuleName & " CheckMultiInProgress" & vbCrLf & _
              "Error # " & CStr(err.Number) & " was generated by " & err.Source & vbCrLf & err.Description
        mdlLog.AppendLog "PROC_ERR", msg, LULogCallerID(ModuleName), 5, LUCompanyInfoID()
        MsgBox msg, , "Error", err.HelpFile, err.HelpContext
    End If
    Resume PROC_EXIT

End Function


