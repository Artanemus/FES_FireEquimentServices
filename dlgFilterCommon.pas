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
    ShowArchived: Boolean;
    HideLocked: Boolean;
    HideLinked:Boolean;
    StartDT:TDateTime;
    EndDT:TDateTime;
  end;

  TFilterCommon = class(TForm)
    actnDateFrom: TAction;
    actnDateTo: TAction;
    actnShowArchived: TAction;
    actnHideLinked: TAction;
    actnHideLocked: TAction;
    actnList: TActionList;
    btnToday1: TButton;
    btnToday2: TButton;
    dtpEnd: TDateTimePicker;
    dtpStart: TDateTimePicker;
    RelativePanel1: TRelativePanel;
    spbCurrentMonth: TSpeedButton;
    spbDateFrom: TSpeedButton;
    spbDateTo: TSpeedButton;
    spbHideLocked: TSpeedButton;
    spdShowArchived: TSpeedButton;
    spdHideLinked: TSpeedButton;
    procedure actnCloseExecute(Sender: TObject);
    procedure actnGenericExecute(Sender: TObject);
    procedure actnGenericUpdate(Sender: TObject);
    procedure btnToday1Click(Sender: TObject);
    procedure btnToday2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SendFilterDataPacket();
    procedure spbCurrentMonthClick(Sender: TObject);
  private
    fFilterState: TFilterState;
    procedure Done();
    procedure ReadPreferences();
    procedure WritePreferences();
    procedure UpdateFilterState();
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
  Done();
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

procedure TFilterCommon.Done;
begin
  WritePreferences;
  UpdateFilterState;
  SendFilterDataPacket;
  ModalResult := mrOk;
  Hide;
end;

procedure TFilterCommon.FormCreate(Sender: TObject);
begin
  actnShowArchived.Checked := false;
  actnHideLocked.Checked := false;
  actnHideLinked.Checked := false;
  ReadPreferences;
end;

procedure TFilterCommon.FormDeactivate(Sender: TObject);
begin
  Done();
end;

procedure TFilterCommon.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Done();
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
  actnShowArchived.Checked := iFile.ReadBool(INIFILE_SECTION,
    'ShowArchived', false);
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

procedure TFilterCommon.UpdateFilterState;
begin
  // fill record.
  fFilterState.ShowArchived := actnShowArchived.Checked;
  fFilterState.HideLocked := actnHideLocked.Checked;
  fFilterState.HideLinked := actnHideLinked.Checked;
  fFilterState.StartDT := dtpStart.DateTime;
  fFilterState.EndDT := dtpStart.DateTime;
end;

procedure TFilterCommon.WritePreferences;
var
  iFile: TIniFile;
  iniFileName: string;
begin
  iniFileName := unitFESutility.GetFESPreferenceFileName;
  if not FileExists(iniFileName) then exit;
  iFile := TIniFile.Create(iniFileName);
  iFile.WriteBool(INIFILE_SECTION, 'ShowArchived', actnShowArchived.Checked);
  iFile.WriteBool(INIFILE_SECTION, 'HideLocked', actnHideLocked.Checked);
  iFile.WriteBool(INIFILE_SECTION, 'HideLinked', actnHideLinked.Checked);
  iFile.WriteBool(INIFILE_SECTION, 'FilterFrom', actnDateFrom.Checked);
  iFile.WriteBool(INIFILE_SECTION, 'FilterTo', actnDateTo.Checked);
  iFile.WriteDate(INIFILE_SECTION, 'StartDT', dtpStart.Date);
  iFile.WriteDate(INIFILE_SECTION, 'EndDT', dtpEnd.Date);
  iFile.Free;
end;

end.
