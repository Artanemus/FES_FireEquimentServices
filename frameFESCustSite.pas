unit frameFESCustSite;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmCustomerData,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.VirtualImage, Vcl.ExtCtrls,
  Vcl.WinXPanels, Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Grid, Vcl.StdCtrls, Vcl.ControlList, Vcl.WinXCtrls,
  dmFES;

type
  TFESCustSite = class(TFrame)
    bindlistCustSite: TBindingsList;
    bindsrcCustSite: TBindSourceDB;
    btnEditSite: TControlListButton;
    btnPinSite: TControlListButton;
    ctrllistCustSite: TControlList;
    lblSiteAddress: TLabel;
    lblSiteContact_ss: TLabel;
    LinkGridToDataSource1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
    StackPanel1: TStackPanel;
    vimgHideUnPinned: TVirtualImage;
    procedure ctrllistCustSiteBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
        ARect: TRect; AState: TOwnerDrawState);
  end;

implementation

{$R *.dfm}

procedure TFESCustSite.ctrllistCustSiteBeforeDrawItem(AIndex: Integer; ACanvas:
    TCanvas; ARect: TRect; AState: TOwnerDrawState);
var
  b: boolean;
begin
  with bindsrcCustSite.DataSet do
  begin
    b := FieldByName('IsArchived').AsBoolean;
    if b then btnPinSite.ImageIndex := 1
    else btnPinSite.ImageIndex := 0;
  end;
end;

end.
