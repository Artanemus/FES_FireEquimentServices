unit frmInspectOrders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TInspectOrders = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    SpeedButton1: TSpeedButton;
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Label7: TLabel;
    Label45: TLabel;
    Button6: TButton;
    Button33: TButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
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
    Label14: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label15: TLabel;
    DBMemo1: TDBMemo;
    SpeedButton7: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Shape1: TShape;
    Shape2: TShape;
    Label16: TLabel;
    DBMemo2: TDBMemo;
    Label17: TLabel;
    DBGrid4: TDBGrid;
    SpeedButton8: TSpeedButton;
    Label1: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InspectOrders: TInspectOrders;

implementation

{$R *.dfm}

end.
