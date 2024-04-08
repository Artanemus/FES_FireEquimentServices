unit frameFESCustContact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, dmCustomerData, Vcl.VirtualImage, Vcl.ExtCtrls,
  Vcl.WinXPanels, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.ControlList,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Vcl.ControlList, Vcl.StdCtrls,
  Vcl.WinXCtrls;

type
  TFESCustContact = class(TFrame)
    bindlistCustContact: TBindingsList;
    bindsrcCustContact: TBindSourceDB;
    btnEditContact: TControlListButton;
    btnPinContact: TControlListButton;
    ctrllistCustEmail: TControlList;
    imgcollCustContact: TImageCollection;
    lblContactName: TLabel;
    lblContactType: TLabel;
    lblContactCreatedDT: TLabel;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
    N1: TMenuItem;
    puCopy: TMenuItem;
    puDelete: TMenuItem;
    puEdit: TMenuItem;
    puFilter: TMenuItem;
    puInsert: TMenuItem;
    pumenuCustContact: TPopupMenu;
    puPin: TMenuItem;
    puRefresh: TMenuItem;
    StackPanel1: TStackPanel;
    vimgHideUnPinned: TVirtualImage;
    vimglistCustContact: TVirtualImageList;
    procedure ctrllistCustEmailBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
        ARect: TRect; AState: TOwnerDrawState);
  end;

implementation

{$R *.dfm}

procedure TFESCustContact.ctrllistCustEmailBeforeDrawItem(AIndex: Integer;
    ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
var
  b: boolean;
begin
  with bindsrcCustContact.DataSet do
  begin
    b := FieldByName('IsArchived').AsBoolean;
    if b then btnPinContact.ImageIndex := 1
    else btnPinContact.ImageIndex := 0;
  end;
end;

end.
