unit dlgInspectOrdersFind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Data.DB, Vcl.Grids, Vcl.DBGrids,
  dmFES, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.VirtualImage, Vcl.TitleBarCtrls, System.Actions, Vcl.ActnList,
  dlgFilterCommon, unitFESDefines;

type

  TFESGotoRequest = (fesGotoUnknown, fesGotoCustomer, fesGotoSite, fesGotoInspectOrder);

  TFindInspectOrders = class(TForm)
    actnFilters: TAction;
    actnFilterToggle: TAction;
    actnList: TActionList;
    actnSearch: TAction;
    dsFindInspectOrder: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    qryFindInspectOrder: TFDQuery;
    qryFindInspectOrderAddress: TWideStringField;
    qryFindInspectOrderCaption: TWideStringField;
    qryFindInspectOrderCompletedDT: TSQLTimeStampField;
    qryFindInspectOrderCreatedOn: TSQLTimeStampField;
    qryFindInspectOrderCustName: TWideStringField;
    qryFindInspectOrderCustomerID: TIntegerField;
    qryFindInspectOrderInspectionOrderID: TFDAutoIncField;
    qryFindInspectOrderInspectionStatusID: TIntegerField;
    qryFindInspectOrderIsEnabled: TBooleanField;
    qryFindInspectOrderLinkStatus: TStringField;
    qryFindInspectOrderPostcodeID: TIntegerField;
    qryFindInspectOrderRequestedDT: TSQLTimeStampField;
    qryFindInspectOrderSiteID: TIntegerField;
    qryFindInspectOrderSuburb: TWideStringField;
    qryFindInspectOrderxAddress: TWideStringField;
    TitleBarPanel1: TTitleBarPanel;
    vimgFilters: TVirtualImage;
    vimgFindCustomer: TVirtualImage;
    vimgSync: TVirtualImage;
    vimgToggleFilters: TVirtualImage;
    VirtualImage5: TVirtualImage;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure vimgFiltersClick(Sender: TObject);
  private
    { Private declarations }
    fGotoRequest: TFESGotoRequest;
    FilterDLG: TFilterCommon;
    procedure FilterDeActivated(var Message: TMessage);
      message FES_FILTERDEACTIVATED;
    procedure FilterDLGInit(var Message: TMessage); message FES_FILTERDLGINIT;
    procedure FilterUpdated(var Message: TMessage); message FES_FILTERUPDATED;
  public
    { Public declarations }
    property GotoRequest: TFESGotoRequest read FGotoRequest write FGotoRequest;
  end;

var
  FindInspectOrders: TFindInspectOrders;

implementation

{$R *.dfm}

procedure TFindInspectOrders.FormDestroy(Sender: TObject);
begin
  // F I L T E R .
  if Assigned(FilterDLG) then
    FreeAndNil(FilterDLG);
end;

procedure TFindInspectOrders.FilterDeActivated(var Message: TMessage);
begin
  // if filter toggle is ON then enact the filter
  if actnFilterToggle.Checked then
  begin
    qryFindInspectOrder.DisableControls;
    qryFindInspectOrder.Close;
    // reassign params ....
    qryFindInspectOrder.Active;
    qryFindInspectOrder.EnableControls;
  end;
end;

procedure TFindInspectOrders.FilterDLGInit(var Message: TMessage);
begin
  if not Assigned(FilterDLG) then
  begin
    // F I L T E R .
    FilterDLG := TFilterCommon.Create(self);
  end;
end;

procedure TFindInspectOrders.FilterUpdated(var Message: TMessage);
begin
  if Assigned(FilterDLG) then
  begin
    // if filter toggle is ON then ...
    if actnFilterToggle.Checked then
      //
    else
      //
  end;
end;

procedure TFindInspectOrders.FormCreate(Sender: TObject);
begin
  qryFindInspectOrder.Active := false;
  // Setup default or last filtering given by user ...
  qryFindInspectOrder.Active := true;
  fGotoRequest := fesGotoUnknown;
  // F I L T E R S .
  // Can't create filterDLG here as (apparently) datamodule
  // FES hasn't been constructed!
  FilterDLG := nil;
  actnFilterToggle.Checked := false; // filter_off
  // Creation of FilterDLG requested here ...
  POSTMESSAGE(Handle, FES_FILTERDLGINIT, 0, 0);
end;

procedure TFindInspectOrders.vimgFiltersClick(Sender: TObject);
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

end.
