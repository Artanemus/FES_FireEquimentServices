unit frmCustomer;

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
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, dlgCustFilter, unitFESDefines,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Menus, Vcl.ControlList,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.ControlList, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Vcl.VirtualImage,
  frameFESCustAddress, Vcl.TitleBarCtrls, Vcl.WinXPanels, frameFESCustNumber,
  frameFESCustEmail;

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
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    dbchkboxIsArchived: TDBCheckBox;
    Label1: TLabel;
    dbedtCustName: TDBEdit;
    Label2: TLabel;
    dbedtCustCode: TDBEdit;
    spdbtnGenerateCustCode: TSpeedButton;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    DBCheckBox1: TDBCheckBox;
    TabSheet8: TTabSheet;
    actnmanCustomer: TActionManager;
    actnFilterSelect: TAction;
    actnpuInsert: TAction;
    actnpuDelete: TAction;
    actnpuEdit: TAction;
    actnpuPost: TAction;
    actnpuCancel: TAction;
    actpuRefresh: TAction;
    actnpuGotoContact: TAction;
    actnpuFindContact: TAction;
    actnpuGotoSiteContact: TAction;
    actnpuGotoSite: TAction;
    actnpuToggleLink: TAction;
    actnpuPostcode: TAction;
    actnSuburb: TAction;
    actnpuClearPostcodeSuburb: TAction;
    actnpuGotoInspectOrder: TAction;
    DBGrid6: TDBGrid;
    TitleBarPanel1: TTitleBarPanel;
    vimgSetFilters: TVirtualImage;
    vimgToggleFilters: TVirtualImage;
    vimgFindCustomer: TVirtualImage;
    vimgGotoID: TVirtualImage;
    VirtualImage5: TVirtualImage;
    vimgGotoCode: TVirtualImage;
    FESCustAddress1: TFESCustAddress;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actnGenerateCustCodeExecute(Sender: TObject);
    procedure vimgSetFiltersClick(Sender: TObject);
  private
    { Private declarations }
    fFilterDlg: TCustFilter;
    FCustFilterState: TFilterState;

  protected
    procedure FilterDlgUpdated(var Msg: TMessage); message FES_FILTERUPDATED;
    procedure FilterDlgDeactivated(var Msg: TMessage); message FES_FILTERDEACTIVATED;

  public
    { Public declarations }
  end;

var
  Customer: TCustomer;

implementation

{$R *.dfm}

uses unitFEStools;


procedure TCustomer.FormDestroy(Sender: TObject);
begin
  //  WritePreferences;
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
      fCustFilterState.HideInActive := FilterState^.HideInActive;
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
begin
  fFilterDlg := nil; // Select filters for customer records
  CustomTitleBar.Enabled := true; // GlassFrame.Top = TitleBar.Height
//  FESCustAddress1.HideUnPinned := false;
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

procedure TCustomer.vimgSetFiltersClick(Sender: TObject);
var
  aRect: TRect;
begin
  if not assigned(fFilterDlg) then
  begin
    fFilterDlg := TCustFilter.Create(Self);
    fFilterDlg.Position := poDesigned;
    aRect := vimgSetFilters.ClientToScreen(vimgSetFilters.ClientRect);
    fFilterDlg.Left := aRect.Left;
    fFilterDlg.Top := aRect.Bottom + 1;
    fFilterDlg.Show;
  end;
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
