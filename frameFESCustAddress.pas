unit frameFESCustAddress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.ControlList, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.VirtualImageList, dmCustomerData, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Vcl.Bind.ControlList, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Grid, Data.Bind.DBScope,
  Vcl.StdCtrls, Data.DB;

type
  TFESCustAddress = class(TFrame)
    imgcollCustBusNum: TImageCollection;
    ctrllistCustBusNum: TControlList;
    ctrllistbtnEdit: TControlListButton;
    ctrllistbtnPin: TControlListButton;
    vimglistCustBusNum: TVirtualImageList;
    pumenuCustBusNum: TPopupMenu;
    puInsert: TMenuItem;
    puEdit: TMenuItem;
    puDelete: TMenuItem;
    N1: TMenuItem;
    puRefresh: TMenuItem;
    puPin: TMenuItem;
    puFilter: TMenuItem;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    lblAddress: TLabel;
    lblAddressType: TLabel;
    lblZone: TLabel;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
    procedure ctrllistbtnEditClick(Sender: TObject);
    procedure ctrllistbtnPinClick(Sender: TObject);
    procedure ctrllistCustBusNumBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
        ARect: TRect; AState: TOwnerDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFESCustAddress.ctrllistbtnEditClick(Sender: TObject);
begin
  // open dialogue to edit Customer's Business Number
end;

procedure TFESCustAddress.ctrllistbtnPinClick(Sender: TObject);
var
  b: boolean;
begin
  with BindSourceDB1.DataSet do
  begin
    b := FieldByName('IsArchived').AsBoolean;
    b := not b;
    if (BindSourceDB1.DataSet.State <> dsEdit) then
      BindSourceDB1.DataSet.Edit;
    if (BindSourceDB1.DataSet.State = dsEdit) then
    begin
      BindSourceDB1.DataSet.FieldByName('IsArchived').AsBoolean := b;
      BindSourceDB1.DataSet.Post;
    end;
  end;
end;

procedure TFESCustAddress.ctrllistCustBusNumBeforeDrawItem(AIndex: Integer; ACanvas:
    TCanvas; ARect: TRect; AState: TOwnerDrawState);
var
  b: boolean;
begin
  with BindSourceDB1.DataSet do
  begin
    b := FieldByName('IsArchived').AsBoolean;
    if b then ctrllistbtnPin.ImageIndex := 1
    else ctrllistbtnPin.ImageIndex := 0;
  end;
end;

end.
