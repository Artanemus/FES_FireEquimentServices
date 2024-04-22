unit frameFESCustSurvey;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.VirtualImage, Vcl.ExtCtrls, Vcl.WinXPanels,
  Vcl.ControlList, Vcl.StdCtrls, Vcl.WinXCtrls, dmCustomerData,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Grid, dmFES;

type
  TFESCustSurvey = class(TFrame)
    bindlistCustSurvey: TBindingsList;
    bindsrcCustSurvey: TBindSourceDB;
    btnEditSurvey: TControlListButton;
    btnPinSurvey: TControlListButton;
    ctrllistCustSurvey: TControlList;
    lblSurveyRequestedDT: TLabel;
    lblSurveySiteAddrStr: TLabel;
    lblSurveyTech: TLabel;
    LinkGridToDataSource1: TLinkGridToDataSource;
    LinkPropertyToField1: TLinkPropertyToField;
    LinkPropertyToField2: TLinkPropertyToField;
    LinkPropertyToField3: TLinkPropertyToField;
    StackPanel1: TStackPanel;
    vimgHideUnPinned: TVirtualImage;
    procedure ctrllistCustSurveyBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
        ARect: TRect; AState: TOwnerDrawState);
  end;

implementation

{$R *.dfm}

procedure TFESCustSurvey.ctrllistCustSurveyBeforeDrawItem(AIndex: Integer;
    ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
var
  b: boolean;
begin
  with bindsrcCustSurvey.DataSet do
  begin
    b := FieldByName('IsArchived').AsBoolean;
    if b then btnPinSurvey.ImageIndex := 1
    else btnPinSurvey.ImageIndex := 0;
  end;
end;

end.
