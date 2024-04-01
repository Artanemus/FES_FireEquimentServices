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
    qryCustNum: TFDQuery;
    dsCustNum: TDataSource;
    qryCustAddress: TFDQuery;
    dsCustAdress: TDataSource;
    qryCustEmails: TFDQuery;
    dsCustEmails: TDataSource;
    qryCustSite: TFDQuery;
    dsCustSite: TDataSource;
    qryCustContact: TFDQuery;
    dsCustContact: TDataSource;
    qryCustInspect: TFDQuery;
    dsCustInspect: TDataSource;
    qryCustSurvey: TFDQuery;
    dsCustSurvey: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryCustNumCreatedOnGetText(Sender: TField; var Text: string;
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
  end;
end;

procedure TCustomerData.qryCustNumCreatedOnGetText(Sender: TField; var
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
