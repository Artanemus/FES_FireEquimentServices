unit dmCustomerData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmFES;

type
  TCustomerData = class(TDataModule)
    qryCustomer: TFDQuery;
    qryCustomerCustomerID: TFDAutoIncField;
    qryCustomerCustName: TWideStringField;
    qryCustomerCustCode: TWideStringField;
    qryCustomerMYOBID: TIntegerField;
    qryCustomerNote: TMemoField;
    qryCustomerCreatedBy: TIntegerField;
    qryCustomerCreatedOn: TSQLTimeStampField;
    qryCustomerModifiedBy: TIntegerField;
    qryCustomerModifiedOn: TSQLTimeStampField;
    qryCustomerIsArchived: TBooleanField;
    dsCustomer: TDataSource;
    qryCustContactNum: TFDQuery;
    dsCustContactNum: TDataSource;
    qryCustContactNumCustContactNumID: TFDAutoIncField;
    qryCustContactNumCustomerID: TIntegerField;
    qryCustContactNumContactNum: TWideStringField;
    qryCustContactNumCreatedOn: TSQLTimeStampField;
    qryCustContactNumIsArchived: TBooleanField;
    qryCustContactNumContactNumTypeID: TIntegerField;
    tblContactNumType: TFDTable;
    dsContactNumType: TDataSource;
    qryCustContactNumluContactNumType: TStringField;
    qryCustAddress: TFDQuery;
    dsCustAdress: TDataSource;
    dsAddressType: TDataSource;
    qryAddressType: TFDQuery;
    qryCustAddressCustAddressID: TFDAutoIncField;
    qryCustAddressCustomerID: TIntegerField;
    qryCustAddressAddressTypeID: TIntegerField;
    qryCustAddressPostcodeID: TIntegerField;
    qryCustAddressAddress: TWideStringField;
    qryCustAddressCreatedOn: TSQLTimeStampField;
    qryCustAddressIsArchived: TBooleanField;
    qryCustAddressluAddressType: TStringField;
    qryCustAddressPostCode: TIntegerField;
    qryCustAddressSuburb: TWideStringField;
    qryCustAddressState: TWideStringField;
    qryCustAddressZone: TWideStringField;
    qryCustEmails: TFDQuery;
    dsCustEmails: TDataSource;
    dsEmailType: TDataSource;
    qryCustEmailsCustEmailID: TFDAutoIncField;
    qryCustEmailsCustomerID: TIntegerField;
    qryCustEmailsEmail: TWideStringField;
    qryCustEmailsCreatedOn: TSQLTimeStampField;
    qryCustEmailsIsArchived: TBooleanField;
    qryCustEmailsEmailTypeID: TIntegerField;
    qryCustEmailsluEmailType: TStringField;
    qryEmailType: TFDQuery;
    qryCustSite: TFDQuery;
    dsCustSite: TDataSource;
    qryCustSiteCustSiteID: TFDAutoIncField;
    qryCustSiteCustomerID: TIntegerField;
    qryCustSiteSiteID: TIntegerField;
    qryCustSiteCreatedOn: TSQLTimeStampField;
    qryCustSiteIsArchived: TBooleanField;
    qryCustSiteIsEnabled: TBooleanField;
    qryCustSiteSiteContactID: TIntegerField;
    qryCustSiteNote: TMemoField;
    qryCustSiteSeedDate: TSQLTimeStampField;
    qryCustSiteSeedLevel: TIntegerField;
    qryCustSiteDoReseed: TBooleanField;
    procedure qryCustContactNumCreatedOnGetText(Sender: TField; var Text: string;
        DisplayText: Boolean);
    procedure qryCustomerNoteGetText(Sender: TField; var Text: string; DisplayText:
        Boolean);
    procedure qryCustomerNoteSetText(Sender: TField; const Text: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerData: TCustomerData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TCustomerData.qryCustContactNumCreatedOnGetText(Sender: TField; var
    Text: string; DisplayText: Boolean);
var
FormatSettings: TFormatSettings;
begin
  // Get the current locale format settings
  FormatSettings := TFormatSettings.Create;
  // Format the local time as a string using the short date format
  Text := FormatDateTime(FormatSettings.ShortDateFormat, Sender.AsDateTime);
end;

procedure TCustomerData.qryCustomerNoteGetText(Sender: TField; var Text:
    string; DisplayText: Boolean);
begin
  Text := Sender.AsString;
end;

procedure TCustomerData.qryCustomerNoteSetText(Sender: TField; const Text:
    string);
begin
  Sender.AsString := Text;
end;

end.
