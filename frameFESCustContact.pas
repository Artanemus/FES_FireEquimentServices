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
    imgcollCustContact: TImageCollection;
    vimglistCustContact: TVirtualImageList;
    pumenuCustContact: TPopupMenu;
    puEdit: TMenuItem;
    puInsert: TMenuItem;
    puDelete: TMenuItem;
    N1: TMenuItem;
    puPin: TMenuItem;
    puCopy: TMenuItem;
    puFilter: TMenuItem;
    puRefresh: TMenuItem;
    StackPanel1: TStackPanel;
    vimgHideUnPinned: TVirtualImage;
    RelativePanel1: TRelativePanel;
    ctrllistCustEmail: TControlList;
    lblContactType: TLabel;
    lblContactName: TLabel;
    bindlistCustContact: TBindingsList;
    ctrllistbtnEdit: TControlListButton;
    ctrllistbtnPin: TControlListButton;
    lblCreatedOn: TLabel;
    bindsrcCustContact: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
