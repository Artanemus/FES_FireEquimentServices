program FireEquipmentServices;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Main},
  Vcl.Themes,
  Vcl.Styles,
  frmInspectSchedule in 'frmInspectSchedule.pas' {InspectSchedule},
  dlgCompanySetup in 'dlgCompanySetup.pas' {CompanySetup},
  dlgCustBatchInspectRpt in 'dlgCustBatchInspectRpt.pas' {CustBatchInspectRpt},
  pickInspectStatus in 'pickInspectStatus.pas' {InspectStatus},
  dmFES in 'dmFES.pas' {FES: TDataModule},
  dlgUpdateInspectOrders in 'dlgUpdateInspectOrders.pas' {UpdateInspectOrders},
  dlgFindInspectOrders in 'dlgFindInspectOrders.pas' {FindInspectOrders},
  frmInspectOrders in 'frmInspectOrders.pas' {InspectOrders},
  frmCustomer in 'frmCustomer.pas' {Customer},
  pickCustomerFilter in 'pickCustomerFilter.pas' {CustomerFilter},
  pickHRFilter in 'pickHRFilter.pas' {HRFilter},
  pickPostcode in 'pickPostcode.pas' {Postcode},
  pickSuburb in 'pickSuburb.pas' {Suburb},
  dlgOptions in 'dlgOptions.pas' {Options},
  unitSMTP in 'unitSMTP.pas',
  frmEquipment in 'frmEquipment.pas' {Equipment},
  frmBrowseLinks in 'frmBrowseLinks.pas' {BrowseLinks};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TFES, FES);
  Application.Run;
end.
