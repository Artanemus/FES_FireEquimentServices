unit dmInspectOrderData;

interface

uses
  System.SysUtils, System.Classes, dmFES, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TInspectOrderData = class(TDataModule)
    qryInspectOrder: TFDQuery;
    dsInspectOrder: TDataSource;
    qryInspectOrderInspectionOrderID: TFDAutoIncField;
    qryInspectOrderCreatedOn: TSQLTimeStampField;
    qryInspectOrderBookIN: TSQLTimeStampField;
    qryInspectOrderBookOUT: TSQLTimeStampField;
    qryInspectOrderServiceInterval: TFloatField;
    qryInspectOrderLevelNum: TIntegerField;
    qryInspectOrderNote: TWideStringField;
    qryInspectOrderInspectionStatusID: TIntegerField;
    qryInspectOrderIsArchived: TBooleanField;
    qryInspectOrderCustSiteID: TIntegerField;
    qryInspectOrderIsEnabled: TBooleanField;
    qryInspectOrderCustomerID: TIntegerField;
    qryInspectOrderIsPinned: TBooleanField;
    qryInspectOrderSiteID: TIntegerField;
    qryInspectOrderModifiedOn: TSQLTimeStampField;
    qryInspectOrderModifiedBy: TIntegerField;
    qryInspectOrderStatus: TFDQuery;
    qryInspectOrderluInspectOrderStatus: TStringField;
    qryInspectOrderSiteAddress: TWideStringField;
    qryCustomer: TFDQuery;
    dsCustomer: TDataSource;
    qrySite: TFDQuery;
    dsSite: TDataSource;
    qryCustSite: TFDQuery;
    dsCustSite: TDataSource;
    qryPortable: TFDQuery;
    dsPortable: TDataSource;
    qryElectric: TFDQuery;
    dsElectric: TDataSource;
    qryWaterBase: TFDQuery;
    dsWaterBase: TDataSource;
    qryStructual: TFDQuery;
    dsStructual: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InspectOrderData: TInspectOrderData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
