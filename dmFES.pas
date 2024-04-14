unit dmFES;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TFES = class(TDataModule)
    fesConnection: TFDConnection;
    qryPlannerItem: TFDQuery;
    dsPlannerItem: TDataSource;
    imgCollection: TImageCollection;
    imgList32x32: TVirtualImageList;
    qryPlannerItemInspectionOrderID: TFDAutoIncField;
    qryPlannerItemCreatedOn: TSQLTimeStampField;
    qryPlannerItemServiceInterval: TFloatField;
    qryPlannerItemLevelNum: TIntegerField;
    qryPlannerItemNotePortable: TWideStringField;
    qryPlannerItemNoteElectrical: TWideStringField;
    qryPlannerItemNoteWaterBase: TWideStringField;
    qryPlannerItemNoteStructual: TWideStringField;
    qryPlannerItemInspectionStatusID: TIntegerField;
    qryPlannerItemHRID: TIntegerField;
    qryPlannerItemIsArchived: TBooleanField;
    qryPlannerItemCustSiteID: TIntegerField;
    qryPlannerItemIsEnabled: TBooleanField;
    qryPlannerItemCustomerID: TIntegerField;
    qryPlannerItemSubject: TWideStringField;
    qryPlannerItemRecurrency: TWideStringField;
    qryPlannerItemMinTimeField: TSQLTimeStampField;
    qryPlannerItemMaxTimeField: TSQLTimeStampField;
    qryPlannerItemIsPinned: TBooleanField;
    qryPlannerItemSiteID: TIntegerField;
    qryPlannerItemModifiedOn: TSQLTimeStampField;
    qryPlannerItemModifiedBy: TIntegerField;
    qryPlannerItemStatusStr: TWideStringField;
    qryPlannerItemBookIN: TSQLTimeStampField;
    qryPlannerItemBookOut: TSQLTimeStampField;
    qryPlannerItemNote: TWideStringField;
    qryInspectionOrders: TFDQuery;
    dsInspectionOrders: TDataSource;
    qryPlannerItemCaption: TWideStringField;
    procedure qryPlannerItemNotesGetText(Sender: TField; var Text: string;
        DisplayText: Boolean);
    procedure qryPlannerItemNotesSetText(Sender: TField; const Text: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FES: TFES;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TFES.qryPlannerItemNotesGetText(Sender: TField; var Text: string;
    DisplayText: Boolean);
begin
  Text := Sender.AsString;
end;

procedure TFES.qryPlannerItemNotesSetText(Sender: TField; const Text: string);
begin
  Sender.AsString := Text;
end;

end.
