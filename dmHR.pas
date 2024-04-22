unit dmHR;

interface

uses
  System.SysUtils, System.Classes, dmFES, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus;

type
  THRData = class(TDataModule)
    qryHR: TFDQuery;
    dsHR: TDataSource;
    qryRoleList: TFDQuery;
    qryRole: TFDQuery;
    dsRoleList: TDataSource;
    dsRole: TDataSource;
    qryEmergencyHR: TFDQuery;
    dsEmergencyHR: TDataSource;
    pumenuHRCommon: TPopupMenu;
    puEdit: TMenuItem;
    puInsert: TMenuItem;
    puDelete: TMenuItem;
    N1: TMenuItem;
    puPin: TMenuItem;
    puFilter: TMenuItem;
    puRefresh: TMenuItem;
    qryHRNumber: TFDQuery;
    dsHRNumber: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HRData: THRData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
