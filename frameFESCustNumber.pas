unit frameFESCustNumber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.VirtualImage, Vcl.ExtCtrls, Vcl.WinXPanels,
  Vcl.StdCtrls, Vcl.ControlList, dmCustomerData, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, System.Rtti,
  System.Bindings.Outputs, Data.Bind.Grid, Vcl.Bind.ControlList,
  Vcl.Bind.Editors, Data.DB, Vcl.WinXCtrls;

type
  TFESCustNumber = class(TFrame)
    bindlistCustNum: TBindingsList;
    bindsrcCustNum: TBindSourceDB;
    btnEditNumber: TControlListButton;
    btnPinNumber: TControlListButton;
    ctrllistCustNum: TControlList;
    imgcollCustNum: TImageCollection;
    lblNumber: TLabel;
    lblNumberCreatedOn: TLabel;
    lblNumberType: TLabel;
    LinkGridToDataSourcebindsrcCustNum: TLinkGridToDataSource;
    LinkPropertyToField1: TLinkPropertyToField;
    LinkPropertyToField2: TLinkPropertyToField;
    LinkPropertyToField3: TLinkPropertyToField;
    N1: TMenuItem;
    puDelete: TMenuItem;
    puEdit: TMenuItem;
    puFilter: TMenuItem;
    puInsert: TMenuItem;
    pumenuCustNum: TPopupMenu;
    puPin: TMenuItem;
    puRefresh: TMenuItem;
    StackPanel1: TStackPanel;
    vimgHideUnPinned: TVirtualImage;
    vimglistCustNum: TVirtualImageList;
    procedure btnPinNumberClick(Sender: TObject);
    procedure ctrllistCustNumBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
        ARect: TRect; AState: TOwnerDrawState);
    procedure vimgHideUnPinnedClick(Sender: TObject);
  private
    { Private declarations }
    fHideUnPinned: Boolean;
  end;

implementation

{$R *.dfm}

procedure TFESCustNumber.btnPinNumberClick(Sender: TObject);
var
  b: boolean;
begin
  with bindsrcCustNum.DataSet do
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

procedure TFESCustNumber.ctrllistCustNumBeforeDrawItem(AIndex: Integer;
    ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
var
  b: boolean;
begin
  with bindsrcCustNum.DataSet do
  begin
    b := FieldByName('IsArchived').AsBoolean;
    if b then btnPinNumber.ImageIndex := 1
    else btnPinNumber.ImageIndex := 0;
  end;
end;

procedure TFESCustNumber.vimgHideUnPinnedClick(Sender: TObject);
begin
  fHideUnPinned := not fHideUnPinned;
  with bindsrcCustNum.DataSet do
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
