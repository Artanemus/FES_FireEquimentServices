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
  dmFES, dmCustomerData, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, dlgCustFilter, unitFESDefines;

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
    spdbtnFilter: TSpeedButton;
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
    SpeedButton3: TSpeedButton;
    actnmanCustomer: TActionManager;
    actnGenerateCustCode: TAction;
    actnFilterSelect: TAction;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCmbBoxAddressType: TDBComboBox;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actnFilterSelectExecute(Sender: TObject);
    procedure actnGenerateCustCodeExecute(Sender: TObject);
    procedure DBCmbBoxAddressTypeChange(Sender: TObject);
  private
    { Private declarations }
    fFilterDlg: TCustFilter;
    fHideArchived: Boolean;
    fHideInActive: Boolean;
//    fHideLinked: Boolean;

  protected
    procedure FilterDlgUpdated(var Msg: TMessage); message FES_FILTERUPDATED;
    procedure FilterDlgDeactivated(var Msg: TMessage); message FES_FILTERDEACTIVATED;

  public
    { Public declarations }
  end;

var
  Customer: TCustomer;

implementation

{$R *.dfm}

uses unitFEStools;


procedure TCustomer.FormDestroy(Sender: TObject);
begin
//  WritePreferences;
  if assigned(fFilterDlg) then fFilterDlg.Free;
end;

procedure TCustomer.FilterDlgDeactivated(var Msg: TMessage);
begin
  if assigned(fFilterDlg) then FreeAndNil(fFilterDlg);
end;

procedure TCustomer.FilterDlgUpdated(var Msg: TMessage);
var
  CopyData: PCopyDataStruct;
  FilterState: PFilterState;
begin
  if Msg.LParam = 0 then exit;
  try
    begin
      CopyData := PCopyDataStruct(Msg.LParam);
      FilterState := PFilterState(CopyData^.lpData);
      // access the fields of the record
      fHideArchived := FilterState^.HideArchived;
      fHideInActive := FilterState^.HideInActive;
//      fHideTBA := FilterState^.HideTBA;
//      fDateStart := FilterState^.DateStart;
//      fDateEnd := FilterState^.DateEnd;
    end
  finally
    begin
//      CustomerData.UpdateCustFilter(fID, fHideArchived, fHideInActive,
//        fHideTBA, fDateStart, fDateEnd);

      actnFilterSelect.Caption := 'Filter (' +
        IntToStr(CustomerData.dsCustomer.DataSet.RecordCount) + ')';
    end;
  end;
end;

procedure TCustomer.FormCreate(Sender: TObject);
begin
  fFilterDlg := nil;
  // assign the list items for field AddressTypeID in TDBCtrlGrid
  DBCmbBoxAddressType.Clear;
  {TODO -oBSA -cGeneral : Check DB up and running}
  if Assigned(CustomerData) and CustomerData.dsCustomer.DataSet.Active then
  begin
    CustomerData.dsAddressType.DataSet.First;
    while not CustomerData.dsAddressType.DataSet.Eof do
    begin
      DBCmbBoxAddressType.Items.Add(CustomerData.dsAddressType.DataSet.FieldByName('AliasCust').AsString);
      CustomerData.dsAddressType.DataSet.Next;
    end;
  end;

end;

procedure TCustomer.actnFilterSelectExecute(Sender: TObject);
var
  aRect: TRect;
begin
  // double tap on btnFilter

  if assigned(fFilterDlg) then
  begin
    FreeAndNil(fFilterDlg);
    exit;
  end;

//  WritePreferences;

  fFilterDlg := TCustFilter.Create(Self);
  fFilterDlg.Position := poDesigned;
  aRect := spdbtnFilter.ClientToScreen(spdbtnFilter.ClientRect);
  fFilterDlg.Left := aRect.Left;
  fFilterDlg.Top := aRect.Bottom + 1;
  fFilterDlg.Show;
end;

procedure TCustomer.actnGenerateCustCodeExecute(Sender: TObject);
var
s: string;
begin
  if Assigned(CustomerData) and CustomerData.dsCustomer.DataSet.Active then
  begin
    s := GenerateCustomerCode(CustomerData.dsCustomer.DataSet.FieldByName('CustName').AsString);
    if CustomerData.dsCustomer.DataSet.State = dsBrowse then
      CustomerData.dsCustomer.DataSet.Edit;
    CustomerData.dsCustomer.DataSet.FieldByName('CustCode').AsString := s;
  end;
end;

procedure TCustomer.DBCmbBoxAddressTypeChange(Sender: TObject);
//var
//  s: string;
//  SearchOptions: TLocateOptions;
//  result: boolean;
begin
//  if DBCtrlGrid1.DataSource.DataSet.State = dsEdit then
//  begin
//    s := DBCmbBoxAddressType.Text;
//    s := DBCmbBoxAddressType.Items[DBCmbBoxAddressType.ItemIndex];
//    result := false;
//    SearchOptions := [];
//    if CustomerData.dsAddressType.DataSet.Active then
//    begin
//        result := CustomerData.dsAddressType.DataSet.Locate('AliasCust', s, SearchOptions);
//        if result then
//        begin
//          DBCtrlGrid1.DataSource.DataSet.FieldByName('AddressTypeID').AsInteger :=
//          CustomerData.dsAddressType.DataSet.FieldByName('AddressTypeID').AsInteger;
//        end;
//
//    end;
//  end;
end;

end.
