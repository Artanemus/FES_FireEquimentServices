unit dlgFilterStatus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonGroup, dmFES,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, System.Actions, Vcl.ActnList, Vcl.ExtCtrls,
  unitFESDefines;

type
  TFilterStatus = class(TForm)
    btnGroup: TButtonGroup;
    qryStatus: TFDQuery;
    ActionList1: TActionList;
    actnXAction: TAction;
    actnSent: TAction;
    actnAwaiting: TAction;
    actnHold: TAction;
    actnIRNS: TAction;
    actnCompleted: TAction;
    actnCancelled: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure actnGenericExecute(Sender: TObject);
    procedure actnGenericUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    fLayerCode: LongInt;
    procedure ReadPreferences();
    procedure WritePreferences();
    procedure Done();
    function CalcLayerCode(): integer;
  public
    { Public declarations }
    property LayerCode: integer read fLayerCode write fLayerCode;

  const
    INIFILE_SECTION = 'FilterStatus';

  end;

var
  FilterStatus: TFilterStatus;

implementation

{$R *.dfm}

Uses
  IniFiles, unitFESutility;

procedure TFilterStatus.FormDestroy(Sender: TObject);
begin
  // Preference are written on event Done
end;

procedure TFilterStatus.actnGenericExecute(Sender: TObject);
var
fl: LongInt;
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  TAction(Sender).Update;
  fl := CalcLayerCode;
  POSTMESSAGE(TForm(Owner).Handle, FES_FILTERUPDATED, fl, 0);
end;

procedure TFilterStatus.actnGenericUpdate(Sender: TObject);
begin
  if TAction(Sender).Checked and (TAction(Sender).ImageIndex <> 22) then
    TAction(Sender).ImageIndex := 22;
  if not TAction(Sender).Checked and (TAction(Sender).ImageIndex <> 23) then
    TAction(Sender).ImageIndex := 23;
end;

function TFilterStatus.CalcLayerCode: integer;
var
  I, num: integer;
  actn: TContainedAction;
begin
  // build the filter code used by TMS Planner to hide show layers
  result := 0;
  for I := 0 to ActionList1.ActionCount - 1 do
  begin
    actn := ActionList1.Actions[I];
    {
      TAction.Tag holds the inspection status ID (1 to ... SEQUENTIAL)
      Layer selection is done in a binary way.
      Layer numbers are 1,2,4,8,16 … (i.e. all powers of 2).
      If TPlanner.Layer is 0, this means all layers are displayed.
      To display items from 2 layers in the TPlanner, this can be
      done by a logical OR of the layer numbers in the TPlanner.Layer
      property.
    }
    if actn.Checked then
    begin
      // raise InspectionStatus ID  to the power of 2
      // 1 shl (i-1) computes to 2^(i-1)
      //      num := 1 shl (actn.Tag - 1);
//    if (result = 0) then
//      result := actn.Tag
//    else
      result := result or actn.Tag;  // power of 2
    end;
  end;
end;

procedure TFilterStatus.Done;
var
  newLayerCode: integer;
begin
  WritePreferences;
  newLayerCode := CalcLayerCode;
  if newLayerCode <> fLayerCode then
  begin
    fLayerCode := newLayerCode;
    POSTMESSAGE(TForm(Owner).Handle, FES_FILTERUPDATED, fLayerCode, 0);
  end;
  ModalResult := mrOk;
  Hide;
end;

procedure TFilterStatus.FormCreate(Sender: TObject);
var
  btn: TGrpButtonItem;
  actn: TContainedAction;
  I: integer;
begin
  // free the design-time list of actions.
  for I := ActionList1.ActionCount - 1 downto 0 do
    ActionList1.Actions[I].Free;
  // free the button group of buttons
  btnGroup.Items.Clear;

  if Assigned(FES) and (FES.fesConnection.Connected = true) then
  begin
    // ASSERT
    qryStatus.Connection := FES.fesConnection;
    qryStatus.Active := true;
    // SORTED on field StackOrder
    qryStatus.First;
    while not qryStatus.Eof do
    begin
      // build a TAction for each inspection status type
      actn := TAction.Create(Self);
      actn.ActionList := ActionList1;
      actn.OnExecute := actnGenericExecute;
      actn.OnUpdate := actnGenericUpdate;
      actn.ImageIndex := 23;
      actn.AutoCheck := false;
      actn.Checked := false;
      actn.Caption := qryStatus.FieldByName('Caption').AsString;
      actn.Tag := qryStatus.FieldByName('Layer').AsInteger;
      actn.Name := 'actn' + IntToStr(qryStatus.FieldByName('InspectionStatusID')
        .AsInteger);
      // build TButtons for each TAction
      btn := btnGroup.Items.Add();
      btn.Action := actn;
      qryStatus.next;
    end;
  end;

  ReadPreferences;
  fLayerCode := CalcLayerCode;

end;

procedure TFilterStatus.FormDeactivate(Sender: TObject);
begin
  Done();
end;

procedure TFilterStatus.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Done();
end;

procedure TFilterStatus.ReadPreferences;
var
  iFile: TIniFile;
  iniFileName: string;
  I: integer;
  actn: TContainedAction;
begin
  iniFileName := unitFESutility.GetFESPreferenceFileName;
  if not FileExists(iniFileName) then
    exit;
  iFile := TIniFile.Create(iniFileName);
  for I := 0 to ActionList1.ActionCount - 1 do
  begin
    actn := ActionList1.Actions[I];
    actn.Checked := iFile.ReadBool(INIFILE_SECTION, actn.Name, false);
    actn.Update;
  end;
  iFile.Free;
end;

procedure TFilterStatus.WritePreferences;
var
  iFile: TIniFile;
  iniFileName: string;
  I: integer;
  actn: TContainedAction;
begin
  iniFileName := unitFESutility.GetFESPreferenceFileName;
  if not FileExists(iniFileName) then
    exit;
  iFile := TIniFile.Create(iniFileName);
  for I := 0 to ActionList1.ActionCount - 1 do
  begin
    actn := ActionList1.Actions[I];
    iFile.WriteBool(INIFILE_SECTION, actn.Name, actn.Checked);
  end;
  iFile.Free;

end;

end.
