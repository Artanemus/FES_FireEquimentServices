unit dlgFilterCommon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.StdCtrls, Vcl.ButtonGroup, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, unitFESDefines,
  Vcl.VirtualImage, Vcl.ComCtrls, dmFES, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.Buttons;
  //, SCMUtility, SCMDefines;

type
  PFilterState = ^TFilterState;
  TFilterState = record
    HideArchived: Boolean;
    HideLocked: Boolean;
    HideLinked:Boolean;
    StartDT:TDateTime;
    EndDT:TDateTime;
  end;

  TFilterCommon = class(TForm)
    actnList: TActionList;
    actnHideArchived: TAction;
    btnToday1: TButton;
    btnToday2: TButton;
    actnHideLocked: TAction;
    actnHideLinked: TAction;
    actnDateFrom: TAction;
    actnDateTo: TAction;
    RelativePanel1: TRelativePanel;
    dtpStart: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    spbDateFrom: TSpeedButton;
    spbDateTo: TSpeedButton;
    spbCurrentMonth: TSpeedButton;
    spbHideLocked: TSpeedButton;
    spdHideLinked: TSpeedButton;
    spdHideArchived: TSpeedButton;
    procedure actnCloseExecute(Sender: TObject);
    procedure actnGenericExecute(Sender: TObject);
    procedure actnGenericUpdate(Sender: TObject);
    procedure btnToday1Click(Sender: TObject);
    procedure btnToday2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SendFilterDataPacket();
    procedure spbCurrentMonthClick(Sender: TObject);
  private
    fFilterState: TFilterState;
    procedure ReadPreferences();
    procedure WritePreferences();
  public
    { Public declarations }
    // property HideArchived: boolean read FHideArchived write FHideArchived;
    // property HideInActive: boolean read fHideInActive write fHideInActive;
    // property HideNonSwimmer: boolean read fHideNonSwimmer write fHideNonSwimmer;
  end;

const
  INIFILE_SECTION = 'FilterCustomer';

var
  FilterCommon: TFilterCommon;

implementation

{$R *.dfm}

Uses IniFiles, unitFESutility, system.DateUtils;

procedure TFilterCommon.actnCloseExecute(Sender: TObject);
begin
  WritePreferences;
  ModalResult := mrOK;
end;

procedure TFilterCommon.actnGenericExecute(Sender: TObject);
begin
  with TAction(Sender) do
  begin
    Checked := not Checked;
    UpdateAction(TAction(Sender));
    SendFilterDataPacket;
  end;
end;

procedure TFilterCommon.actnGenericUpdate(Sender: TObject);
begin
  with TAction(Sender) do
  begin
    if Checked and (ImageIndex <> 22) then
      ImageIndex := 22;
    if not Checked and (ImageIndex <> 23) then
      ImageIndex := 23;
  end;
end;

procedure TFilterCommon.btnToday1Click(Sender: TObject);
begin
  dtpStart.Date :=  Date;
end;

procedure TFilterCommon.btnToday2Click(Sender: TObject);
begin
  dtpEnd.Date :=  Date;
end;

procedure TFilterCommon.FormCreate(Sender: TObject);
begin
  actnHideArchived.Checked := false;
  actnHideLocked.Checked := false;
  actnHideLinked.Checked := false;
end;

procedure TFilterCommon.FormDeactivate(Sender: TObject);
begin
  WritePreferences; // record filter state
  PostMessage(TForm(Owner).Handle, FES_FILTERDEACTIVATED, 0, 0);
end;

procedure TFilterCommon.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    WritePreferences;
    ModalResult := mrOk;
  end;
end;

procedure TFilterCommon.FormShow(Sender: TObject);
begin
  ReadPreferences;
  UpdateActions;
end;

{ TMemberFilter }

procedure TFilterCommon.ReadPreferences;
var
  iFile: TIniFile;
  iniFileName: string;
begin
  iniFileName := unitFESUtility.GetFESPreferenceFileName;
  if not FileExists(iniFileName) then exit;
  iFile := TIniFile.Create(iniFileName);
  actnHideArchived.Checked := iFile.ReadBool(INIFILE_SECTION,
    'HideArchived', false);
  actnHideLocked.Checked := iFile.ReadBool(INIFILE_SECTION,
    'HideLocked', false);
  actnHideLinked.Checked := iFile.ReadBool(INIFILE_SECTION,
    'HideLinked', false);
  actnDateFrom.Checked := iFile.ReadBool(INIFILE_SECTION,
    'FilterFrom', false);
  actnDateTo.Checked := iFile.ReadBool(INIFILE_SECTION,
    'FilterTo', false);

  dtpStart.Date := iFile.ReadDate(INIFILE_SECTION,'StartDT', Today);
  dtpEnd.Date := iFile.ReadDate(INIFILE_SECTION,'EndDT', Today);

  iFile.Free;
end;

procedure TFilterCommon.SendFilterDataPacket;
var
  Buffer: TMemoryStream;
  CopyData: TCopyDataStruct;
begin
  // fill record.
  fFilterState.HideArchived := actnHideArchived.Checked;
  fFilterState.HideLocked := actnHideLocked.Checked;
  fFilterState.HideLinked := actnHideLinked.Checked;
  fFilterState.StartDT := dtpStart.DateTime;
  fFilterState.EndDT := dtpStart.DateTime;
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

procedure TFilterCommon.spbCurrentMonthClick(Sender: TObject);
begin
  dtpStart.Date :=  System.DateUtils.StartOfTheMonth(Date);
  dtpEnd.Date := System.DateUtils.EndOfTheMonth(Date);
end;

procedure TFilterCommon.WritePreferences;
var
  iFile: TIniFile;
  iniFileName: string;
begin
  iniFileName := unitFESutility.GetFESPreferenceFileName;
  if not FileExists(iniFileName) then exit;
  iFile := TIniFile.Create(iniFileName);
  iFile.WriteBool(INIFILE_SECTION, 'HideArchived', actnHideArchived.Checked);
  iFile.WriteBool(INIFILE_SECTION, 'HideLocked', actnHideLocked.Checked);
  iFile.WriteBool(INIFILE_SECTION, 'HideLinked', actnHideLinked.Checked);
  iFile.WriteBool(INIFILE_SECTION, 'FilterFrom', actnDateFrom.Checked);
  iFile.WriteBool(INIFILE_SECTION, 'FilterTo', actnDateTo.Checked);
  iFile.WriteDate(INIFILE_SECTION, 'StartDT', dtpStart.Date);
  iFile.WriteDate(INIFILE_SECTION, 'EndDT', dtpEnd.Date);
  iFile.Free;
end;

end.
