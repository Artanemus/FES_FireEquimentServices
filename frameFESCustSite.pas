unit frameFESCustSite;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmCustomerData,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.VirtualImage, Vcl.ExtCtrls,
  Vcl.WinXPanels, Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Grid, Vcl.StdCtrls, Vcl.ControlList, Vcl.WinXCtrls;

type
  TFESCustSite = class(TFrame)
    bindlistCustSite: TBindingsList;
    bindsrcCustSite: TBindSourceDB;
    imgcollCustSite: TImageCollection;
    vimglistCustSite: TVirtualImageList;
    pumenuCustSite: TPopupMenu;
    puEdit: TMenuItem;
    puInsert: TMenuItem;
    puDelete: TMenuItem;
    N1: TMenuItem;
    puPin: TMenuItem;
    puFilter: TMenuItem;
    puRefresh: TMenuItem;
    StackPanel1: TStackPanel;
    vimgHideUnPinned: TVirtualImage;
    RelativePanel1: TRelativePanel;
    ctrllistCustSite: TControlList;
    lblAddress: TLabel;
    LinkGridToDataSource1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    ctrllistbtnPin: TControlListButton;
    ctrllistbtnEdit: TControlListButton;
    lblSiteContact: TLabel;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
