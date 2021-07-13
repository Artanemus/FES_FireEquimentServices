Attribute VB_Name = "mdlSplashScreen"
Option Compare Database
Option Explicit



'Purpose:   Version info, for use on splash/"About this program" screen.
'Author:    Allen Browne,   http://allenbrowne.com
'           Adapted from code by Dev Ashish at http://www.mvps.org/access
'IP:        You may freely use this code in your application.
'Date:      August 2006.
'Versions:  Access 97 - 2007.
'Example:   See form "frmHelpAbout".

'Main functions:
'   GetAccessVersion()  = major and minor versions of msaccess.exe (shows service packs).
'   GetFileFormat()     = indicates if the file format is 97, 2000, 2002/3, or 2007 (accdb).
'   GetJetVersion()     = full version of JET/ACE (i.e. msjet35.dll, msjet40.dll, or ace.dll).
'   GetNetworkUserName()= user name reported by o.s.
'   GetMachineName()    = computer name reported by o.s.
'   GetDataPath()       = file name from Connect property of an attached table.

'*******************************************************************
'API declarations.
'*******************************************************************
'Structure contains version information about a file.
'   (This information is language and code page independent.)
Private Type VS_FIXEDFILEINFO
    dwSignature As Long         'Contains the value 0xFEEFO4BD (szKey)
    dwStrucVersion As Long      'Specifies the binary version number of this structure.
    dwFileVersionMS As Long     'most significant 32 bits of the file's binary version number.
    dwFileVersionLS As Long     'least significant 32 bits of the file's binary version number.
    dwProductVersionLS As Long  'most sig. 32 bits of binary version of product this file was distributed with.
    dwFileFlagsMask As Long     'least sig. 32 bits of binary version of product this file was distributed with.
    dwProductVersionMS As Long  'Contains a bitmask that specifies the valid bits in dwFileFlags.
    dwFileFlags As Long         'Contains a bitmask that specifies the Boolean attributes of the file.
    dwFileOS As Long            'operating system for which this file was designed.
    dwFileType As Long          'general type of file.
    dwFileSubtype As Long       'function of the file.
    dwFileDateMS As Long        'most sig. 32 bits of the file's 64-bit binary creation date and time stamp.
    dwFileDateLS As Long        'least sig. 32 bits of the file's 64-bit binary creation date and time stamp.
End Type
 
'Returns size of version info in Bytes
Private Declare PtrSafe Function apiGetFileVersionInfoSize Lib "version.dll" Alias "GetFileVersionInfoSizeA" _
    (ByVal lptstrFilename As String, lpdwHandle As Long) As Long
 
'Read version info into buffer: Arguments:
' 1. Length of buffer for info. 2.Information from GetFileVersionSize. 3. Filename of version stamped file
Private Declare PtrSafe Function apiGetFileVersionInfo Lib "version.dll" Alias "GetFileVersionInfoA" _
    (ByVal lptstrFilename As String, ByVal dwHandle As Long, ByVal dwLen As Long, lpData As Any) As Long
 
'Returns selected version information from the specified version-information resource.
Private Declare PtrSafe Function apiVerQueryValue Lib "version.dll" Alias "VerQueryValueA" _
    (pBlock As Any, ByVal lpSubBlock As String, lplpBuffer As Long, puLen As Long) As Long
 
Private Declare PtrSafe Sub sapiCopyMem Lib "kernel32" Alias "RtlMoveMemory" _
    (Destination As Any, Source As Any, ByVal Length As Long)

Private Const MAX_PATH As Integer = 255
Private Declare PtrSafe Function apiGetSystemDirectory& Lib "kernel32" Alias "GetSystemDirectoryA" _
    (ByVal lpBuffer As String, ByVal nSize As Long)

Private Declare PtrSafe Function apiGetWindowsDirectory& Lib "kernel32" Alias "GetWindowsDirectoryA" _
    (ByVal lpBuffer As String, ByVal nSize As Long)

Private Declare PtrSafe Function apiGetTempDir Lib "kernel32" Alias "GetTempPathA" (ByVal nBufferLength As Long, _
    ByVal lpBuffer As String) As Long

Private Declare PtrSafe Function apiGetUserName Lib "advapi32.dll" Alias _
    "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
    
Private Declare PtrSafe Function apiGetComputerName Lib "kernel32" Alias _
    "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
        
Private Const conMod = "ajbVersion"

'*******************************************************************
'End user functions
'*******************************************************************
Public Function InitSplash()
On Error GoTo Err_Handler
    'Purpose:   Show the splash form, close after 2 seconds, and show the next form.
    'Usage:     Use an AutoExec macro to RunCode, with InitSplash() as the function name.
    Static sbRunning As Boolean             'Indicates if this code is already running (because of DoEvents.)
    Dim dtEndTime As Date                   'Time to show the next form.
    Const strcSplashForm = "frmHelpAbout"   'Name of the splash form.
    Const strcNextForm = "Switchboard"      'Name of the next screen.
    Const lngcSeconds = 2&                  'Number of seconds to display splash screen.
    
    'Jump out if this code is already executing.
    If sbRunning Then
        Exit Function
    End If
    sbRunning = True
    
    'Show the splash screen, and force the calculated controls, and screen updates.
    DoCmd.OpenForm strcSplashForm
    With Forms(strcSplashForm)
        .SetFocus
        .Recalc
        .Repaint
    End With
    
    'Loop until the time is up, yielding the processor for other tasks.
    dtEndTime = DateAdd("s", lngcSeconds, Now())
    Do While Now() < dtEndTime
        DoEvents
    Loop
    Call ForceClosed(strcSplashForm)
    
    If strcNextForm <> vbNullString Then
        DoCmd.OpenForm strcNextForm
    End If
    
    'Reset the static flag.
    sbRunning = False

Exit_Handler:
    Exit Function

Err_Handler:
    Call LogError(Err.Number, Err.Description, conMod & ".InitSplash")
    Resume Exit_Handler
End Function

Public Function GetAccessVersion(Optional db As DAO.Database) As String
On Error Resume Next
    'Purpose:   Return full version information for the msaccess.exe file.
    'Argument:  The database to examine. Current database if nothing passed in.
    'Return:    Full version number as string, e.g. "11.0.6566.0".
    '           Zero-length string on error.
    'Requires:  Access 95 and later. (Change the constant for Access 1/2.)
    'Note:      We don't use SysCmd(acSysCmdAccessVer), since we want the minor version too.
    GetAccessVersion = fGetProductVersion(SysCmd(acSysCmdAccessDir) & "msaccess.exe")
End Function

Public Function GetFileFormat(Optional db As DAO.Database) As String
On Error GoTo Err_Handler
    'Purpose:   Return the file format of the database.
    'Argument:  The database to examine. Current database if nothing passed in.
    'Return:    Sales version number and file type, e.g.:
    '               "97 MDE", "2000 MDB", "2002/3 ADP", "2007 ACCDB".
    '           Zero-length string on error.
    'Requires:  Access 97 through 2007.
    Dim bResetDb As Boolean
    Dim bIsCompiledOnly As Boolean
    Dim bIsProject As Boolean
    Dim strReturn As String
    
    'If no database variable was passed in, use the current database and flag to clear it.
    If db Is Nothing Then
        bResetDb = True
        Set db = DBEngine(0)(0)
    End If
    
    'Examine the Data Format version. The final character will be determined later.
    '   (We don't use CurrentProject.FileFormat - it's not in Access 2000.)
    Select Case Int(Val(db.Version))
    'Access 97 file format is 3.0
    Case 3
        strReturn = "97 MD"
    
    'Access 2000 or 2002/3 file format is 4.0
    Case 4
        'Examine the Project Storage version to distinguish 2000 from 2002/3.
        Select Case db.Properties("AccessVersion")
        Case "08.50"        '2000 format.
            strReturn = "2000"
        Case "09.50"        '2002/3 fomat.
            strReturn = "2002/3"
        End Select
        
        'Test the ProjectType to see if it's an MDB or ADP.
        '   Eval() lets this compile in Access 97.
        If strReturn <> vbNullString Then
            bIsProject = Eval("(CurrentProject.ProjectType = 1)")
            If bIsProject Then
                strReturn = strReturn & " AD"
            Else
                strReturn = strReturn & " MD"
            End If
        End If
    
    'Access 2007 (accdb) file format is 12.0
    Case 12
        strReturn = "2007 ACCD"
    End Select
    
    'Now determine if the final character is B (as in MDB), or E (as in MDE.)
    bIsCompiledOnly = (db.Properties("MDE") = "T")
    If bIsCompiledOnly Then
        strReturn = strReturn & "E"
    Else
        strReturn = strReturn & "B"
    End If
    
    'Return value.
    If strReturn <> vbNullString Then
        GetFileFormat = strReturn
    End If

Exit_Handler:
    'Dereference the database variable unless it was passed in.
    On Error Resume Next
    If bResetDb Then
        Set db = Nothing
    End If
    Exit Function

Err_Handler:
    Select Case Err.Number
    Case 2482&, 3270&      'Object wasn't found (the Eval()). Property doesn't exist.
        Resume Next
    Case Else
        Call LogError(Err.Number, Err.Description, conMod & ".GetFileFormat")
        Resume Exit_Handler
    End Select
End Function

Public Function GetJetVersion(Optional db As DAO.Database) As String
On Error GoTo Err_Handler
    'Purpose:   Return the full JET or ACE version number.
    'Argument:  The database to examine. Current database if nothing passed in.
    'Return:    Full version number string, e.g. "4.0.8618.0"
    'Requires:  Access 97 through 2007.
    Dim bResetDb As Boolean
    Dim strJetFile As String
    
    If db Is Nothing Then
        bResetDb = True
        Set db = DBEngine(0)(0)
    End If

    Select Case Int(Val(db.Version))
    Case 3      'Access 97 file format is 3.0
        strJetFile = fReturnSysDir() & "\msjet35.dll"
    Case 4      'Access 2000 and 2002/3 file format are 4.0
        strJetFile = fReturnSysDir() & "\msjet40.dll"
    Case 12     'Access 2007 (accdb) file format is 12.0
        strJetFile = Environ("CommonProgramFiles")
        If strJetFile = vbNullString Then
            strJetFile = TrailingSlash(Environ("ProgramFiles")) & "Common Files"
        End If
        strJetFile = TrailingSlash(strJetFile) & "Microsoft Shared\Office12\acecore.dll"
    End Select
    
    If bResetDb Then
        Set db = Nothing
    End If
    
    If strJetFile <> vbNullString Then
        GetJetVersion = fGetProductVersion(strJetFile)
    End If

Exit_Handler:
    Exit Function

Err_Handler:
    Call LogError(Err.Number, Err.Description, conMod & ".GetJetVersion")
    Resume Exit_Handler
End Function

Public Function GetDataPath(strTable As String) As String
On Error GoTo Err_Handler
    'Purpose:   Return the full path of the file from the Connect property of this tabledef.
    'Return:    Full path and file name for attached MDB.
    '           Just the path for some other types (e.g. attached text.)
    '           Zero-length string for local table (not attached), or of argument is zero-length.
    '           "#Error" on error, e.g. table not found.
    'Requires:  Split() function for Access 97 or earlier.
    Dim varArray As Variant
    Dim i As Integer
    
    If Trim$(strTable) <> vbNullString Then
        varArray = Split(CurrentDb.TableDefs(strTable).Connect, ";")
        For i = LBound(varArray) To UBound(varArray)
            If varArray(i) Like "DATABASE=*" Then
                GetDataPath = Trim$(Mid$(varArray(i), 10))
                Exit For
            End If
        Next
    End If
Exit_Handler:
    Exit Function

Err_Handler:
    Call LogError(Err.Number, Err.Description, conMod & ".GetDataPath", strTable, False)
    GetDataPath = "#Error"
    Resume Exit_Handler
End Function

Public Function GetNetworkUserName() As String
On Error GoTo Err_Handler
    'Purpose:   Returns the network login name
    'Return:    The name, or "{Unknown}" on error.
    'Note:      Safer than testing Environ().
    Dim lngLen As Long
    Dim lngX As Long
    Dim strUserName As String
    
    strUserName = String$(254, 0&)
    lngLen = 255&
    lngX = apiGetUserName(strUserName, lngLen)
    If (lngX > 0&) Then
        strUserName = Left$(strUserName, lngLen - 1&)
    End If
    
    If strUserName <> vbNullString Then
        GetNetworkUserName = strUserName
    Else
        GetNetworkUserName = "{unknown}"
    End If

Exit_Handler:
    Exit Function

Err_Handler:
    Call LogError(Err.Number, Err.Description, conMod & ".fOSUserName")
    Resume Exit_Handler
End Function

Public Function GetMachineName() As String
On Error GoTo Err_Handler
    'Purpose:   Returns the computername on the network.
    'Return:    workstation name, or "{Unknown}" on error.
    Dim lngLen As Long
    Dim lngX As Long
    Dim strCompName As String
    
    lngLen = 16&
    strCompName = String$(lngLen, 0&)
    lngX = apiGetComputerName(strCompName, lngLen)
    If lngX <> 0& Then
        GetMachineName = Left$(strCompName, lngLen)
    Else
        GetMachineName = "{unknown}"
    End If

Exit_Handler:
    Exit Function

Err_Handler:
    Call LogError(Err.Number, Err.Description, conMod & ".GetMachineName")
    Resume Exit_Handler
End Function

Public Function ForceClosed(strDoc As String, Optional bIsReport As Boolean) As Boolean
On Error Resume Next
    'Purpose:   Close the form or report.
    'Return:    True if the form/report was open and now is not (i.e. no error occurred.)
    'Arguments: strDoc = name of the form or report to close.
    '           bIsReport: False (the default) = the document to close is a form.
    '                      True = the document to close is a report.
    'Warnings:  1. If form is dirty and record cannot be saved, it will be lost.
    '           2. Any design changes to the form/report are also lost.
    'Note:      No error is raised if the form/report was not open, or did not close.
    DoCmd.Close IIf(bIsReport, acReport, acForm), strDoc, acSaveNo
    ForceClosed = (Err.Number = 0&)
End Function

'*******************************************************************
'Private functions
'*******************************************************************
Private Function fGetProductVersion(strExeFullPath As String) As String
On Error GoTo ErrHandler
    'Purpose:   return the full build number for an executable.
    'Return:    Version number as string, e.g. "9.0.0.2719"
    '           Zero-length string on error.
    'Argument:  The executable to examine.
    'Usage:     fGetProductVersion(SysCmd(acSysCmdAccessDir) & "msaccess.exe")
    Dim lngSize As Long
    Dim lngRet As Long
    Dim pBlock() As Byte
    Dim lpfi As VS_FIXEDFILEINFO
    Dim lppBlock As Long
 
    'GetFileVersionInfo requires us to get the size of the file version information first,
    '   this info is in the format  of VS_FIXEDFILEINFO struct
    lngSize = apiGetFileVersionInfoSize(strExeFullPath, lngRet)
 
    'Proceed If the OS can obtain version info.
    If lngSize Then
        'The info in pBlock is always in Unicode format
        ReDim pBlock(lngSize)
        lngRet = apiGetFileVersionInfo(strExeFullPath, 0, lngSize, pBlock(0))
        If Not lngRet = 0 Then
            'The same pointer to pBlock can be passed to VerQueryValue
            lngRet = apiVerQueryValue(pBlock(0), "\", lppBlock, lngSize)
 
            'Fill the VS_FIXEDFILEINFO struct with bytes from pBlock
            'VerQueryValue fills lngSize with the length of the block.
            Call sapiCopyMem(lpfi, ByVal lppBlock, lngSize)
            'Build the version info strings
            With lpfi
                fGetProductVersion = HIWord(.dwFileVersionMS) & "." & LOWord(.dwFileVersionMS) & "." & _
                    HIWord(.dwFileVersionLS) & "." & LOWord(.dwFileVersionLS)
            End With
        End If
    End If
 
ExitHere:
    Erase pBlock
    Exit Function
    
ErrHandler:
    Resume ExitHere
End Function
 
Private Function LOWord(dw As Long) As Integer
    'Retrieves the low-order word from the given 32-bit value.
    If dw And &H8000& Then
        LOWord = dw Or &HFFFF0000
    Else
        LOWord = dw And &HFFFF&
    End If
End Function
 
Private Function HIWord(dw As Long) As Integer
    'Retrieves the high-order word from the given 32-bit value.
  HIWord = (dw And &HFFFF0000) \ &H10000
End Function

Private Function fReturnTempDir() As String
    'Returns Temp Folder Name
    Dim strTempDir As String
    Dim lngX As Long
    
    strTempDir = String$(MAX_PATH, 0)
    lngX = apiGetTempDir(MAX_PATH, strTempDir)
    If lngX <> 0& Then
        fReturnTempDir = Left$(strTempDir, lngX)
    End If
End Function

Private Function fReturnSysDir() As String
    'Returns System Folder Name (C:\WinNT\System32)
    Dim strSysDirName As String
    Dim lngX As Long
    
    strSysDirName = String$(MAX_PATH, 0)
    lngX = apiGetSystemDirectory(strSysDirName, MAX_PATH)
    If lngX <> 0& Then
        fReturnSysDir = Left$(strSysDirName, lngX)
    End If
End Function

Private Function fReturnWinDir() As String
    'Returns OS Folder, e.g. "C:\Windows"
    Dim strWinDirName As String
    Dim lngX As Long
    
    strWinDirName = String$(MAX_PATH, 0)
    lngX = apiGetWindowsDirectory(strWinDirName, MAX_PATH)
    If lngX <> 0& Then
        fReturnWinDir = Left$(strWinDirName, lngX)
    End If
End Function

'------------------------------------------------------------------------------------------------
'You may prefer to replace this with a true error logger. See http://allenbrowne.com/ser-23a.html
Private Function LogError(ByVal lngErrNumber As Long, ByVal strErrDescription As String, _
    strCallingProc As String, Optional vParameters, Optional bShowUser As Boolean = True) As Boolean
On Error GoTo Err_LogError
    'Purpose:   Generic error handler.
    'Arguments: lngErrNumber - value of Err.Number
    '           strErrDescription - value of Err.Description
    '           strCallingProc - name of sub|function that generated the error.
    '           vParameters - optional string: List of parameters to record.
    '           bShowUser - optional boolean: If False, suppresses display.
    'Author: Allen Browne

    Dim strMsg As String        'String for display in MsgBox

    Select Case lngErrNumber
    Case 0&
        Debug.Print strCallingProc & " called error 0."
    Case 2501&                  'Cancelled
        'Do nothing.
    Case 3314&, 2101&, 2115&    'Can't save.
        If bShowUser Then
            strMsg = "Record cannot be saved at this time." & vbCrLf & _
                "Complete the entry, or press <Esc> to undo."
            MsgBox strMsg, vbExclamation, strCallingProc
        End If
    Case Else
        If bShowUser Then
            strMsg = "Error " & lngErrNumber & ": " & strErrDescription
            MsgBox strMsg, vbExclamation, strCallingProc
        End If
        LogError = True
    End Select

Exit_LogError:
    Exit Function

Err_LogError:
    strMsg = "An unexpected situation arose in your program." & vbCrLf & _
        "Please write down the following details:" & vbCrLf & vbCrLf & _
        "Calling Proc: " & strCallingProc & vbCrLf & _
        "Error Number " & lngErrNumber & vbCrLf & strErrDescription & vbCrLf & vbCrLf & _
        "Unable to record because Error " & Err.Number & vbCrLf & Err.Description
    MsgBox strMsg, vbCritical, "LogError()"
    Resume Exit_LogError
End Function

Function TrailingSlash(varIn As Variant) As String
    If Len(varIn) > 0 Then
        If Right(varIn, 1) = "\" Then
            TrailingSlash = varIn
        Else
            TrailingSlash = varIn & "\"
        End If
    End If
End Function
'-----------------------------------------------------------------------------
'Split() is needed for Access 97 only. Leave commented out for later versions.
'-----------------------------------------------------------------------------
'Private Function Split(strIn As String, strDelim As String) As Variant
'    'Purpose:   Return a variant array from the items in the string, delimited the 2nd argument.
'    Dim varArray As Variant     'Variant array for output.
'    Dim lngStart As Long        'Position in string where argument starts.
'    Dim lngEnd As Long          'Position in string where argument ends.
'    Dim lngLenDelim As Long     'Length of the delimiter string.
'    Dim i As Integer            'index to the array.
'
'    lngLenDelim = Len(strDelim)
'    If (lngLenDelim = 0&) Or (Len(strIn) = 0&) Then
'        ReDim varArray(0)       'Initialize a zero-item array.
'    Else
'        ReDim varArray(9)       'Initialize a 10 item array.
'        i = -1                  'First item will be zero when we add 1.
'        lngStart = 1            'Start searching at first character of string.
'
'        'Search for the delimiter in the input string, until not found any more.
'        Do
'            i = i + 1
'            If i > UBound(varArray) Then    'Add more items if necessary
'                ReDim Preserve varArray(UBound(varArray) + 10)
'            End If
'
'            lngEnd = InStr(lngStart, strIn, strDelim)
'            If lngEnd = 0 Then  'This is the last item.
'                varArray(i) = Trim(Mid(strIn, lngStart))
'                Exit Do
'            Else
'                varArray(i) = Trim(Mid(strIn, lngStart, lngEnd - lngStart))
'                lngStart = lngEnd + lngLenDelim
'            End If
'        Loop
'        'Set the upper bound of the array to the correct number of items.
'        ReDim Preserve varArray(i)
'    End If
'
'    Split = varArray
'End Function
'------------------------------------------------------------------------------------------------

