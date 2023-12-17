unit dlgCustBatchInspectRpt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.ComCtrls;

type
  TCustBatchInspectRpt = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    DBComboBox1: TDBComboBox;
    Label3: TLabel;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    ComboBox1: TComboBox;
    Label6: TLabel;
    RadioButton2: TRadioButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit3: TEdit;
    Button4: TButton;
    CheckBox1: TCheckBox;
    Label12: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Button5: TButton;
    Button6: TButton;
    Label5: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton11: TSpeedButton;
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    SpeedButton1: TSpeedButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustBatchInspectRpt: TCustBatchInspectRpt;

implementation

{$R *.dfm}

procedure TCustBatchInspectRpt.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  ComboBox1.Clear;
  for i := 1 to 12 do
    ComboBox1.Items.Add(FormatSettings.LongMonthNames[i]);
end;

end.
