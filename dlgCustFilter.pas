unit dlgCustFilter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.StdCtrls, Vcl.ButtonGroup, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, unitFESDefines;
  //, SCMUtility, SCMDefines;

type
  PFilterState = ^TFilterState;
  TFilterState = record
    HideArchived: Boolean;
    HideInactive: Boolean;
    HideNonSwimmer: Boolean;
  end;

  TCustFilter = class(TForm)
    btngrpFilter: TButtonGroup;
    filterImageCollection: TImageCollection;
    filterImageList32x32: TVirtualImageList;
    filterActionManager: TActionManager;
    actnHideArchived: TAction;
    actnHideInActive: TAction;
    actnHideLinked: TAction;
    actnClose: TAction;
    actnClear: TAction;
    actnFilterFrom: TAction;
    actnFilterTo: TAction;
    procedure actnClearExecute(Sender: TObject);
    procedure actnClearUpdate(Sender: TObject);
    procedure actnCloseExecute(Sender: TObject);
    procedure actnHideArchivedExecute(Sender: TObject);
    procedure actnHideArchivedUpdate(Sender: TObject);
    procedure actnHideInActiveExecute(Sender: TObject);
    procedure actnHideInActiveUpdate(Sender: TObject);
    procedure actnHideLinkedExecute(Sender: TObject);
    procedure actnHideLinkedUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SendFilterDataPacket();
  private
    fFilterState: TFilterState;
    procedure ReadPreferences();
    procedure WritePreferences();
    procedure SetIconDisplayState();
  public
    { Public declarations }
    // property HideArchived: boolean read FHideArchived write FHideArchived;
    // property HideInActive: boolean read fHideInActive write fHideInActive;
    // property HideNonSwimmer: boolean read fHideNonSwimmer write fHideNonSwimmer;
  end;

const
  INIFILE_SECTION = 'SCM_Member';

var
  CustFilter: TCustFilter;

implementation

{$R *.dfm}

Uses IniFiles, unitFESutility;

procedure TCustFilter.actnClearExecute(Sender: TObject);
begin
  actnHideArchived.Checked := false;
  actnHideInActive.Checked := false;
  actnHideLinked.Checked := false;
  SetIconDisplayState;
  SendFilterDataPacket;
end;

procedure TCustFilter.actnClearUpdate(Sender: TObject);
begin
  if actnHideArchived.Checked or actnHideInActive.Checked or actnHideLinked.Checked
  then TAction(Sender).ImageName := 'filter_alt'
  else TAction(Sender).ImageName := 'filter_alt_off';
end;

procedure TCustFilter.actnCloseExecute(Sender: TObject);
begin
  WritePreferences;
  ModalResult := mrOK;
end;

procedure TCustFilter.actnHideArchivedExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  SetIconDisplayState;
  SendFilterDataPacket;
end;

procedure TCustFilter.actnHideArchivedUpdate(Sender: TObject);
begin
  if TAction(Sender).Checked then TAction(Sender).ImageName := 'Checked'
  else TAction(Sender).ImageName := 'UnChecked';
end;

procedure TCustFilter.actnHideInActiveExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  SetIconDisplayState;
  SendFilterDataPacket;
end;

procedure TCustFilter.actnHideInActiveUpdate(Sender: TObject);
begin
  if TAction(Sender).Checked then TAction(Sender).ImageName := 'Checked'
  else TAction(Sender).ImageName := 'UnChecked';
end;

procedure TCustFilter.actnHideLinkedExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  SetIconDisplayState;
  SendFilterDataPacket;
end;

procedure TCustFilter.actnHideLinkedUpdate(Sender: TObject);
begin
  if TAction(Sender).Checked then TAction(Sender).ImageName := 'Checked'
  else TAction(Sender).ImageName := 'UnChecked';
end;

procedure TCustFilter.FormCreate(Sender: TObject);
begin
  actnHideArchived.Checked := false;
  actnHideInActive.Checked := false;
  actnHideLinked.Checked := false;
end;

procedure TCustFilter.FormDeactivate(Sender: TObject);
begin
  WritePreferences; // record filter state
  PostMessage(TForm(Owner).Handle, FES_FILTERDEACTIVATED, 0, 0);
end;

procedure TCustFilter.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    WritePreferences;
    ModalResult := mrOk;
  end;
end;

procedure TCustFilter.FormShow(Sender: TObject);
begin
  ReadPreferences;
  SetIconDisplayState;
end;

{ TMemberFilter }

procedure TCustFilter.ReadPreferences;
var
  iFile: TIniFile;
  iniFileName: string;
begin
  iniFileName := unitFESUtility.GetFESPreferenceFileName;
  if not FileExists(iniFileName) then exit;
  iFile := TIniFile.Create(iniFileName);
  actnHideArchived.Checked := iFile.ReadBool(INIFILE_SECTION,
    'HideArchived', false);
  actnHideInActive.Checked := iFile.ReadBool(INIFILE_SECTION,
    'HideInActive', false);
  actnHideLinked.Checked := iFile.ReadBool(INIFILE_SECTION,
    'HideNonSwimmer', false);
  iFile.Free;
end;

procedure TCustFilter.SendFilterDataPacket;
var
  Buffer: TMemoryStream;
  CopyData: TCopyDataStruct;
begin
  // fill record
  fFilterState.HideArchived := actnHideArchived.Checked;
  fFilterState.HideInActive := actnHideInActive.Checked;
  fFilterState.HideNonSwimmer := actnHideLinked.Checked;
  Buffer := TMemoryStream.Create;
  try
    // fill memory stream
    Buffer.WriteBuffer(fFilterState, SizeOf(TFilterState));
    CopyData.dwData := 0;
    CopyData.cbData := Buffer.Size;
    CopyData.lpData := Buffer.Memory;
    // run filter on form
    SendMessage(TForm(Owner).Handle, FES_FILTERUPDATED, 0, LParam(@CopyData));
  finally
    Buffer.free;
  end;
end;

procedure TCustFilter.SetIconDisplayState;
begin
  // The TAction's state must change else OnActionUpdate isn't called.
  // Programmatically assigning TAction.Checked with a value does not
  // produce a change in it's state.
  // Here we sync the icon states manaually.
  if actnHideArchived.Checked then actnHideArchived.ImageName := 'Checked'
  else actnHideArchived.ImageName := 'UnChecked';
  if actnHideInActive.Checked then actnHideInActive.ImageName := 'Checked'
  else actnHideInActive.ImageName := 'UnChecked';
  if actnHideLinked.Checked then actnHideLinked.ImageName := 'Checked'
  else actnHideLinked.ImageName := 'UnChecked';
  if actnHideArchived.Checked or actnHideInActive.Checked or actnHideLinked.Checked
  then actnClear.ImageName := 'filter_alt'
  else actnClear.ImageName := 'filter_alt_off';
end;

procedure TCustFilter.WritePreferences;
var
  iFile: TIniFile;
  iniFileName: string;
begin
  iniFileName := unitFESUtility.GetFESPreferenceFileName;
  if not FileExists(iniFileName) then exit;
  iFile := TIniFile.Create(iniFileName);
  iFile.WriteBool(INIFILE_SECTION, 'HideArchived', actnHideArchived.Checked);
  iFile.WriteBool(INIFILE_SECTION, 'HideInActive', actnHideInActive.Checked);
  iFile.WriteBool(INIFILE_SECTION, 'HideLinked',
    actnHideLinked.Checked);
  iFile.Free;
end;

end.
