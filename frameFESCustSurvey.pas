unit frameFESCustSurvey;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.VirtualImage, Vcl.ExtCtrls, Vcl.WinXPanels,
  Vcl.ControlList, Vcl.StdCtrls, Vcl.WinXCtrls, dmCustomerData,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFESCustSurvey = class(TFrame)
    imgcollCustSurvey: TImageCollection;
    vimglistCustSurvey: TVirtualImageList;
    pumenuCustSurvey: TPopupMenu;
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
    lblEmailType: TLabel;
    lblEmail: TLabel;
    lblCreatedOn: TLabel;
    ctrllistbtnPin: TControlListButton;
    ctrllistbtnEdit: TControlListButton;
    bindlistCustSurvey: TBindingsList;
    bindsrcCustSurvey: TBindSourceDB;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
