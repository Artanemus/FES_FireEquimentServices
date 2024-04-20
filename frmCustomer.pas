unit frmCustomer;
{
  Default ....
  WIDTH  799
  HEIGHT 712
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  dmFES, dmCustomerData, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, dlgFilterCommon, unitFESDefines,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Menus, Vcl.ControlList,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.ControlList, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Vcl.VirtualImage,
  frameFESCustAddress, Vcl.TitleBarCtrls, Vcl.WinXPanels, frameFESCustNumber,
  frameFESCustEmail, frameFESCustSite, frameFESCustContact, frameFESCustInspect,
  frameFESCustSurvey;

type
  TCustomer = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    dbtxtCustomerID: TDBText;
    dbtxtCustName: TDBText;
    Label1: TLabel;
    dbedtCustName: TDBEdit;
    Label2: TLabel;
    dbedtCustCode: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    TabSheet8: TTabSheet;
    TitleBarPanel1: TTitleBarPanel;
    vimgSetFilters: TVirtualImage;
    vimgToggleFilters: TVirtualImage;
    vimgFindCustomer: TVirtualImage;
    vimgSync: TVirtualImage;
    FESCustAddress1: TFESCustAddress;
    FESCustNumber1: TFESCustNumber;
    FESCustEmail1: TFESCustEmail;
    FESCustSite1: TFESCustSite;
    FESCustContact1: TFESCustContact;
    FESCustSurvey1: TFESCustSurvey;
    FESCustInspect1: TFESCustInspect;
    vimgArchive: TVirtualImage;
    actnmanCustomer: TActionManager;
    actnFilterSelect: TAction;
    actnpuInsert: TAction;
    actnpuDelete: TAction;
    actnpuEdit: TAction;
    actnpuPost: TAction;
    actnpuCancel: TAction;
    actpuRefresh: TAction;
    actnpuGotoContact: TAction;
    actnpuGotoSiteContact: TAction;
    actnpuGotoSite: TAction;
    actnpuGotoInspectOrder: TAction;
    actnpuFindContact: TAction;
    actnpuToggleLink: TAction;
    actnpuPostcode: TAction;
    actnSuburb: TAction;
    actnpuClearPostcodeSuburb: TAction;
    VirtualImage1: TVirtualImage;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage4: TVirtualImage;
    VirtualImage5: TVirtualImage;
    StackPanel1: TStackPanel;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actnGenerateCustCodeExecute(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure vimgSetFiltersClick(Sender: TObject);
  private
    { Private declarations }
    fFilterDlg: TFilterCommon;
    FCustFilterState: TFilterState;
    { Metric for OnShow}
    FxHeight: integer;
    FxWidth: integer;
    FxTop: integer;
    FxLeft: integer;
    FxTabIndex: integer;

    procedure ReadPreferences(iniFileName: TFileName);
    procedure WritePreferences(iniFileName: TFileName);


  protected
    procedure FilterDlgUpdated(var Msg: TMessage); message FES_FILTERUPDATED;
    procedure FilterDlgDeactivated(var Msg: TMessage); message FES_FILTERDEACTIVATED;

  public
    { Public declarations }
  end;

var
  Customer: TCustomer;

const
  DEFCUSTFORM_HEIGHT = 712;
  DEFCUSTFORM_WIDTH = 799;

implementation

{$R *.dfm}

uses unitFEStools, system.IniFiles, unitFESutility;


procedure TCustomer.FormDestroy(Sender: TObject);
var
  iniFileName: TFileName;
begin
  // w r i t e   p r e f e r e n c e s .
  iniFileName := GetFESPreferenceFileName();
  if (FileExists(iniFileName)) then WritePreferences(iniFileName);
  if assigned(fFilterDlg) then fFilterDlg.Free;
end;

procedure TCustomer.FilterDlgDeactivated(var Msg: TMessage);
begin
  if assigned(fFilterDlg) then
  begin
      fFilterDlg.Hide;
      FreeAndNil(fFilterDlg);
  end;
end;

procedure TCustomer.FilterDlgUpdated(var Msg: TMessage);
var
  CopyData: PCopyDataStruct;
  FilterState: PFilterState;
begin
  if Msg.LParam = 0 then exit;
  try
    begin
      CopyData := PCopyDataStruct(Msg.LParam);
      FilterState := PFilterState(CopyData^.lpData);
      // store record data...
      fCustFilterState.HideArchived := FilterState^.HideArchived;
      fCustFilterState.HideLocked := FilterState^.HideLocked;
      fCustFilterState.HideLinked := FilterState^.HideLinked;
      fCustFilterState.StartDT := FilterState^.StartDT;
      fCustFilterState.EndDT := FilterState^.EndDT;
    end
  finally
    begin
//      CustomerData.UpdateCustFilter(fID, fHideArchived, fHideInActive,
//        fHideLinked, fStartDT, fEndDT);

      actnFilterSelect.Caption := 'Filter (' +
        IntToStr(CustomerData.dsCustomer.DataSet.RecordCount) + ')';
    end;
  end;
end;

procedure TCustomer.FormCreate(Sender: TObject);
var
  iniFileName: string;
begin
  fFilterDlg := nil; // Select filters for customer records
  CustomTitleBar.Enabled := true; // GlassFrame.Top = CustomeTitleBar.Height
  { DEFAULT form metrics }
  FxHeight := DEFCUSTFORM_HEIGHT;
  FxWidth := DEFCUSTFORM_WIDTH;
  FxTop := 0;
  FxLeft := 0;
  FxTabIndex := 0;
  // r e a d   p r e f e r e n c e .
  iniFileName := GetFESPreferenceFileName();
  if (FileExists(iniFileName)) then ReadPreferences(iniFileName);
end;

procedure TCustomer.actnGenerateCustCodeExecute(Sender: TObject);
var
  s: string;
begin
  if assigned(CustomerData) and CustomerData.dsCustomer.DataSet.Active then
  begin
    s := GenerateReadableCustomerCode
      (CustomerData.dsCustomer.DataSet.FieldByName('CustName').AsString);
    if CustomerData.dsCustomer.DataSet.State = dsBrowse then
        CustomerData.dsCustomer.DataSet.Edit;
    if CustomerData.dsCustomer.DataSet.State = dsEdit then
        CustomerData.dsCustomer.DataSet.FieldByName('CustCode').AsString := s;
  end;
end;

procedure TCustomer.FormHide(Sender: TObject);
begin
  FxHeight  := Height;
  fxWidth := Width;
  FxTabIndex := PageControl1.ActivePageIndex;
end;

procedure TCustomer.FormShow(Sender: TObject);
begin
  Height := FxHeight;
  Width := fxWidth;
  PageControl1.ActivePageIndex := FxTabIndex;
end;


procedure TCustomer.ReadPreferences(iniFileName: TFileName);
var
  iFile: TIniFile;
begin
  iFile := TIniFile.Create(iniFileName);
  FxWidth := iFile.ReadInteger('CustomerPref', 'Width', DEFCUSTFORM_WIDTH);
  FxHeight := iFile.ReadInteger('CustomerPref', 'Height', DEFCUSTFORM_HEIGHT);
  FxTop := iFile.ReadInteger('CustomerPref', 'Top', 0);
  FxLeft:= iFile.ReadInteger('CustomerPref', 'Left', 0);
  FxTabIndex := iFile.ReadInteger('CustomerPref', 'TabIndex', 0);
  iFile.free;
end;

procedure TCustomer.vimgSetFiltersClick(Sender: TObject);
var
  aRect: TRect;
begin
  if not assigned(fFilterDlg) then
  begin
    fFilterDlg := TFilterCommon.Create(Self);
    fFilterDlg.Position := poDesigned;
    aRect := vimgSetFilters.ClientToScreen(vimgSetFilters.ClientRect);
    fFilterDlg.Left := aRect.Left;
    fFilterDlg.Top := aRect.Bottom + 1;
    fFilterDlg.Show;
  end;
end;


procedure TCustomer.WritePreferences(iniFileName: TFileName);
var
  iFile: TIniFile;
begin
  iFile := TIniFile.Create(IniFileName);
  iFile.WriteInteger('CustomerPref', 'Width', Width);
  iFile.WriteInteger('CustomerPref', 'Height', Height);
  iFile.WriteInteger('CustomerPref', 'Top', Top);
  iFile.WriteInteger('CustomerPref', 'Left', Left);
  iFile.WriteInteger('CustomerPref', 'TabIndex', PageControl1.ActivePageIndex);
 	iFile.free;
end;

{
procedure TDBNavigator.BtnClick(Index: TNavigateBtn);
begin
  if (DataSource <> nil) and (DataSource.State <> dsInactive) then
  begin
    if not (csDesigning in ComponentState) and Assigned(FBeforeAction) then
      FBeforeAction(Self, Index);
    with DataSource.DataSet do
    begin
      case Index of
        nbPrior: Prior;
        nbNext: Next;
        nbFirst: First;
        nbLast: Last;
        nbInsert: Insert;
        nbEdit: Edit;
        nbCancel: Cancel;
        nbPost: Post;
        nbRefresh: Refresh;
        nbDelete:
          if not FConfirmDelete or
            (MessageDlg(SDeleteRecordQuestion, mtConfirmation,
            mbOKCancel, 0) <> idCancel) then Delete;
        nbApplyUpdates: Self.ApplyUpdates;
        nbCancelUpdates: Self.CancelUpdates;
      end;
    end;
  end;
  if not (csDesigning in ComponentState) and Assigned(FOnNavClick) then
    FOnNavClick(Self, Index);
end;

procedure TDBNavigator.ApplyUpdates;
var
  Intf: IDataSetCommandSupport;
begin
  if (Self.DataSource <> nil) and Supports(Self.DataSource.DataSet, IDataSetCommandSupport, Intf) then
    Intf.ExecuteCommand(sApplyUpdatesDataSetCommand, [MaxErrors])
end;

function TDBNavigator.CanApplyUpdates: Boolean;
var
  Intf: IDataSetCommandSupport;
begin
  if (Self.DataSource <> nil) and Supports(Self.DataSource.DataSet, IDataSetCommandSupport, Intf) then
    Result := dcEnabled in Intf.GetCommandStates(sApplyUpdatesDataSetCommand)
  else
    Result := False;
end;

procedure TDBNavigator.CancelUpdates;
var
  Intf: IDataSetCommandSupport;
begin
  if (Self.DataSource <> nil) and Supports(Self.DataSource.DataSet, IDataSetCommandSupport, Intf) then
    Intf.ExecuteCommand(sCancelUpdatesDataSetCommand, [MaxErrors])
end;

function TDBNavigator.CanCancelUpdates: Boolean;
var
  Intf: IDataSetCommandSupport;
begin
  if (Self.DataSource <> nil) and Supports(Self.DataSource.DataSet, IDataSetCommandSupport, Intf) then
    Result := dcEnabled in Intf.GetCommandStates(sCancelUpdatesDataSetCommand)
  else
    Result := False;
end;
}

end.
