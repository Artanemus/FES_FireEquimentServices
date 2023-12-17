unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.ComCtrls,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.VirtualImage, Vcl.WinXCtrls,
  Vcl.Buttons, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.StdActns;

type
  TMain = class(TForm)
    pnlHeader: TPanel;
    lblHeaderTitle: TLabel;
    vimageLogo: TVirtualImage;
    lblCompanyName: TLabel;
    StatusBar1: TStatusBar;
    ImageCollectionMain: TImageCollection;
    PageControlEquipment: TPageControl;
    TabSheetInspections: TTabSheet;
    TabSheetCustomers: TTabSheet;
    vImageListBtns: TVirtualImageList;
    RelativePanel1: TRelativePanel;
    pnlInspectionOrders: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    TabSheetSurvey: TTabSheet;
    TabSheetSites: TTabSheet;
    TabSheetHR: TTabSheet;
    TabSheet6: TTabSheet;
    Panel1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Button6: TButton;
    RelativePanel2: TRelativePanel;
    Panel2: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Button7: TButton;
    RelativePanel3: TRelativePanel;
    Panel3: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Button8: TButton;
    RelativePanel4: TRelativePanel;
    Panel4: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Button9: TButton;
    RelativePanel5: TRelativePanel;
    Panel5: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Button10: TButton;
    RelativePanel6: TRelativePanel;
    Panel6: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Button11: TButton;
    Panel7: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Button12: TButton;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Panel8: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Panel9: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Panel10: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Panel11: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Label44: TLabel;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionManagerSwitchBoard: TActionManager;
    SurveyFind: TAction;
    SurveyBrowse: TAction;
    SurveyGotoID: TAction;
    SurveyNew: TAction;
    InspectSchedule: TAction;
    InspectFindOrder: TAction;
    InspectBrowseOrders: TAction;
    InspectGotoOrderID: TAction;
    InspectUpdateOrders: TAction;
    SiteFind: TAction;
    SiteBrowse: TAction;
    SiteGotoID: TAction;
    SiteNew: TAction;
    CustFind: TAction;
    CustBrowse: TAction;
    CustGotoID: TAction;
    CustGotoCODE: TAction;
    CustNew: TAction;
    HRFind: TAction;
    HRBrowse: TAction;
    HRGotoID: TAction;
    HRNew: TAction;
    EquipFind: TAction;
    EquipBrowse: TAction;
    EquipGotoID: TAction;
    EquipNew: TAction;
    vImageListMenu: TVirtualImageList;
    FileExit1: TFileExit;
    FileConnect: TAction;
    vImageListBug: TVirtualImageList;
    SpeedButton1: TSpeedButton;
    BalloonHint1: TBalloonHint;
    Button33: TButton;
    Label45: TLabel;
    Button34: TButton;
    Label46: TLabel;
    Button35: TButton;
    Label47: TLabel;
    Button36: TButton;
    Label48: TLabel;
    ToolsOptions: TAction;
    ToolsSystemLog: TAction;
    ToolsCompanySetup: TAction;
    Bevel2: TBevel;
    Label49: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.FormCreate(Sender: TObject);
begin
   Application.ShowHint := true;
end;

end.
