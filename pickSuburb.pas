unit pickSuburb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.BaseImageCollection, Vcl.ImageCollection, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  TSuburb = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    SpeedButton3: TSpeedButton;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnOk: TButton;
    qrySuburb: TFDQuery;
    qrySuburbPostcodeID: TFDAutoIncField;
    qrySuburbPostcode: TIntegerField;
    qrySuburbSuburb: TWideStringField;
    qrySuburbZone: TWideStringField;
    dsSuburb: TDataSource;
    VirtualImageList1: TVirtualImageList;
    ImageCollection1: TImageCollection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Suburb: TSuburb;

implementation

{$R *.dfm}

end.
