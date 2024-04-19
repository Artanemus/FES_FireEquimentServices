unit dlgStatusPalette;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Vcl.VirtualImage, Vcl.ExtCtrls,
  Vcl.WinXPanels, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.ControlList, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Vcl.Bind.ControlList, Data.Bind.Grid, Data.Bind.Components, Data.Bind.DBScope,
  dmFES, System.Types;

type
  TStatusPalette = class(TForm)
    bindlist: TBindingsList;
    bindsrc: TBindSourceDB;
    btnCaptionColor: TControlListButton;
    btnSelectedCaptionColor: TControlListButton;
    btnClose: TButton;
    btnColor: TControlListButton;
    btnSelectedColor: TControlListButton;
    btnTrackColor: TControlListButton;
    btnSelectedTrackColor: TControlListButton;
    clistInspectStatus: TControlList;
    ColorDLG: TColorDialog;
    lblCaption: TLabel;
    LinkGridToDataSource1: TLinkGridToDataSource;
    Panel1: TPanel;
    qryStatusPalette: TFDQuery;
    LinkPropertyToField1: TLinkPropertyToField;
    btnLinkColor: TControlListButton;
    Button1: TButton;
    Panel2: TPanel;
    Button2: TButton;
    lblColor: TLabel;
    lblSelectColor: TLabel;
    lblxCaption: TLabel;
    lblxSelectCaption: TLabel;
    lblTrack: TLabel;
    lblbSelectTrack: TLabel;
    lblLink: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure btnCaptionColorClick(Sender: TObject);
    procedure btnSelectedCaptionColorClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnColorClick(Sender: TObject);
    procedure btnLinkColorClick(Sender: TObject);
    procedure btnSelectedColorClick(Sender: TObject);
    procedure btnSelectedTrackColorClick(Sender: TObject);
    procedure btnTrackColorClick(Sender: TObject);
    procedure clistInspectStatusAfterDrawItem(AIndex: Integer; ACanvas: TCanvas;
        ARect: TRect; AState: TOwnerDrawState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

var
  StatusPalette: TStatusPalette;

implementation

{$R *.dfm}

procedure TStatusPalette.btnCaptionColorClick(Sender: TObject);
begin
  ColorDLG.Color := bindsrc.DataSet.FieldByName('TMSCaptionColor').AsInteger;
  if ColorDLG.Execute(Self.handle) then
    begin
    bindsrc.DataSet.Edit;
    bindsrc.DataSet.FieldByName('TMSCaptionColor').AsInteger := ColorDLG.Color;
    bindsrc.DataSet.Post;
    end;
end;

procedure TStatusPalette.btnSelectedCaptionColorClick(Sender: TObject);
begin
  ColorDLG.Color := bindsrc.DataSet.FieldByName('TMSSelectedCaptionColor').AsInteger;
  if ColorDLG.Execute(Self.handle) then
    begin
    bindsrc.DataSet.Edit;
    bindsrc.DataSet.FieldByName('TMSSelectedCaptionColor').AsInteger := ColorDLG.Color;
    bindsrc.DataSet.Post;
    end;
end;

procedure TStatusPalette.btnCloseClick(Sender: TObject);
begin
    Self.ModalResult := mrOk;
end;

procedure TStatusPalette.btnColorClick(Sender: TObject);
begin
  ColorDLG.Color := bindsrc.DataSet.FieldByName('TMSColor').AsInteger;
  if ColorDLG.Execute(Self.handle) then
    begin
    bindsrc.DataSet.Edit;
    bindsrc.DataSet.FieldByName('TMSColor').AsInteger := ColorDLG.Color;
    bindsrc.DataSet.Post;
    end;
end;

procedure TStatusPalette.btnLinkColorClick(Sender: TObject);
begin
  ColorDLG.Color := bindsrc.DataSet.FieldByName('TMSLinkColor').AsInteger;
  if ColorDLG.Execute(Self.handle) then
    begin
    bindsrc.DataSet.Edit;
    bindsrc.DataSet.FieldByName('TMSLinkColor').AsInteger := ColorDLG.Color;
    bindsrc.DataSet.Post;
    end;
end;

procedure TStatusPalette.btnSelectedColorClick(Sender: TObject);
begin
  ColorDLG.Color := bindsrc.DataSet.FieldByName('TMSSelectedColor').AsInteger;
  if ColorDLG.Execute(Self.handle) then
    begin
    bindsrc.DataSet.Edit;
    bindsrc.DataSet.FieldByName('TMSSelectedColor').AsInteger := ColorDLG.Color;
    bindsrc.DataSet.Post;
    end;
end;

procedure TStatusPalette.btnSelectedTrackColorClick(Sender: TObject);
begin
  ColorDLG.Color := bindsrc.DataSet.FieldByName('TMSSelectedTrackColor').AsInteger;
  if ColorDLG.Execute(Self.handle) then
    begin
    bindsrc.DataSet.Edit;
    bindsrc.DataSet.FieldByName('TMSSelectedTrackColor').AsInteger := ColorDLG.Color;
    bindsrc.DataSet.Post;
    end;
end;

procedure TStatusPalette.btnTrackColorClick(Sender: TObject);
begin
  ColorDLG.Color := bindsrc.DataSet.FieldByName('TMSTrackColor').AsInteger;
  if ColorDLG.Execute(Self.handle) then
    begin
    bindsrc.DataSet.Edit;
    bindsrc.DataSet.FieldByName('TMSTrackColor').AsInteger := ColorDLG.Color;
    bindsrc.DataSet.Post;
    end;
end;

procedure TStatusPalette.clistInspectStatusAfterDrawItem(AIndex: Integer;
    ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
begin
  ACanvas.Brush.Color := bindsrc.DataSet.FieldByName('TMSColor').AsInteger;
  ACanvas.FillRect(btnColor.BoundsRect);
  ACanvas.Brush.Color := bindsrc.DataSet.FieldByName('TMSSelectedColor').AsInteger;
  ACanvas.FillRect(btnSelectedColor.BoundsRect);
  ACanvas.Brush.Color := bindsrc.DataSet.FieldByName('TMSCaptionColor').AsInteger;
  ACanvas.FillRect(btnCaptionColor.BoundsRect);
  ACanvas.Brush.Color := bindsrc.DataSet.FieldByName('TMSSelectedCaptionColor').AsInteger;
  ACanvas.FillRect(btnSelectedCaptionColor.BoundsRect);
  ACanvas.Brush.Color := bindsrc.DataSet.FieldByName('TMSTrackColor').AsInteger;
  ACanvas.FillRect(btnTrackColor.BoundsRect);
  ACanvas.Brush.Color := bindsrc.DataSet.FieldByName('TMSSelectedTrackColor').AsInteger;
  ACanvas.FillRect(btnSelectedTrackColor.BoundsRect);
  ACanvas.Brush.Color := bindsrc.DataSet.FieldByName('TMSLinkColor').AsInteger;
  ACanvas.FillRect(btnLinkColor.BoundsRect);
end;

procedure TStatusPalette.FormKeyUp(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.ModalResult := mrOk;
end;

end.
