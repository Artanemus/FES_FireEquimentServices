unit dlgOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Data.DB, Vcl.Grids, Vcl.DBGrids, dmFES,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.WinXCtrls, Vcl.DBCtrls, Vcl.Buttons;

type
  TOptions = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Edit3: TEdit;
    Button4: TButton;
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    TabSheet3: TTabSheet;
    Label4: TLabel;
    Edit4: TEdit;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RelativePanel1: TRelativePanel;
    qryEquipmentType: TFDQuery;
    dsEquipmentType: TDataSource;
    qryEquipmentTypeEquipTypeID: TFDAutoIncField;
    qryEquipmentTypeCaption: TWideStringField;
    qryEquipmentTypeShortCaption: TWideStringField;
    qryEquipmentTypeMinorLifeCycle: TFloatField;
    qryEquipmentTypeMajorLifeCycle: TFloatField;
    qryEquipmentTypeNumOfLevels: TIntegerField;
    qryEquipmentTypeServiceInterval: TFloatField;
    qryEquipmentTypeCoreGroupID: TIntegerField;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    Label5: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    ComboBox1: TComboBox;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    SpeedButton1: TSpeedButton;
    VirtualImageList2: TVirtualImageList;
    SpeedButton2: TSpeedButton;
    BalloonHint1: TBalloonHint;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Options: TOptions;

implementation

{$R *.dfm}

end.
