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
    imgcollCustNum: TImageCollection;
    vimglistCustNum: TVirtualImageList;
    pumenuCustNum: TPopupMenu;
    puEdit: TMenuItem;
    puInsert: TMenuItem;
    puDelete: TMenuItem;
    N1: TMenuItem;
    puPin: TMenuItem;
    puFilter: TMenuItem;
    puRefresh: TMenuItem;
    StackPanel1: TStackPanel;
    vimgHideUnPinned: TVirtualImage;
    ctrllistCustNum: TControlList;
    bindsrcCustNum: TBindSourceDB;
    bindlistCustNum: TBindingsList;
    LinkPropertyToField1: TLinkPropertyToField;
    LinkPropertyToField2: TLinkPropertyToField;
    LinkPropertyToField3: TLinkPropertyToField;
    RelativePanel1: TRelativePanel;
    lblNumberType: TLabel;
    lblNumber: TLabel;
    ctrllistbtnEdit: TControlListButton;
    ctrllistbtnPin: TControlListButton;
    lblCreatedOn: TLabel;
    LinkGridToDataSourcebindsrcCustNum: TLinkGridToDataSource;
    procedure ctrllistbtnPinClick(Sender: TObject);
    procedure ctrllistCustNumBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
        ARect: TRect; AState: TOwnerDrawState);
    procedure vimgHideUnPinnedClick(Sender: TObject);
  private
    { Private declarations }
    fHideUnPinned: Boolean;

  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFESCustNumber.ctrllistbtnPinClick(Sender: TObject);
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
    if b then ctrllistbtnPin.ImageIndex := 1
    else ctrllistbtnPin.ImageIndex := 0;
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
