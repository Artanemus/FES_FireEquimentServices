unit frameFESTechHours;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.VirtualImage, Vcl.ExtCtrls, Vcl.WinXPanels,
  Vcl.ControlList, Vcl.StdCtrls;

type
  TFESTechHours = class(TFrame)
    imgcolTech: TImageCollection;
    vimglistTech: TVirtualImageList;
    pumenuTech: TPopupMenu;
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
    VirtualImage1: TVirtualImage;
    ctrllistCustInspect: TControlList;
    lblNotes: TLabel;
    lblStationNumber: TLabel;
    lblInspectInspectedDT: TLabel;
    btnEdit: TControlListButton;
    btnCheck: TControlListButton;
    pnlTOT: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
