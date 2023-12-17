program FES;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Main},
  Vcl.Themes,
  Vcl.Styles,
  frmInspectSchedule in 'frmInspectSchedule.pas' {InspectSchedule},
  dlgCompanySetup in 'dlgCompanySetup.pas' {CompanySetup},
  dlgCustBatchInspectRpt in 'dlgCustBatchInspectRpt.pas' {CustBatchInspectRpt},
  pickInspectStatus in 'pickInspectStatus.pas' {InspectStatus},
  dmFES in 'dmFES.pas' {FES: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TFES, FES);
  Application.Run;
end.
