unit frmCustomer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  dmFES, dmCustomerData;

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
    dbtxtCustomerID: TDBText;
    dbtxtCustName: TDBText;
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dbchkboxIsArchived: TDBCheckBox;
    Label1: TLabel;
    dbedtCustName: TDBEdit;
    Label2: TLabel;
    dbedtCustCode: TDBEdit;
    spdbtnGenerateCustCode: TSpeedButton;
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
    procedure qryCustomerNoteGetText(Sender: TField; var Text: string; DisplayText:
        Boolean);
    procedure qryCustomerNoteSetText(Sender: TField; const Text: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Customer: TCustomer;

implementation

{$R *.dfm}

procedure TCustomer.qryCustomerNoteGetText(Sender: TField; var Text: string;
    DisplayText: Boolean);
begin
  //
  if DisplayText then
  begin
    Text := Sender.AsString;
  end;
end;

procedure TCustomer.qryCustomerNoteSetText(Sender: TField; const Text: string);
begin
  Sender.AsString := Text;
end;

end.
