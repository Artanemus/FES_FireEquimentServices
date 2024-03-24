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
  Vcl.VirtualImage;

type

  TFESGotoRequest = (fesGotoUnknown, fesGotoCustomer, fesGotoSite, fesGotoInspectOrder);

  TFindInspectOrders = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnClose: TButton;
    Label5: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    SpeedButton1: TSpeedButton;
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    qryFindInspectOrder: TFDQuery;
    dsFindInspectOrder: TDataSource;
    qryFindInspectOrderInspectionOrderID: TFDAutoIncField;
    qryFindInspectOrderCustomerID: TIntegerField;
    qryFindInspectOrderSiteID: TIntegerField;
    qryFindInspectOrderIsEnabled: TBooleanField;
    qryFindInspectOrderRequestedDT: TSQLTimeStampField;
    qryFindInspectOrderCompletedDT: TSQLTimeStampField;
    qryFindInspectOrderCustName: TWideStringField;
    qryFindInspectOrderCaption: TWideStringField;
    qryFindInspectOrderAddress: TWideStringField;
    qryFindInspectOrderInspectionStatusID: TIntegerField;
    qryFindInspectOrderPostcodeID: TIntegerField;
    qryFindInspectOrderSuburb: TWideStringField;
    qryFindInspectOrderLinkStatus: TStringField;
    qryFindInspectOrderxAddress: TWideStringField;
    qryFindInspectOrderCreatedOn: TSQLTimeStampField;
    sbtnGotoCustomer: TSpeedButton;
    sbtnGotoSite: TSpeedButton;
    sbtnGotoInspectOrder: TSpeedButton;
    VirtualImage1: TVirtualImage;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fGotoRequest: TFESGotoRequest;
  public
    { Public declarations }
    property GotoRequest: TFESGotoRequest read FGotoRequest write FGotoRequest;

  end;

var
  FindInspectOrders: TFindInspectOrders;

implementation

{$R *.dfm}

procedure TFindInspectOrders.FormCreate(Sender: TObject);
begin
  qryFindInspectOrder.Active := false;
  // Setup default or last filtering given by user ...
  qryFindInspectOrder.Active := true;
  fGotoRequest := fesGotoUnknown;
end;

end.
