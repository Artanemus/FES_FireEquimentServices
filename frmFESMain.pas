unit frmFESMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  System.Actions,
  System.ImageList,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Vcl.VirtualImageList,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.BaseImageCollection,
  Vcl.ImageCollection,
  Vcl.VirtualImage,
  Vcl.WinXCtrls,
  Vcl.Buttons,
  Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan,
  Vcl.ToolWin,
  Vcl.ActnCtrls,
  Vcl.ActnMenus,
  Vcl.StdActns,
  dmFES,
  Planner,
  DBPlanner,
  dmCustomerData,
  frmCustomer,
  frmInspectOrder,
  dmInspectOrderData,
  Vcl.WinXPanels,
  dlgFilterStatus,
  Data.DB, unitFESDefines;

type
  TFESMain = class(TForm)
    ActionMainMenuBar1: TActionMainMenuBar;
    actnCopy: TAction;
    actnCut: TAction;
    actnDelete: TAction;
    actnFilterToggle: TAction;
    actnmanMain: TActionManager;
    actnPaste: TAction;
    actnPrefernces: TAction;
    actnStationEditor: TAction;
    actnStatusPalette: TAction;
    BalloonHint1: TBalloonHint;
    CustBrowse: TAction;
    CustFind: TAction;
    CustGotoCODE: TAction;
    CustGotoID: TAction;
    CustNew: TAction;
    DAYSRC: TDBDaySource;
    dtPicker: TDateTimePicker;
    edtNumOfDays: TEdit;
    EquipBrowse: TAction;
    EquipFind: TAction;
    EquipGotoID: TAction;
    EquipNew: TAction;
    FileConnect: TAction;
    FileExit1: TFileExit;
    HelpAbout: TAction;
    HelpWebSite: TAction;
    HRBrowse: TAction;
    HRFind: TAction;
    HRGotoID: TAction;
    HRNew: TAction;
    InspectBrowseOrders: TAction;
    InspectFindOrder: TAction;
    InspectGotoOrderID: TAction;
    InspectProcessOrders: TAction;
    InspectSchedule: TAction;
    lblCompanyName: TLabel;
    LinkBrowse: TAction;
    LinkFind: TAction;
    LinkGotoID: TAction;
    LinkNew: TAction;
    Panel1: TPanel;
    PLAN: TDBPlanner;
    pnlHeader: TPanel;
    SiteBrowse: TAction;
    SiteFind: TAction;
    SiteGotoID: TAction;
    SiteNew: TAction;
    sbtnFilterToggle: TSpeedButton;
    StackPanel1: TStackPanel;
    StatusBar1: TStatusBar;
    SurveyBrowse: TAction;
    SurveyFind: TAction;
    SurveyGotoID: TAction;
    SurveyNew: TAction;
    ToolsCompanySetup: TAction;
    ToolsOptions: TAction;
    ToolsSystemLog: TAction;
    vimageLogo: TVirtualImage;
    vimgDayCountDec: TVirtualImage;
    vimgDayCountInc: TVirtualImage;
    vimgFilters: TVirtualImage;
    StackPanel2: TStackPanel;
    procedure actnFilterToggleExecute(Sender: TObject);
    procedure actnFilterToggleUpdate(Sender: TObject);
    procedure actnStatusPaletteExecute(Sender: TObject);
    procedure CustBrowseExecute(Sender: TObject);
    procedure DAYSRCFieldsToItem(Sender: TObject; Fields: TFields;
      Item: TPlannerItem);
    procedure dtPickerChange(Sender: TObject);
    procedure edtNumOfDaysChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GenericUpdate(Sender: TObject);
    procedure HRBrowseExecute(Sender: TObject);
    procedure HRFindExecute(Sender: TObject);
    procedure InspectBrowseOrdersExecute(Sender: TObject);
    procedure InspectFindOrderExecute(Sender: TObject);
    procedure vimgDayCountDecClick(Sender: TObject);
    procedure vimgDayCountIncClick(Sender: TObject);
    procedure vimgFiltersClick(Sender: TObject);
  private
    FilterDLG: TFilterStatus;
    FxHeight: integer;
    FxLeft: integer;
    FxTop: integer;
    FxTopRow, FxLeftCol: integer;
    FxWidth: integer;
    iniFileName: TFileName;
    procedure ReadPreferences(iniFileName: TFileName);
    procedure WritePreferences(iniFileName: TFileName);
  public const
    DEFFORM_HEIGHT = 900;
    DEFFORM_WIDTH = 1200;
    procedure FilterDeActivated(var Message: TMessage);
      message FES_FILTERDEACTIVATED;
    procedure FilterUpdated(var Message: TMessage); message FES_FILTERUPDATED;
    procedure FilterDLGInit(var Message: TMessage); message FES_FILTERDLGINIT;
  end;

var
  FESMain: TFESMain;
  FESCust: TCustomer;
  FESInspect: TInspectOrder;

const
  MAXDAYCOUNT = 150;

implementation

{$R *.dfm}

uses dlgFindInspectOrder, dlgStatusPalette

    , System.IniFiles, unitFESutility, frmHR, dlgFindHR;

procedure TFESMain.actnFilterToggleExecute(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  if TAction(Sender).Checked then
  begin
    if Assigned(FilterDLG) then
      PLAN.Layer := FilterDLG.LayerCode
    else
      PLAN.Layer := 0;
  end;
  if not TAction(Sender).Checked then
    PLAN.Layer := 0;
end;

procedure TFESMain.actnFilterToggleUpdate(Sender: TObject);
begin
  if TAction(Sender).Checked and (TAction(Sender).ImageIndex <> 24) then
    TAction(Sender).ImageIndex := 24; // filter_on
  if not TAction(Sender).Checked and (TAction(Sender).ImageIndex <> 25) then
    TAction(Sender).ImageIndex := 25; // filter_off
end;

procedure TFESMain.actnStatusPaletteExecute(Sender: TObject);
var
  dlg: TStatusPalette;
begin
  dlg := TStatusPalette.Create(self);
  if IsPositiveResult(dlg.ShowModal()) then
  begin
    FES.qryPlannerItem.Close;
    FES.qryPlannerItem.Active := true;
    DAYSRC.SynchDBItems;
  end;
  dlg.free;
end;

procedure TFESMain.CustBrowseExecute(Sender: TObject);
begin
  if not Assigned(FESCust) then
    FESCust := TCustomer.Create(self);
  FESCust.Show;
end;

procedure TFESMain.DAYSRCFieldsToItem(Sender: TObject; Fields: TFields;
  Item: TPlannerItem);
begin
  Item.TrackColor := Fields.FieldByName('TMSTrackColor').AsInteger;
  // Item.TrackSelectColor := Fields.FieldByName('TMSSelectedTrackColor').AsInteger;
  // Item.Color := Fields.FieldByName('TMSColor').AsInteger;
  // Item.SelectColor := Fields.FieldByName('TMSSelectedColor').AsInteger;
  // Item.CaptionBkg := Fields.FieldByName('TMSCaptionColor').AsInteger;
  // Item.SelectCaptionBkg := Fields.FieldByName('TMSSelectedCaptionColor').AsInteger;
  Item.Layer := Fields.FieldByName('Layer').AsInteger; // power of 2
end;

procedure TFESMain.dtPickerChange(Sender: TObject);
begin
  DAYSRC.Day := dtPicker.Date;
end;

procedure TFESMain.edtNumOfDaysChange(Sender: TObject);
var
  I: integer;
begin
  I := Round(StrToIntDef(edtNumOfDays.Text, 0));
  if (I > 0) and (I < MAXDAYCOUNT) then
    DAYSRC.NumberOfDays := I;
end;

procedure TFESMain.FilterDeActivated(var Message: TMessage);
begin
  // if filter toggle is ON then assign layercode
  if actnFilterToggle.Checked then
    PLAN.Layer := FilterDLG.LayerCode
  else
    PLAN.Layer := 0; // show all layers
end;

procedure TFESMain.FilterDLGInit(var Message: TMessage);
begin
  if not Assigned(FilterDLG) then
  begin
    // F I L T E R .
    // Creation - preferences are read and the layercode is calculated.
    // Done here to be sure FES.fesConnection is created and initialised.
    // FilterDLG.LayerCode stores current users preferences for layer visibility.
    FilterDLG := TFilterStatus.Create(self);
  end;
end;

procedure TFESMain.FilterUpdated(var Message: TMessage);
begin
  if Assigned(FilterDLG) then
  begin
    // if filter toggle is ON then assign layercode
    if actnFilterToggle.Checked then
      PLAN.Layer := Message.WParam
    else
      PLAN.Layer := 0; // show all layers
  end;
end;

procedure TFESMain.FormCreate(Sender: TObject);
begin
  Application.ShowHint := true; // enable hints
  FxTop := 0;
  FxLeft := 0;

  FESCust := nil;
  FESInspect := nil;
  edtNumOfDays.Text := '7';
  dtPicker.Date := Date;
  // r e a d   p r e f e r e n c e .
  iniFileName := GetFESPreferenceFileName();
  if (FileExists(iniFileName)) then
    ReadPreferences(iniFileName);
  DAYSRC.NumberOfDays := Round(StrToIntDef(edtNumOfDays.Text, 0));
  DAYSRC.Day := dtPicker.Date;
  PLAN.GridTopRow := FxTopRow;
  PLAN.GridLeftCol := FxLeftCol;

  // F I L T E R S .
  // Can't create filterDLG here as (apparently) datamodule
  // FES hasn't been constructed!
  FilterDLG := nil;
  actnFilterToggle.Checked := false; // filter_off
  PLAN.Layer := 0; // show all layers
  // Creation of FilterDLG requested here ...
  POSTMESSAGE(Handle, FES_FILTERDLGINIT, 0, 0);
end;

procedure TFESMain.FormDestroy(Sender: TObject);
begin
  FxTopRow := PLAN.GridTopRow;
  FxLeftCol := PLAN.GridLeftCol;

  // F I L T E R .
  if Assigned(FilterDLG) then
    FreeAndNil(FilterDLG);

  // w r i t e   p r e f e r e n c e s .
  iniFileName := GetFESPreferenceFileName();
  if (FileExists(iniFileName)) then
    WritePreferences(iniFileName);
  if Assigned(FESCust) then
    FreeAndNil(FESCust);
  if Assigned(FESInspect) then
    FreeAndNil(FESInspect)
end;

procedure TFESMain.FormHide(Sender: TObject);
begin
  FxHeight := Height;
  FxWidth := Width;
  FxTop := Top;
  FxTop := Left;
end;

procedure TFESMain.FormShow(Sender: TObject);
begin
  Height := FxHeight;
  Width := FxWidth;
  Top := FxTop;
  Left := FxTop;
end;

procedure TFESMain.GenericUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := false;
  if Assigned(FES) and FES.fesConnection.Connected then
    TAction(Sender).Enabled := true;
end;

procedure TFESMain.HRBrowseExecute(Sender: TObject);
var
  dlg: THR;
begin
  dlg := THR.Create(self);
  if IsPositiveResult(dlg.ShowModal()) then
  begin;
    // do something ....
  end;
  dlg.free;
end;

procedure TFESMain.HRFindExecute(Sender: TObject);
var
dlg: TFindHR;
begin
  dlg := TFindHR.Create(self);
  if IsPositiveResult(dlg.ShowModal()) then
  begin;
    // do something ....
  end;
  dlg.free;
end;

procedure TFESMain.InspectBrowseOrdersExecute(Sender: TObject);
begin
  if not Assigned(FESInspect) then
    FESInspect := TInspectOrder.Create(self);
  FESInspect.Show;
end;

procedure TFESMain.InspectFindOrderExecute(Sender: TObject);
var
  dlg: TFindInspectOrders;
begin
  dlg := TFindInspectOrders.Create(self);
  if IsPositiveResult(dlg.ShowModal()) then
  begin;
    // do something ....
  end;
  dlg.free;
end;

procedure TFESMain.ReadPreferences(iniFileName: TFileName);
var
  iFile: TIniFile;
begin
  iFile := TIniFile.Create(iniFileName);
  FxWidth := iFile.ReadInteger('MainPref', 'Width', DEFFORM_WIDTH);
  FxHeight := iFile.ReadInteger('MainPref', 'Height', DEFFORM_HEIGHT);
  FxTop := iFile.ReadInteger('MainPref', 'Top', 0);
  FxLeft := iFile.ReadInteger('MainPref', 'Left', 0);
  dtPicker.Date := iFile.ReadDate('MainPref', 'Day', Date);
  edtNumOfDays.Text := IntToStr(iFile.ReadInteger('MainPref',
    'NumOfDays', 1));
  FxTopRow := iFile.ReadInteger('MainPref', 'TopRow', 0);
  FxLeftCol := iFile.ReadInteger('MainPref', 'LeftCol', 0);
  iFile.free;
end;

procedure TFESMain.vimgDayCountDecClick(Sender: TObject);
var
  I: integer;
begin
  I := Round(StrToIntDef(edtNumOfDays.Text, 0));
  I := I - 1;
  if (I > 0) then
    edtNumOfDays.Text := IntToStr(I); // calls - edtNumOfDaysChange
end;

procedure TFESMain.vimgDayCountIncClick(Sender: TObject);
var
  Days: integer;
begin
  Days := Round(StrToIntDef(edtNumOfDays.Text, 0));
  Days := Days + 1;
  if (Days < MAXDAYCOUNT) then
    edtNumOfDays.Text := IntToStr(Days); // calls - edtNumOfDaysChange
end;

procedure TFESMain.vimgFiltersClick(Sender: TObject);
var
  aRect: Trect;
begin
  // launch the status filter....
  if Assigned(FilterDLG) and not FilterDLG.Visible then
  begin
    FilterDLG.Position := poDesigned;
    aRect := vimgFilters.ClientToScreen(vimgFilters.ClientRect);
    FilterDLG.Left := aRect.Left;
    FilterDLG.Top := aRect.Bottom + 1;
    FilterDLG.Show;
  end;
end;

procedure TFESMain.WritePreferences(iniFileName: TFileName);
var
  iFile: TIniFile;
begin
  iFile := TIniFile.Create(iniFileName);
  iFile.WriteInteger('MainPref', 'Width', Width);
  iFile.WriteInteger('MainPref', 'Height', Height);
  iFile.WriteInteger('MainPref', 'Top', Top);
  iFile.WriteInteger('MainPref', 'Left', Left);
  iFile.WriteDate('MainPref', 'Day', dtPicker.Date);
  iFile.WriteInteger('MainPref', 'NumOfDays',
    Round(StrToIntDef(edtNumOfDays.Text, 1)));
  iFile.WriteInteger('MainPref', 'TopRow', FxTopRow);
  iFile.WriteInteger('MainPref', 'LeftCol', FxLeftCol);
  iFile.free;
end;

end.
