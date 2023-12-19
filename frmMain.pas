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
    TabSheetSurvey: TTabSheet;
    TabSheetSites: TTabSheet;
    TabSheetHR: TTabSheet;
    TabSheet6: TTabSheet;
    Panel1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    RelativePanel2: TRelativePanel;
    Panel2: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    RelativePanel3: TRelativePanel;
    Panel3: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    RelativePanel4: TRelativePanel;
    Panel4: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    RelativePanel5: TRelativePanel;
    Panel5: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    RelativePanel6: TRelativePanel;
    Panel6: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Panel7: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Panel8: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Panel9: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Panel10: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Panel11: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
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
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    ToolsOptions: TAction;
    ToolsSystemLog: TAction;
    ToolsCompanySetup: TAction;
    Bevel2: TBevel;
    Label49: TLabel;
    TabSheet1: TTabSheet;
    Panel12: TPanel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    sbtnFind01: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton37: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton40: TSpeedButton;
    LinkFind: TAction;
    LinkBrowse: TAction;
    LinkGotoID: TAction;
    LinkNew: TAction;
    HelpAbout: TAction;
    HelpWebSite: TAction;
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
