unit frmHR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls,
  dmFES, Vcl.VirtualImage, Vcl.TitleBarCtrls, Vcl.StdCtrls, dmHR, Vcl.ComCtrls,
  Vcl.Mask, Vcl.ControlList, Vcl.WinXPanels, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.DBScope, Vcl.Bind.ControlList, Data.Bind.Grid;

type
  THR = class(TForm)
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    TitleBarPanel1: TTitleBarPanel;
    vimgToggleFilters: TVirtualImage;
    vimgSync: TVirtualImage;
    vimgSetFilters: TVirtualImage;
    vimgFindCustomer: TVirtualImage;
    VirtualImage1: TVirtualImage;
    Panel2: TPanel;
    dbtxtHRID: TDBText;
    dbtxtHRName: TDBText;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBLabeledEdit1: TDBLabeledEdit;
    DBLabeledEdit2: TDBLabeledEdit;
    DBLabeledEdit3: TDBLabeledEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    TabSheet9: TTabSheet;
    DBLabeledEdit4: TDBLabeledEdit;
    DBLabeledEdit5: TDBLabeledEdit;
    DBLabeledEdit6: TDBLabeledEdit;
    ControlList1: TControlList;
    StackPanel1: TStackPanel;
    vimgHideUnPinned: TVirtualImage;
    ControlList2: TControlList;
    StackPanel2: TStackPanel;
    VirtualImage2: TVirtualImage;
    ControlList3: TControlList;
    StackPanel3: TStackPanel;
    VirtualImage3: TVirtualImage;
    ControlList4: TControlList;
    StackPanel4: TStackPanel;
    VirtualImage4: TVirtualImage;
    ControlList5: TControlList;
    StackPanel5: TStackPanel;
    VirtualImage5: TVirtualImage;
    ControlList6: TControlList;
    StackPanel6: TStackPanel;
    VirtualImage6: TVirtualImage;
    ControlList7: TControlList;
    StackPanel7: TStackPanel;
    VirtualImage7: TVirtualImage;
    BindingsList1: TBindingsList;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HR: THR;

implementation

{$R *.dfm}

procedure THR.FormCreate(Sender: TObject);
begin
  CustomTitleBar.Enabled := true;
end;

end.
