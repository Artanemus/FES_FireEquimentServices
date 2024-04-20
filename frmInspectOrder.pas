unit frmInspectOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.VirtualImage, Vcl.WinXPanels, Vcl.TitleBarCtrls,
  dlgFilterCommon, dmInspectOrderData, frameFESTechHours, dmFES;

type
  TInspectOrder = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    DBTextOrderNum: TDBText;
    DBTextInspectionStatus: TDBText;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBText4: TDBText;
    Label10: TLabel;
    DBComboBox1: TDBComboBox;
    Label11: TLabel;
    Label12: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label13: TLabel;
    DBEdit6: TDBEdit;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label15: TLabel;
    DBMemo1: TDBMemo;
    StackPanel1: TStackPanel;
    vimgReport: TVirtualImage;
    vimgArchived: TVirtualImage;
    vimgActive: TVirtualImage;
    vimgPin: TVirtualImage;
    TitleBarPanel1: TTitleBarPanel;
    VirtualImage5: TVirtualImage;
    VirtualImage6: TVirtualImage;
    VirtualImage7: TVirtualImage;
    VirtualImage8: TVirtualImage;
    VirtualImage9: TVirtualImage;
    TabSheet7: TTabSheet;
    DBtxtCustomerName: TDBText;
    DBtxtSiteName: TDBText;
    Label3: TLabel;
    DBtxtModifiedOn: TDBText;
    Label4: TLabel;
    DBtxtModifiedBy: TDBText;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    TitleBarPanel2: TTitleBarPanel;
    VirtualImage1: TVirtualImage;
    vimgFindCustomer: TVirtualImage;
    vimgSetFilters: TVirtualImage;
    vimgToggleFilters: TVirtualImage;
    vimgSync: TVirtualImage;
    Label14: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label21: TLabel;
    DBText3: TDBText;
    DBText5: TDBText;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage4: TVirtualImage;
    VirtualImage10: TVirtualImage;
    StackPanel2: TStackPanel;
    VirtualImage11: TVirtualImage;
    Label5: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    FESTechHours1: TFESTechHours;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fFilterDlg: TFilterCommon;
    FCustFilterState: TFilterState;
    { Metric for OnShow }
    FxHeight: integer;
    FxWidth: integer;
    FxTop: integer;
    FxLeft: integer;
    FxTabIndex: integer;

    procedure ReadPreferences(iniFileName: TFileName);
    procedure WritePreferences(iniFileName: TFileName);

  public
    { Public declarations }
  end;

var
  InspectOrder: TInspectOrder;

const
  DEFINSPECTFORM_HEIGHT = 712;
  DEFINSPECTFORM_WIDTH = 799;

implementation

{$R *.dfm}

uses System.IniFiles, unitFESutility;

procedure TInspectOrder.FormDestroy(Sender: TObject);
var
  iniFileName: TFileName;
begin
  // w r i t e   p r e f e r e n c e s .
  iniFileName := GetFESPreferenceFileName();
  if (FileExists(iniFileName)) then WritePreferences(iniFileName);
  if assigned(fFilterDlg) then fFilterDlg.Free;
end;

procedure TInspectOrder.FormCreate(Sender: TObject);
var
  iniFileName: string;
begin
//  fFilterDlg := nil; // Select filters for customer records
  CustomTitleBar.Enabled := true; // GlassFrame.Top = CustomeTitleBar.Height
  { DEFAULT form metrics }
  FxHeight := DEFINSPECTFORM_HEIGHT;
  FxWidth := DEFINSPECTFORM_WIDTH;
  FxTop := 0;
  FxLeft := 0;
  FxTabIndex := 0;
  // r e a d   p r e f e r e n c e .
  iniFileName := GetFESPreferenceFileName();
  if (FileExists(iniFileName)) then ReadPreferences(iniFileName);
end;

procedure TInspectOrder.FormHide(Sender: TObject);
begin
  FxHeight  := Height;
  fxWidth := Width;
  FxTabIndex := PageControl1.ActivePageIndex;
end;

procedure TInspectOrder.FormShow(Sender: TObject);
begin
  Height := FxHeight;
  Width := fxWidth;
  PageControl1.ActivePageIndex := FxTabIndex;
end;

procedure TInspectOrder.ReadPreferences(iniFileName: TFileName);
var
  iFile: TIniFile;
begin
  iFile := TIniFile.Create(iniFileName);
  FxWidth := iFile.ReadInteger('InspectOrderPref', 'Width', DEFINSPECTFORM_WIDTH);
  FxHeight := iFile.ReadInteger('InspectOrderPref', 'Height', DEFINSPECTFORM_HEIGHT);
  FxTop := iFile.ReadInteger('InspectOrderPref', 'Top', 0);
  FxLeft:= iFile.ReadInteger('InspectOrderPref', 'Left', 0);
  FxTabIndex := iFile.ReadInteger('InspectOrderPref', 'TabIndex', 0);
  iFile.free;
end;

procedure TInspectOrder.WritePreferences(iniFileName: TFileName);
var
  iFile: TIniFile;
begin
  iFile := TIniFile.Create(IniFileName);
  iFile.WriteInteger('InspectOrderPref', 'Width', Width);
  iFile.WriteInteger('InspectOrderPref', 'Height', Height);
  iFile.WriteInteger('InspectOrderPref', 'Top', Top);
  iFile.WriteInteger('InspectOrderPref', 'Left', Left);
  iFile.WriteInteger('InspectOrderPref', 'TabIndex', PageControl1.ActivePageIndex);
 	iFile.free;
end;

end.
