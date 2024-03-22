unit unitFESutility;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
{$IFDEF MSWINDOWS}
  System.Win.Registry,
{$IFEND}
  shlobj;

function CreateFESPrefFileName(AFileName: TFileName): boolean;
function DeleteFESPrefFileName(AFileName: TFileName): boolean;
function GetFESAppDataDir(): string;
function GetFES_SharedIniFile(): string;
function GetFESCommonAppDataDir(): string;
function ExistsFESConnectionDefs(): boolean; deprecated;
function GetFESPreferenceFileName(AName: String): string; overload;
function GetFESPreferenceFileName(): string; overload;
function GetFESTempDir(): string;
function GetFESHelpPrefFileName(): string;
function GetFESDocumentDir(): string;
function GetRegAppPath(appName: string): string;
function GetRegArtanemusAppPath(appName: string): string;
function CheckInternetA: boolean;
function CheckInternetB: boolean;


const
  PrefFileName = 'FESPref.ini';
  HelpPrefFileName = 'FESHelpPref.ini';
  FESSubFolder = 'Artanemus\FES\';
  FESSectionName = 'FES';

implementation

uses
{$IFDEF MSWINDOWS}
  System.IniFiles,
{$IFEND}
  System.Math,
  WinInet, // for interenet
  IdTCPClient; // for checkinternet

function GetFES_SharedIniFile(): string;
begin
  result := GetFESAppDataDir + PrefFileName;
end;

// WINDOWS API FUNCTION
function CheckInternetA: boolean;
var
  origin: Cardinal;
begin
  result := False;
  if InternetGetConnectedState(@origin, 0) then
    result := True;
end;

// POLL GOOGLE
function CheckInternetB: boolean;
var
  TCPClient: TIdTCPClient;
begin
  TCPClient := TIdTCPClient.Create(NIL);
  try
    try
      TCPClient.ReadTimeout := 2000;
      TCPClient.ConnectTimeout := 2000;
      TCPClient.Port := 80;
      TCPClient.Host := 'google.com';
      TCPClient.Connect;
      TCPClient.Disconnect;
      result := True;
    except
      result := False;
    end;
  finally
    TCPClient.Free;
  end;
end;

function CreateFESPrefFileName(AFileName: TFileName): boolean;
var
  filehandle: NativeUInt;
begin
  result := False;
  // create the Help Preference file in 'APPDATA'
  filehandle := FileCreate(AFileName);
  // if NOT 'file already exists'
  if not(filehandle = INVALID_HANDLE_VALUE) then
  begin
    FileClose(filehandle); // close.
    result := True;
  end;
end;

function DeleteFESPrefFileName(AFileName: TFileName): boolean;
begin
  result := False;
  // delete the Help Preference file in 'APPDATA'
  if (FileExists(AFileName)) then
    result := DeleteFile(AFileName);
end;

function GetFESAppDataDir(): string;
var
  str: string;
begin

  result := '';
  str := GetEnvironmentVariable('APPDATA');
  str := IncludeTrailingPathDelimiter(str);
  // Append product-specific path
  str := str + FESSubFolder;
  if not DirectoryExists(str) then
  begin
    { *
      ForceDirectories creates a new directory as specified in Dir, which must be
      a fully-qualified pathname. If the directories given in the path do not yet
      exist, ForceDirectories attempts to create them. ForceDirectories returns
      True if it successfully creates all necessary directories, False if it could
      not create a needed directory.
      Note: Do not call ForceDirectories with an empty string. Doing so causes
      ForceDirectories to raise an exception.
      * }
    if not System.SysUtils.ForceDirectories(str) then
      // FAILED! - Use alternative default document directory...
      exit;
  end;
  result := str;
end;

function GetFESCommonAppDataDir(): string;
var
  str: string;
  szPath: array [0 .. Max_Path] of Char;
begin
  result := '';
  if (SUCCEEDED(SHGetFolderPath(null, CSIDL_COMMON_APPDATA, 0, 0, szPath))) then
  begin
    str := String(szPath);
    str := IncludeTrailingPathDelimiter(str) + FESSubFolder;
    if not DirectoryExists(str) then
    begin
      if not CreateDir(str) then
        exit;
    end;
  end;
  result := str;
end;

// ---------------------------------------------------------------------------
// D E P R E C A T E D .
// ---------------------------------------------------------------------------
function ExistsFESConnectionDefs(): boolean;
  deprecated 'FES static connection definitions are no longer in used.';
var
  str: string;
  szPath: array [0 .. Max_Path] of Char;
  FESConnectionDefsFileName: String;
begin
  result := False;
  FESConnectionDefsFileName := 'FESConnectionDef.ini';
  if (SUCCEEDED(SHGetFolderPath(null, CSIDL_COMMON_APPDATA, 0, 0, szPath))) then
  begin
    str := String(szPath);
    str := IncludeTrailingPathDelimiter(str) + FESSubFolder +
      FESConnectionDefsFileName;;
    if FileExists(str) then
      result := True;
  end;
end;
// ---------------------------------------------------------------------------

function GetFESPreferenceFileName(AName: String): string;
var
  str: string;
  success: boolean;
begin
  result := '';
  str := GetFESAppDataDir;
  if str.IsEmpty then
    exit;
  str := str + AName;
  if not FileExists(str) then
  begin
    success := CreateFESPrefFileName(str);
    if not success then
      exit;
  end;
  result := str;
end;

function GetFESPreferenceFileName(): string;
begin
  result := GetFESPreferenceFileName(PrefFileName);
end;

function GetFESTempDir(): string;
var
  str: string;
begin
  result := '';
  str := GetEnvironmentVariable('TMP');
  str := IncludeTrailingPathDelimiter(str);
  if not DirectoryExists(str) then
  begin
    if not CreateDir(str) then
      exit;
  end;
  result := str;
end;

function GetFESHelpPrefFileName(): string;
begin
  result := GetFESPreferenceFileName(HelpPrefFileName);
end;

function GetFESDocumentDir(): string;
begin
  result := GetEnvironmentVariable('HOMEPATH');
  result := IncludeTrailingPathDelimiter(result);
  result := result + 'FES\';
end;

function GetRegAppPath(appName: string): string;
var
  reg: TRegistry;
  KeyName: string;
begin
  KeyName := '\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\';
  result := '';
  reg := TRegistry.Create(KEY_READ);
  try
    begin
      reg.RootKey := HKEY_LOCAL_MACHINE;
      if reg.KeyExists(KeyName) then
      begin
        reg.OpenKey(KeyName, False);
        result := reg.ReadString('Path');
      end;
    end;
  finally
    reg.Free;
  end;
end;

function GetRegArtanemusAppPath(appName: string): string;
var
  reg: TRegistry;
  KeyName: string;
begin
  KeyName := '\Software\\Artanemus\';
  result := '';
  KeyName := KeyName + appName + '\';
  result := '';
  reg := TRegistry.Create(KEY_READ);
  try
    begin
      reg.RootKey := HKEY_CURRENT_USER;
      reg.OpenKey(KeyName, False);
      result := reg.ReadString('Path');
    end;
  finally
    reg.Free;
  end;
end;


{$IFDEF MSWINDOWS}

function LoadSharedIniFileSetting(ASection, AName: string): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(GetFES_SharedIniFile);
  try
    result := ini.ReadString(ASection, AName, '');
  finally
    ini.Free;
  end;
end;

procedure SaveSharedIniFileSetting(ASection, AName, AValue: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(GetFES_SharedIniFile);
  try
    ini.WriteString(ASection, AName, AValue);
  finally
    ini.Free;
  end;

end;

{$ENDIF}



end.
