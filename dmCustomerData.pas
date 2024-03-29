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
    qryCustSiteSiteAddrStr: TWideStringField;
    qryCustContact: TFDQuery;
    dsCustContact: TDataSource;
    qryCustContactCustContactID: TFDAutoIncField;
    qryCustContactCustomerID: TIntegerField;
    qryCustContactHRID: TIntegerField;
    qryCustContactCreatedOn: TSQLTimeStampField;
    qryCustContactFName: TWideStringField;
    qryCustContactContactTypeStr: TWideStringField;
    qryCustContactCaption: TWideStringField;
    qryCustContactIsArchived: TBooleanField;
    qryCustContactSortList: TIntegerField;
    qryCustContactContactTypeID: TIntegerField;
    qryCustInspect: TFDQuery;
    dsCustInspect: TDataSource;
    qryCustInspectInspectionOrderID: TFDAutoIncField;
    qryCustInspectCreatedOn: TSQLTimeStampField;
    qryCustInspectRequestedDT: TSQLTimeStampField;
    qryCustInspectInspectedOn: TSQLTimeStampField;
    qryCustInspectCompletedDT: TSQLTimeStampField;
    qryCustInspectServiceInterval: TFloatField;
    qryCustInspectLevelNum: TIntegerField;
    qryCustInspectNote: TWideStringField;
    qryCustInspectNotePortable: TWideStringField;
    qryCustInspectNoteElectrical: TWideStringField;
    qryCustInspectNoteWaterBase: TWideStringField;
    qryCustInspectNoteStructual: TWideStringField;
    qryCustInspectInspectionStatusID: TIntegerField;
    qryCustInspectHRID: TIntegerField;
    qryCustInspectCustSiteID: TIntegerField;
    qryCustInspectCustomerID: TIntegerField;
    qryCustInspectSiteID: TIntegerField;
    qryCustInspectAddress: TWideStringField;
    qryCustInspectInspectStatusStr: TWideStringField;
    qryCustSurvey: TFDQuery;
    dsCustSurvey: TDataSource;
    qryCustSurveySurveyOrderID: TFDAutoIncField;
    qryCustSurveyCreatedOn: TSQLTimeStampField;
    qryCustSurveyRequestedDT: TSQLTimeStampField;
    qryCustSurveySurveyedOn: TSQLTimeStampField;
    qryCustSurveyCompletedDT: TSQLTimeStampField;
    qryCustSurveyIsArchived: TBooleanField;
    qryCustSurveySurveyStatusID: TIntegerField;
    qryCustSurveyHRID: TIntegerField;
    qryCustSurveyCustSiteID: TIntegerField;
    qryCustSurveyCustomerID: TIntegerField;
    qryCustSurveySiteID: TIntegerField;
    qryCustSurveyAddress: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryCustContactNumCreatedOnGetText(Sender: TField; var Text: string;
        DisplayText: Boolean);
    procedure qryCustomerNoteGetText(Sender: TField; var Text: string; DisplayText:
        Boolean);
    procedure qryCustomerNoteSetText(Sender: TField; const Text: string);
    procedure qryCustSiteNoteGetText(Sender: TField; var Text: string; DisplayText:
        Boolean);
    procedure qryCustSiteNoteSetText(Sender: TField; const Text: string);
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

procedure TCustomerData.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  if Assigned(FES) and FES.fesConnection.Connected then
  begin
    // Assert all queries are active
    qryCustomer.Active := true; // parent
    for i := 0 to Self.ComponentCount - 1 do
    begin
      if Self.Components[i] is TFDQuery then
        if (Self.Components[i].Tag = 1) then  // child
          TFDQuery(Self.Components[i]).Active := True;
    end;
    for i := 0 to Self.ComponentCount - 1 do
    begin
      if Self.Components[i] is TFDQuery then
        if (Self.Components[i].Tag = 2) then  // sub-child
          TFDQuery(Self.Components[i]).Active := True;
    end;
    tblContactNumType.Active := True; // sub-child TFDTable
  end;
end;

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

procedure TCustomerData.qryCustSiteNoteGetText(Sender: TField; var Text:
    string; DisplayText: Boolean);
begin
  Text := Sender.AsString;
end;

procedure TCustomerData.qryCustSiteNoteSetText(Sender: TField; const Text:
    string);
begin
  Sender.AsString := Text;
end;

end.
