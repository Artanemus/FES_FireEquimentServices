unit frameFESStation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.VirtualImage, Vcl.ExtCtrls, Vcl.WinXPanels,
  Vcl.ControlList, Vcl.StdCtrls;

type
  TFESStation = class(TFrame)
    imgcollStation: TImageCollection;
    vimglistStation: TVirtualImageList;
    pumenuStation: TPopupMenu;
    puEdit: TMenuItem;
    puInsert: TMenuItem;
    puDelete: TMenuItem;
    N1: TMenuItem;
    puPin: TMenuItem;
    puCopy: TMenuItem;
    puFilter: TMenuItem;
    puRefresh: TMenuItem;
    StackPanel1: TStackPanel;
    btnTogglePinVisibility: TVirtualImage;
    btnClipboard: TVirtualImage;
    btnNew: TVirtualImage;
    btnDelete: TVirtualImage;
    ctrllistCustInspect: TControlList;
    lblNotes: TLabel;
    lblStationNumber: TLabel;
    lblAction: TLabel;
    lblInspectInspectedDT: TLabel;
    btnPin: TControlListButton;
    btnEdit: TControlListButton;
    btnCheck: TControlListButton;
    VirtualImage1: TVirtualImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
