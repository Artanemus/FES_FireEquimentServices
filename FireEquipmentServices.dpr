program FireEquipmentServices;

uses
  Vcl.Forms,
  frmFESMain in 'frmFESMain.pas' {FESMain},
  Vcl.Themes,
  Vcl.Styles,
  frmInspectSchedule in 'frmInspectSchedule.pas' {InspectSchedule},
  dlgCompanySetup in 'dlgCompanySetup.pas' {CompanySetup},
  dlgCustBatchInspectRpt in 'dlgCustBatchInspectRpt.pas' {CustBatchInspectRpt},
  pickInspectStatus in 'pickInspectStatus.pas' {InspectStatus},
  dmFES in 'dmFES.pas' {FES: TDataModule},
  dlgInspectOrdersUpdate in 'dlgInspectOrdersUpdate.pas' {UpdateInspectOrders},
  dlgInspectOrdersFind in 'dlgInspectOrdersFind.pas' {FindInspectOrders},
  frmInspectOrders in 'frmInspectOrders.pas' {InspectOrders},
  frmCustomer in 'frmCustomer.pas' {Customer},
  pickCustomerFilter in 'pickCustomerFilter.pas' {CustomerFilter},
  pickHRFilter in 'pickHRFilter.pas' {HRFilter},
  pickPostcode in 'pickPostcode.pas' {Postcode},
  pickSuburb in 'pickSuburb.pas' {Suburb},
  dlgOptions in 'dlgOptions.pas' {Options},
  unitSMTP in 'unitSMTP.pas',
  frmEquipment in 'frmEquipment.pas' {Equipment},
  frmBrowseLinks in 'frmBrowseLinks.pas' {BrowseLinks},
  frameFESPlanner in 'frameFESPlanner.pas' {FESPlanner: TFrame},
  dmCustomerData in 'dmCustomerData.pas' {CustomerData: TDataModule},
  frmFESButtons in 'frmFESButtons.pas' {FESButtons},
  unitFEStools in 'unitFEStools.pas',
  dlgCustFilter in 'dlgCustFilter.pas' {CustFilter},
  unitFESDefines in 'unitFESDefines.pas',
  unitFESutility in 'unitFESutility.pas',
  unitFESHelpers in 'unitFESHelpers.pas',
  frameFESCustAddress in 'frameFESCustAddress.pas' {FESCustAddress: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TFESMain, FESMain);
  Application.CreateForm(TFES, FES);
  Application.CreateForm(TCustomerData, CustomerData);
  Application.Run;
end.
