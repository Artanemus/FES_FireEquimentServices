unit pickInspectStatus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.CheckLst, dmFES;

type
  TInspectStatus = class(TForm)
    CheckListBox1: TCheckListBox;
    Panel1: TPanel;
    btnOk: TButton;
    qryInspectionStatus: TFDQuery;
    procedure FormDestroy(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fMyIDs: Array of integer;
  public
    { Public declarations }
  end;

var
  InspectStatus: TInspectStatus;

implementation

{$R *.dfm}

procedure TInspectStatus.FormDestroy(Sender: TObject);
begin
  fMyIDs := nil;
end;

procedure TInspectStatus.btnOkClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to CheckListBox1.Items.Count - 1 do
    if CheckListBox1.Checked[i] then
    begin
      // do something with CheckListBox1.Items[i]
    end;

end;

procedure TInspectStatus.FormCreate(Sender: TObject);
var
i: integer;
begin
  CheckListBox1.MultiSelect := true;
  if FES.fesConnection.Connected then
  begin
    qryInspectionStatus.Open;
    if qryInspectionStatus.Active then
    begin
      CheckListBox1.Items.Clear;
      SetLength(fMyIDs,qryInspectionStatus.RecordCount);
      i := 0;
      while not qryInspectionStatus.Eof do
      begin
        CheckListBox1.Items.Add(qryInspectionStatus.FieldByName('Caption').AsString);
        fMyIDs[i] := qryInspectionStatus.FieldByName('InspectionStatusID').AsInteger;
        i := i + 1;
        qryInspectionStatus.Next;
      end;
    end;
  end;

end;

end.
