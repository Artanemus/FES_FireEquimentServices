unit frameFESCustInspect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.VirtualImage, Vcl.ExtCtrls, Vcl.WinXPanels,
  Vcl.ControlList, Vcl.StdCtrls, Vcl.WinXCtrls, dmCustomerData,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Grid, Data.Bind.DBScope, dmFES;

type
  TFESCustInspect = class(TFrame)
    bindlistCustInspect: TBindingsList;
    btnEditInspect: TControlListButton;
    btnPinInspect: TControlListButton;
    ctrllistCustInspect: TControlList;
    lblInspectAddress: TLabel;
    lblInspectCompletedDT: TLabel;
    lblInspectInspectedDT: TLabel;
    lblInspectRequestedDT: TLabel;
    lblInspectStatus: TLabel;
    lblInspectTech: TLabel;
    LinkPropertyToField2: TLinkPropertyToField;
    LinkPropertyToField3: TLinkPropertyToField;
    LinkPropertyToField5: TLinkPropertyToField;
    LinkPropertyToField6: TLinkPropertyToField;
    StackPanel1: TStackPanel;
    btnTogglePinVisibility: TVirtualImage;
    btnClipboard: TVirtualImage;
    btnNew: TVirtualImage;
    btnDelete: TVirtualImage;
    bindsrcCustInspect: TBindSourceDB;
    LinkGridToDataSource1: TLinkGridToDataSource;
    procedure ctrllistCustInspectBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
        ARect: TRect; AState: TOwnerDrawState);
  end;

implementation

{$R *.dfm}

procedure TFESCustInspect.ctrllistCustInspectBeforeDrawItem(AIndex: Integer;
    ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
var
  b: boolean;
begin
  with bindsrcCustInspect.DataSet do
  begin
    b := FieldByName('IsPinned').AsBoolean;
    if b then btnPinInspect.ImageIndex := 1
    else btnPinInspect.ImageIndex := 0;
  end;
end;

end.
