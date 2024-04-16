unit frameFESCustAddress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.ControlList, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.VirtualImageList, dmCustomerData, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Vcl.Bind.ControlList, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Grid, Data.Bind.DBScope,
  Vcl.StdCtrls, Data.DB, Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.VirtualImage,
  Vcl.WinXCtrls, dmFES;

type
  TFESCustAddress = class(TFrame)
    bindlistCustAddress: TBindingsList;
    bindsrcCustAddress: TBindSourceDB;
    btnEditAddress: TControlListButton;
    btnPinAddress: TControlListButton;
    ctrllistCustAddress: TControlList;
    lblAddress: TLabel;
    lblAddressType: TLabel;
    lblPostalZone: TLabel;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
    N1: TMenuItem;
    puDelete: TMenuItem;
    puEdit: TMenuItem;
    puFilter: TMenuItem;
    puInsert: TMenuItem;
    pumenuCustAddress: TPopupMenu;
    puPin: TMenuItem;
    puRefresh: TMenuItem;
    StackPanel1: TStackPanel;
    vimgHideUnPinned: TVirtualImage;
    procedure btnEditAddressClick(Sender: TObject);
    procedure btnPinAddressClick(Sender: TObject);
    procedure ctrllistCustAddressBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
        ARect: TRect; AState: TOwnerDrawState);
    procedure vimgHideUnPinnedClick(Sender: TObject);
  private
    { Private declarations }
    fHideUnPinned: Boolean;
  public
    { Public declarations }
    property HideUnPinned: boolean read FHideUnpinned write FHideUnpinned;
  end;

implementation

{$R *.dfm}

procedure TFESCustAddress.btnEditAddressClick(Sender: TObject);
begin
  // open dialogue to edit
end;

procedure TFESCustAddress.btnPinAddressClick(Sender: TObject);
var
  b: boolean;
begin
  with bindsrcCustAddress.DataSet do
  begin
    b := FieldByName('IsArchived').AsBoolean;
    b := not b;
    if (State = dsBrowse) then  Edit;
    if (State = dsEdit) then
    begin
      FieldByName('IsArchived').AsBoolean := b;
      Post;
    end;
  end;
end;

procedure TFESCustAddress.ctrllistCustAddressBeforeDrawItem(AIndex: Integer; ACanvas:
    TCanvas; ARect: TRect; AState: TOwnerDrawState);
var
  b: boolean;
begin
  with bindsrcCustAddress.DataSet do
  begin
    b := FieldByName('IsArchived').AsBoolean;
    if b then btnPinAddress.ImageIndex := 1
    else btnPinAddress.ImageIndex := 0;
  end;
end;

procedure TFESCustAddress.vimgHideUnPinnedClick(Sender: TObject);
begin
  fHideUnPinned := not fHideUnPinned;
  with bindsrcCustAddress.DataSet do
  begin
    if fHideUnPinned then
    begin
      vimgHideUnPinned.ImageIndex := 8;
      Filter := '[IsArchived] IS NULL OR [IsArchived] <> true';
      if not Filtered then Filtered := true;
    end
    else
    begin
      vimgHideUnPinned.ImageIndex := 9;
      if Filtered then Filtered := false;
    end;
  end;
end;

end.
