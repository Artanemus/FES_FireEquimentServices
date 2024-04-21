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
  unitFESDefines, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Vcl.ControlList,
  dlgFilterCommon, dlgFilterStatus, HTMLabel;

type

  TFESGotoRequest = (fesGotoUnknown, fesGotoCustomer, fesGotoSite, fesGotoInspectOrder);

  TFindInspectOrders = class(TForm)
    actnFilters: TAction;
    actnFilterToggle: TAction;
    actnList: TActionList;
    actnSearch: TAction;
    bindList: TBindingsList;
    bindSrc: TBindSourceDB;
    btnEdit: TControlListButton;
    btnIsEnabled: TControlListButton;
    ControlList1: TControlList;
    dsFindInspectOrder: TDataSource;
    edtSearch: TEdit;
    HTMLabel1: THTMLabel;
    Label1: TLabel;
    lblBookIN: TLabel;
    lblCustCode: TLabel;
    lblStatusStr: TLabel;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldBrushColor: TLinkPropertyToField;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkPropertyToFieldCaption4: TLinkPropertyToField;
    LinkPropertyToFieldHTMLTextText: TLinkPropertyToField;
    Panel1: TPanel;
    qryFindInspectOrder: TFDQuery;
    Shape1: TShape;
    TitleBarPanel1: TTitleBarPanel;
    vimgFilterStatus: TVirtualImage;
    vimgFilterCommon: TVirtualImage;
    vimgFindCustomer: TVirtualImage;
    vimgSync: TVirtualImage;
    vimgToggleFilters: TVirtualImage;
    VirtualImage5: TVirtualImage;
    procedure ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas; ARect:
        TRect; AState: TOwnerDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure vimgFilterCommonClick(Sender: TObject);
    procedure vimgFilterStatusClick(Sender: TObject);
  private
    { Private declarations }
    fGotoRequest: TFESGotoRequest;
    FilterCommonDLG: TFilterCommon;
    FilterStatusDLG: TFilterStatus;
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

procedure TFindInspectOrders.ControlList1BeforeDrawItem(AIndex: Integer;
    ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
begin
  if bindSrc.DataSet.FieldByName('IsEnabled').AsBoolean then
    btnIsEnabled.ImageIndex := 22  // Checked.
  else
    btnIsEnabled.ImageIndex := 23; // Un-Checked.
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
  if not Assigned(FilterCommonDLG) then
  begin
    // F I L T E R .
    FilterCommonDLG := TFilterCommon.Create(self);
    // F I L T E R .
    FilterStatusDLG := TFilterStatus.Create(self);
  end;
end;

procedure TFindInspectOrders.FilterUpdated(var Message: TMessage);
begin
  if Assigned(FilterCommonDLG) then
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
  qryFindInspectOrder.Active := true;
  fGotoRequest := fesGotoUnknown;
  CustomTitleBar.Enabled := true; // GlassFrame.Top = CustomeTitleBar.Height

  // F I L T E R S .
  // Can't create filterDLG here as (apparently) datamodule
  // FES hasn't been constructed!
  FilterCommonDLG := nil;
  actnFilterToggle.Checked := false; // filter_off
  // Creation of FilterDLG requested here ...
  POSTMESSAGE(Handle, FES_FILTERDLGINIT, 0, 0);
end;

procedure TFindInspectOrders.FormDestroy(Sender: TObject);
begin
  // F I L T E R .
  if Assigned(FilterCommonDLG) then
    FreeAndNil(FilterCommonDLG);
  if Assigned(FilterStatusDLG) then
    FreeAndNil(FilterStatusDLG);
end;

procedure TFindInspectOrders.vimgFilterCommonClick(Sender: TObject);
var
  ARect: TRect;
begin
  // launch filter dialogue....
  if Assigned(FilterCommonDLG) and not FilterCommonDLG.Visible then
  begin
    FilterCommonDLG.Position := poDesigned;
    ARect := vimgFilterCommon.ClientToScreen(vimgFilterCommon.ClientRect);
    FilterCommonDLG.Left := ARect.Left;
    FilterCommonDLG.Top := ARect.Bottom + 1;
    FilterCommonDLG.Show;
  end;

end;

procedure TFindInspectOrders.vimgFilterStatusClick(Sender: TObject);
var
  ARect: TRect;
begin
  if Assigned(FilterStatusDLG) and not FilterStatusDLG.Visible then
  begin
    FilterStatusDLG.Position := poDesigned;
    ARect := vimgFilterStatus.ClientToScreen(vimgFilterStatus.ClientRect);
    FilterStatusDLG.Left := ARect.Left;
    FilterStatusDLG.Top := ARect.Bottom + 1;
    FilterStatusDLG.Show;
  end;
end;

end.
