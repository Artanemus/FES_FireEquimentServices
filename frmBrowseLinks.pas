unit frmBrowseLinks;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.Buttons, dmFES, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TBrowseLinks = class(TForm)
    Panel1: TPanel;
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    qryBrowseLinks: TFDQuery;
    dsBrowseLinks: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BrowseLinks: TBrowseLinks;

implementation

{$R *.dfm}

end.
