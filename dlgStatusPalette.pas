unit dlgStatusPalette;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmFES, Vcl.VirtualImage, Vcl.ExtCtrls,
  Vcl.WinXPanels, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.ControlList, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Vcl.Bind.ControlList, Data.Bind.Grid, Data.Bind.Components, Data.Bind.DBScope;

type
  TStatusPalette = class(TForm)
    ControlList1: TControlList;
    Panel1: TPanel;
    btnClose: TButton;
    shapeTrackBarColor: TShape;
    shapeNotesColor: TShape;
    shapeCaptionSelectedColor: TShape;
    lblCaption: TLabel;
    qryStatusPalette: TFDQuery;
    ColorDialog1: TColorDialog;
    btnTrackBarColor: TControlListButton;
    btnCaptionSelectedColor: TControlListButton;
    btnNotesColor: TControlListButton;
    shapeTrackBarSelectedColor: TShape;
    btnTrackBarSelectedColor: TControlListButton;
    shapeCaptionColor: TShape;
    btnCaptionColor: TControlListButton;
    procedure btnCaptionColorClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnTrackBarColorClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatusPalette: TStatusPalette;

implementation

{$R *.dfm}

procedure TStatusPalette.btnCaptionColorClick(Sender: TObject);
begin
{
  if ColorDialog1.Execute(Self.handle) then
    begin
    BindSourceDB1.DataSet.Edit;
    BindSourceDB1.DataSet.FieldByName('TMSCaptionColor').AsInteger := ColorDialog1.Color;
    BindSourceDB1.DataSet.Post;
    end;
    }
end;

procedure TStatusPalette.btnCloseClick(Sender: TObject);
begin
    Self.ModalResult := mrOk;
end;

procedure TStatusPalette.btnTrackBarColorClick(Sender: TObject);
begin
  if ColorDialog1.Execute(Self.handle) then
    begin
//    BindSourceDB1.DataSet.Edit;
//    BindSourceDB1.DataSet.FieldByName('TMSTrackColor').AsInteger := ColorDialog1.Color;
//    BindSourceDB1.DataSet.Post;
    end;
end;

procedure TStatusPalette.FormKeyUp(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.ModalResult := mrOk;
end;

end.
