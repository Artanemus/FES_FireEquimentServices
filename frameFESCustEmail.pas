unit frameFESCustEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.VirtualImage, Vcl.ExtCtrls, Vcl.WinXPanels,
  dmCustomerData, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Vcl.ControlList, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Grid, Data.DB;

type
  TFESCustEmail = class(TFrame)
    bindListCustEmail: TBindingsList;
    bindsrcCustEmail: TBindSourceDB;
    btnEditEmail: TControlListButton;
    btnPinEmail: TControlListButton;
    ctrllistCustEmail: TControlList;
    imgcollCustEmail: TImageCollection;
    lblEmailCreatedDT: TLabel;
    lblEmail: TLabel;
    lblEmailType: TLabel;
    LinkGridToDataSourcebindsrcCustEmail: TLinkGridToDataSource;
    LinkPropertyToField1: TLinkPropertyToField;
    LinkPropertyToField2: TLinkPropertyToField;
    LinkPropertyToField3: TLinkPropertyToField;
    N1: TMenuItem;
    puCopy: TMenuItem;
    puDelete: TMenuItem;
    puEdit: TMenuItem;
    puFilter: TMenuItem;
    puInsert: TMenuItem;
    pumenuCustEmail: TPopupMenu;
    puPin: TMenuItem;
    puRefresh: TMenuItem;
    StackPanel1: TStackPanel;
    vimgHideUnPinned: TVirtualImage;
    vimglistCustEmail: TVirtualImageList;
    procedure btnPinEmailClick(Sender: TObject);
    procedure ctrllistCustEmailBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
        ARect: TRect; AState: TOwnerDrawState);
    procedure vimgHideUnPinnedClick(Sender: TObject);
  private
    { Private declarations }
    fHideUnPinned: Boolean;
  end;

implementation

{$R *.dfm}

procedure TFESCustEmail.btnPinEmailClick(Sender: TObject);
var
  b: boolean;
begin
  with bindsrcCustEmail.DataSet do
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

procedure TFESCustEmail.ctrllistCustEmailBeforeDrawItem(AIndex: Integer;
    ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
var
  b: boolean;
begin
  with bindsrcCustEmail.DataSet do
  begin
    b := FieldByName('IsArchived').AsBoolean;
    if b then btnPinEmail.ImageIndex := 1
    else btnPinEmail.ImageIndex := 0;
  end;
end;

procedure TFESCustEmail.vimgHideUnPinnedClick(Sender: TObject);
begin
  fHideUnPinned := not fHideUnPinned;
  with bindsrcCustEmail.DataSet do
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
