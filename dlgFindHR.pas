unit dlgFindHR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.VirtualImage, Vcl.TitleBarCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ControlList, dmFES, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TFindHR = class(TForm)
    bindlist: TBindingsList;
    bindsrc: TBindSourceDB;
    btnEdit: TControlListButton;
    btnIsEnabled: TControlListButton;
    cntrlistFindHR: TControlList;
    dsFindHR: TDataSource;
    edtSearch: TEdit;
    Label1: TLabel;
    lblFNAME: TLabel;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    Panel1: TPanel;
    qryFindHR: TFDQuery;
    TitleBarPanel1: TTitleBarPanel;
    vimgFilterCommon: TVirtualImage;
    vimgFilterStatus: TVirtualImage;
    vimgFindCustomer: TVirtualImage;
    vimgSync: TVirtualImage;
    vimgToggleFilters: TVirtualImage;
    VirtualImage1: TVirtualImage;
    procedure cntrlistFindHRBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
        ARect: TRect; AState: TOwnerDrawState);
  end;

var
  FindHR: TFindHR;

implementation

{$R *.dfm}

procedure TFindHR.cntrlistFindHRBeforeDrawItem(AIndex: Integer; ACanvas:
    TCanvas; ARect: TRect; AState: TOwnerDrawState);
begin
  if bindSrc.DataSet.FieldByName('IsArchived').AsBoolean then
    btnIsEnabled.ImageIndex := 22  // Checked.
  else
    btnIsEnabled.ImageIndex := 23; // Un-Checked.
end;

end.
