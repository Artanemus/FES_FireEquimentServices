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
  Data.Bind.Grid, Data.Bind.DBScope;

type
  TFESCustInspect = class(TFrame)
    imgcollCustInspect: TImageCollection;
    vimglistCustInspect: TVirtualImageList;
    pumenuCustInspect: TPopupMenu;
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
    ctrllistCustInspect: TControlList;
    bindlistCustInspect: TBindingsList;
    bindsrcCustInspect: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    lblTech: TLabel;
    lblAddress: TLabel;
    lblStatus: TLabel;
    lblRequested: TLabel;
    lblInspected: TLabel;
    lblCompleted: TLabel;
    ctrllistbtnPin: TControlListButton;
    ctrllistbtnEdit: TControlListButton;
    LinkPropertyToField1: TLinkPropertyToField;
    LinkPropertyToField2: TLinkPropertyToField;
    LinkPropertyToField3: TLinkPropertyToField;
    LinkPropertyToField4: TLinkPropertyToField;
    LinkPropertyToField5: TLinkPropertyToField;
    LinkPropertyToField6: TLinkPropertyToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
