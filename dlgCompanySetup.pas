unit dlgCompanySetup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.VirtualImage,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtDlgs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client ;

type
  TCompanySetup = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    TabSheet4: TTabSheet;
    VirtualImage1: TVirtualImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Bevel1: TBevel;
    Label13: TLabel;
    DBMemo2: TDBMemo;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    Bevel2: TBevel;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    Bevel3: TBevel;
    Label22: TLabel;
    btnLoadClubLogo: TButton;
    btnClearClubLogo: TButton;
    btnSaveClubLogo: TButton;
    DBImage1: TDBImage;
    SavePictureDialog1: TSavePictureDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    btnClose: TButton;
    qryCompanyInfo: TFDQuery;
    dsCompanyInfo: TDataSource;
    procedure btnClearClubLogoClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnLoadClubLogoClick(Sender: TObject);
    procedure btnSaveClubLogoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
  private
    { Private declarations }
    FConnection: TFDConnection;
//    procedure WritePreferences(IniFileName: string);
//    procedure ReadPreferences(IniFileName: string);

  public
    { Public declarations }
    property Connection: TFDConnection read FConnection write FConnection;

  end;

var
  CompanySetup: TCompanySetup;

implementation

{$R *.dfm}

procedure TCompanySetup.btnClearClubLogoClick(Sender: TObject);
begin
  if (Assigned(FConnection) and (qryCompanyInfo.Active)) then
  begin
    qryCompanyInfo.Edit;
    qryCompanyInfo.FieldByName('LogoDir').Clear;
    qryCompanyInfo.FieldByName('LogoImg').Clear;
    qryCompanyInfo.FieldByName('LogoType').Clear;
    qryCompanyInfo.Post;
  end;
end;

procedure TCompanySetup.btnCloseClick(Sender: TObject);
begin
  // w r i t e   o u t   d a t a b a s e   c h a n g e s .
  if (Assigned(FConnection)) and (qryCompanyInfo.Active) then
  begin
    qryCompanyInfo.CheckBrowseMode;
    qryCompanyInfo.Close;
  end;

  ModalResult := mrOk;
end;

procedure TCompanySetup.btnLoadClubLogoClick(Sender: TObject);
var
  s: string;
  FileStream: TFileStream;
  BlobStream: TStream;
begin

  // NOTE: TOpenPictureDialog.options - ofPathMustExist, ofFileMustExist.
  if (OpenPictureDialog1.Execute) then
  begin
    qryCompanyInfo.Edit;
    try
      // part 1 : deal with the blob  - .png, .bmp, .jpeg, .jpg
      // qryCompanyInfo.FieldByName('LogoImg').Clear;

      BlobStream := qryCompanyInfo.CreateBlobStream
        (qryCompanyInfo.FieldByName('LogoImg'), bmWrite);
      FileStream := TFileStream.Create(OpenPictureDialog1.FileName,
        fmOpenRead or fmShareDenyNone);
      BlobStream.CopyFrom(FileStream, FileStream.Size);
      FileStream.free;
      BlobStream.free;
      // part 2 : directory info and image type
      // the filename is used to identify the graphic type.
      qryCompanyInfo.FieldByName('LogoDir').AsString :=
        OpenPictureDialog1.FileName;
      s := ExtractFileExt(OpenPictureDialog1.FileName);
      s := LowerCase(s);
      qryCompanyInfo.FieldByName('LogoType').AsString := s;
      qryCompanyInfo.Post;
    except
      qryCompanyInfo.Cancel;
    end;

    // (qryCompanyInfo.FieldByName('LogoImg') as TBlobField)
    // .LoadFromFile(OpenPictureDialog1.FileName);

    // Display the new logo into the UI
    // AssignClubLogoToImage(LogoImage);
  end;
end;

procedure TCompanySetup.btnSaveClubLogoClick(Sender: TObject);
var
  FileStream: TFileStream;
  BlobStream: TStream;
begin
  // test table is connected and open
  if not(qryCompanyInfo.Active) then
    exit;
  if (SavePictureDialog1.Execute) then
  begin
    FileStream := TFileStream.Create(SavePictureDialog1.FileName, fmCreate);
    BlobStream := qryCompanyInfo.CreateBlobStream
      (qryCompanyInfo.FieldByName('LogoImg'), bmRead);
    FileStream.CopyFrom(BlobStream, BlobStream.Size);
    BlobStream.free;
    FileStream.free;
  end;
end;

procedure TCompanySetup.FormCreate(Sender: TObject);
begin
  FConnection := nil;
end;

procedure TCompanySetup.PageControl1Changing(Sender: TObject; var AllowChange:
    Boolean);
begin
  if (Assigned(FConnection) and (qryCompanyInfo.Active)) then
  begin
//    if (PageControl1.TabIndex = 0) or (PageControl1.TabIndex = 1) then
      qryCompanyInfo.CheckBrowseMode;
  end;
  AllowChange := true;
end;



end.
