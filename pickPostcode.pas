unit pickPostcode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmFES, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.Buttons;

type
  TPostcode = class(TForm)
    Panel1: TPanel;
    btnOk: TButton;
    qryPostcode: TFDQuery;
    dsPostcode: TDataSource;
    DBGrid1: TDBGrid;
    qryPostcodePostcodeID: TFDAutoIncField;
    qryPostcodePostcode: TIntegerField;
    qryPostcodeSuburb: TWideStringField;
    qryPostcodeZone: TWideStringField;
    Panel2: TPanel;
    ImageCollection1: TImageCollection;
    Label1: TLabel;
    Edit1: TEdit;
    VirtualImageList1: TVirtualImageList;
    SpeedButton3: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Postcode: TPostcode;

implementation

{$R *.dfm}

end.
