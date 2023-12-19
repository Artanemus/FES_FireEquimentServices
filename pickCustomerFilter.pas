unit pickCustomerFilter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.CheckLst;

type
  TCustomerFilter = class(TForm)
    CheckListBox1: TCheckListBox;
    Panel1: TPanel;
    btnOk: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerFilter: TCustomerFilter;

implementation

{$R *.dfm}

end.
