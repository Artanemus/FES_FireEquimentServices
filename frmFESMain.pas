unit frmFESMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  System.UITypes, System.Actions, System.ImageList,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ImgList, Vcl.VirtualImageList, Vcl.ComCtrls, Vcl.Graphics,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.VirtualImage, Vcl.WinXCtrls,
  Vcl.Buttons, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.StdActns,
  // SCM datamodules
  dmFES,
  dmCustomerData, frameFESPlanner,
  frmCustomer
  ;

type
  TFESMain = class(TForm)
    pnlHeader: TPanel;
    vimageLogo: TVirtualImage;
    lblCompanyName: TLabel;
    StatusBar1: TStatusBar;
    imgcollectMain: TImageCollection;
    ActionMainMenuBar1: TActionMainMenuBar;
    actnmanMain: TActionManager;
    SurveyFind: TAction;
    SurveyBrowse: TAction;
    SurveyGotoID: TAction;
    SurveyNew: TAction;
    InspectSchedule: TAction;
    InspectFindOrder: TAction;
    InspectBrowseOrders: TAction;
    InspectGotoOrderID: TAction;
    InspectProcessOrders: TAction;
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
    BalloonHint1: TBalloonHint;
    ToolsOptions: TAction;
    ToolsSystemLog: TAction;
    ToolsCompanySetup: TAction;
    LinkFind: TAction;
    LinkBrowse: TAction;
    LinkGotoID: TAction;
    LinkNew: TAction;
    HelpAbout: TAction;
    HelpWebSite: TAction;
    Panel1: TPanel;
    TFESPlanner1: TFESPlanner;
    procedure FormDestroy(Sender: TObject);
    procedure CustBrowseExecute(Sender: TObject);
    procedure CustBrowseUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InspectFindOrderExecute(Sender: TObject);
    procedure InspectFindOrderUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FESMain: TFESMain;
  FESCust: TCustomer;

implementation

{$R *.dfm}

uses dlgInspectOrdersFind;

procedure TFESMain.FormDestroy(Sender: TObject);
begin
  if Assigned(FESCust) then FreeAndNil(FESCust)

end;

procedure TFESMain.CustBrowseExecute(Sender: TObject);
begin
  if not Assigned(FESCust) then
    FESCust := TCustomer.Create(Self);
  FESCust.Show;
end;

procedure TFESMain.CustBrowseUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := false;
  if Assigned(FES) and FES.fesConnection.Connected and Assigned(CustomerData) then
    TAction(Sender).Enabled := true;
end;

procedure TFESMain.FormCreate(Sender: TObject);
begin
  // enable hints
  Application.ShowHint := true;
  FESCust := nil;
end;

procedure TFESMain.InspectFindOrderExecute(Sender: TObject);
var
  dlg: TFindInspectOrders;
begin
  dlg := TFindInspectOrders.Create(Self);
  if IsPositiveResult(dlg.ShowModal) then
  begin
    ;
  end;
  dlg.Free;
end;

procedure TFESMain.InspectFindOrderUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := false;
  if Assigned(FES) and FES.fesConnection.Connected then
    TAction(Sender).Enabled := true;
end;

end.
