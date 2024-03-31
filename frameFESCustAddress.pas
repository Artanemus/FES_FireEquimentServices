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
  Vcl.WinXCtrls;

type
  TFESCustAddress = class(TFrame)
    imgcollCustAddress: TImageCollection;
    ctrllistCustAddress: TControlList;
    ctrllistbtnEdit: TControlListButton;
    ctrllistbtnPin: TControlListButton;
    vimglistCustAddress: TVirtualImageList;
    pumenuCustAddress: TPopupMenu;
    puInsert: TMenuItem;
    puEdit: TMenuItem;
    puDelete: TMenuItem;
    N1: TMenuItem;
    puRefresh: TMenuItem;
    puPin: TMenuItem;
    puFilter: TMenuItem;
    bindlistCustAddress: TBindingsList;
    bindsrcCustAddress: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    lblAddress: TLabel;
    lblAddressType: TLabel;
    lblZone: TLabel;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
    StackPanel1: TStackPanel;
    vimgHideUnPinned: TVirtualImage;
    RelativePanel1: TRelativePanel;
    procedure ctrllistbtnEditClick(Sender: TObject);
    procedure ctrllistbtnPinClick(Sender: TObject);
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

procedure TFESCustAddress.ctrllistbtnEditClick(Sender: TObject);
begin
  // open dialogue to edit Customer's Business Number
end;

procedure TFESCustAddress.ctrllistbtnPinClick(Sender: TObject);
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
    if b then ctrllistbtnPin.ImageIndex := 1
    else ctrllistbtnPin.ImageIndex := 0;
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
