unit dlgUpdateInspectOrders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TUpdateInspectOrders = class(TForm)
    btnUpdate: TButton;
    btnClose: TButton;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateInspectOrders: TUpdateInspectOrders;

implementation

{$R *.dfm}

end.
