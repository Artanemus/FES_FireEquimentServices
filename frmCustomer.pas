unit frmCustomer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, dmFES,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCGrids;

type
  TCustomer = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    DBText2: TDBText;
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    SpeedButton3: TSpeedButton;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    DBNavigator2: TDBNavigator;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBCtrlGrid1: TDBCtrlGrid;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBCheckBox2: TDBCheckBox;
    DBMemo2: TDBMemo;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBNavigator3: TDBNavigator;
    DBComboBox1: TDBComboBox;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label10: TLabel;
    DBText6: TDBText;
    DBGrid2: TDBGrid;
    DBNavigator4: TDBNavigator;
    DBGrid3: TDBGrid;
    DBNavigator5: TDBNavigator;
    DBGrid4: TDBGrid;
    DBNavigator6: TDBNavigator;
    DBGrid5: TDBGrid;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Customer: TCustomer;

implementation

{$R *.dfm}

end.
