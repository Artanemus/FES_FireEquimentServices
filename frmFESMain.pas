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
  // TMS PLANNER VCL
  Planner, DBPlanner,
  dmCustomerData, frameFESPlanner,
  frmCustomer, frmInspectOrder, dmInspectOrderData, Vcl.WinXPanels
  , Data.DB;

type
  TFESMain = class(TForm)
    pnlHeader: TPanel;
    vimageLogo: TVirtualImage;
    lblCompanyName: TLabel;
    StatusBar1: TStatusBar;
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
    MyPlanner: TFESPlanner;
    actnStationEditor: TAction;
    actnCut: TAction;
    actnCopy: TAction;
    actnPaste: TAction;
    actnDelete: TAction;
    actnStatusPalette: TAction;
    actnPrefernces: TAction;
    edtDayCount: TEdit;
    vimgDayCountDec: TVirtualImage;
    vimgDayCountInc: TVirtualImage;
    StackPanel1: TStackPanel;
    procedure actnStatusPaletteExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CustBrowseExecute(Sender: TObject);
    procedure edtDayCountChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InspectBrowseOrdersExecute(Sender: TObject);
    procedure InspectFindOrderExecute(Sender: TObject);
    procedure GenericUpdate(Sender: TObject);
    procedure TFESPlanner1DBDaySource1FieldsToItem(Sender: TObject; Fields:
        TFields; Item: TPlannerItem);
    procedure vimgDayCountDecClick(Sender: TObject);
    procedure vimgDayCountIncClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FESMain: TFESMain;
  FESCust: TCustomer;
  FESInspect: TInspectOrder;

implementation

{$R *.dfm}

uses dlgInspectOrdersFind, dlgStatusPalette;

procedure TFESMain.actnStatusPaletteExecute(Sender: TObject);
var
dlg: TStatusPalette;
begin
  dlg := TStatusPalette.Create(self);
  if IsPositiveResult(dlg.ShowModal()) then
  begin
    FES.qryPlannerItem.Close;
    FES.qryPlannerItem.Active := true;
    MyPlanner.DBDaySource1.SynchDBItems;
  end;
  dlg.free;
end;

procedure TFESMain.FormDestroy(Sender: TObject);
begin
  if Assigned(FESCust) then
    FreeAndNil(FESCust);
  if Assigned(FESInspect) then
    FreeAndNil(FESInspect)
end;

procedure TFESMain.CustBrowseExecute(Sender: TObject);
begin
  if not Assigned(FESCust) then
    FESCust := TCustomer.Create(Self);
  FESCust.Show;
end;

procedure TFESMain.edtDayCountChange(Sender: TObject);
var
Days: integer;
begin
  Days := Round(StrToIntDef(edtDayCount.Text, 0));
  if (Days > 0) and (Days < 32) then
  MyPlanner.DBDaySource1.NumberOfDays := Days;
end;

procedure TFESMain.FormCreate(Sender: TObject);
begin
  Application.ShowHint := true; // enable hints
  FESCust := nil;
  FESInspect := nil;
  edtDayCount.Text := IntToStr(MyPlanner.DBDaySource1.NumberOfDays);
end;

procedure TFESMain.InspectBrowseOrdersExecute(Sender: TObject);
begin
  if not Assigned(FESInspect) then
    FESInspect := TInspectOrder.Create(Self);
  FESInspect.Show;
end;

procedure TFESMain.InspectFindOrderExecute(Sender: TObject);
var
  dlg: TFindInspectOrders;
begin
  dlg := TFindInspectOrders.Create(Self);
  if IsPositiveResult(dlg.ShowModal) then
  begin;
  end;
  dlg.Free;
end;

procedure TFESMain.GenericUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := false;
  if Assigned(FES) and FES.fesConnection.Connected then
    TAction(Sender).Enabled := true;
end;

procedure TFESMain.TFESPlanner1DBDaySource1FieldsToItem(Sender: TObject;
    Fields: TFields; Item: TPlannerItem);
begin
  Item.TrackColor := Fields.FieldByName('TMSTrackColor').AsInteger;
end;

procedure TFESMain.vimgDayCountDecClick(Sender: TObject);
var
Days: integer;
begin
  Days := Round(StrToIntDef(edtDayCount.Text, 0));
  Days := Days - 1;
  if (Days > 0) then
    edtDayCount.Text := IntToStr(Days);
end;

procedure TFESMain.vimgDayCountIncClick(Sender: TObject);
var
Days: integer;
begin
  Days := Round(StrToIntDef(edtDayCount.Text, 0));
  Days := Days + 1;
  if (Days < 32) then
    edtDayCount.Text := IntToStr(Days);
end;

end.
