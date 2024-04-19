unit frameFESPlanner;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Planner, DBPlanner,
  dmFES, dmCustomerData
  ;

type
  TFESPlanner = class(TFrame)
    PLANNER: TDBPlanner;
    DAYSRC: TDBDaySource;
    procedure DAYSRCFieldsToItem(Sender: TObject; Fields: TFields; Item:
        TPlannerItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFESPlanner.DAYSRCFieldsToItem(Sender: TObject; Fields: TFields;
    Item: TPlannerItem);
begin
  Item.TrackColor := Fields.FieldByName('TMSTrackColor').AsInteger;
//  Item.TrackSelectColor := Fields.FieldByName('TMSSelectedTrackColor').AsInteger;
//  Item.Color := Fields.FieldByName('TMSColor').AsInteger;
//  Item.SelectColor := Fields.FieldByName('TMSSelectedColor').AsInteger;
//  Item.CaptionBkg := Fields.FieldByName('TMSCaptionColor').AsInteger;
//  Item.SelectCaptionBkg := Fields.FieldByName('TMSSelectedCaptionColor').AsInteger;

end;

end.
