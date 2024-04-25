unit frmHR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls,
  dmFES, Vcl.VirtualImage, Vcl.TitleBarCtrls, Vcl.StdCtrls, dmHRData, Vcl.ComCtrls,
  Vcl.Mask, Vcl.ControlList, Vcl.WinXPanels, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.DBScope, Vcl.Bind.ControlList, Data.Bind.Grid,
  Vcl.WinXCtrls;

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
    lblNotes: TLabel;
    DBLabeledEdit4: TDBLabeledEdit;
    DBLabeledEdit5: TDBLabeledEdit;
    DBLabeledEdit6: TDBLabeledEdit;
    cntrlistNumber: TControlList;
    stackNumber: TStackPanel;
    vimgVisNum: TVirtualImage;
    cntrlistRole: TControlList;
    StackPanel2: TStackPanel;
    vimgVisRole: TVirtualImage;
    cntrlistHREmail: TControlList;
    StackPanel3: TStackPanel;
    vimgVisEmail: TVirtualImage;
    cntrlistHRAddr: TControlList;
    cntrlistCustContact: TControlList;
    cntlistHRSiteZones: TControlList;
    cntrlistHRTimeSheet: TControlList;
    StackPanel7: TStackPanel;
    vimgVisTimeSheet: TVirtualImage;
    bindlistHR: TBindingsList;
    lblNumber: TLabel;
    lblAliasHRNum: TLabel;
    lblCreatedOnNum: TLabel;
    bindsrcNum: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
    btnPinNum: TControlListButton;
    btnEditNum: TControlListButton;
    vimgNewNum: TVirtualImage;
    vimgDeleteNum: TVirtualImage;
    btnUpNum: TControlListButton;
    btnDownNum: TControlListButton;
    VirtualImage2: TVirtualImage;
    VirtualImage8: TVirtualImage;
    lblRole: TLabel;
    bindsrcRole: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB12: TLinkGridToDataSource;
    LinkPropertyToFieldCaption4: TLinkPropertyToField;
    btndownRole: TControlListButton;
    btnUpRole: TControlListButton;
    btnPinRole: TControlListButton;
    btnEditRole: TControlListButton;
    lblCreatedOnRole: TLabel;
    LinkPropertyToFieldCaption5: TLinkPropertyToField;
    vimgNewEmail: TVirtualImage;
    vimgDeleteEmail: TVirtualImage;
    lblCreatedOnEmail: TLabel;
    ControlListButton1: TControlListButton;
    ControlListButton2: TControlListButton;
    ControlListButton3: TControlListButton;
    ControlListButton4: TControlListButton;
    lblHREmail: TLabel;
    vimgCopyEmail: TVirtualImage;
    bindsrcEmail: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB13: TLinkGridToDataSource;
    LinkPropertyToFieldCaption6: TLinkPropertyToField;
    lblHREmailType: TLabel;
    LinkPropertyToFieldCaption7: TLinkPropertyToField;
    StackPanel1: TStackPanel;
    vimgVisAddr: TVirtualImage;
    vimgNewAddr: TVirtualImage;
    vimgDeleteAddr: TVirtualImage;
    vimgCopyAddr: TVirtualImage;
    btnDownAddr: TControlListButton;
    btnUpAddr: TControlListButton;
    btnPinAddr: TControlListButton;
    btnEditAddr: TControlListButton;
    lblHRAddrType: TLabel;
    lblHRAddr: TLabel;
    lblHRAddrCreatedOn: TLabel;
    bindsrcAddr: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB14: TLinkGridToDataSource;
    LinkPropertyToFieldCaption8: TLinkPropertyToField;
    LinkPropertyToFieldCaption9: TLinkPropertyToField;
    LinkPropertyToFieldCaption10: TLinkPropertyToField;
    LinkPropertyToFieldCaption11: TLinkPropertyToField;
    StackPanel4: TStackPanel;
    vimgVisCC: TVirtualImage;
    vimgNewCC: TVirtualImage;
    vimgDeleteCC: TVirtualImage;
    vimgCopyCC: TVirtualImage;
    btnEditCustContact: TControlListButton;
    btnPinCustContact: TControlListButton;
    btnUpCustContact: TControlListButton;
    btnDownCustContact: TControlListButton;
    bindsrcCustContact: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB15: TLinkGridToDataSource;
    lblHRCustContactName: TLabel;
    LinkPropertyToFieldCaption12: TLinkPropertyToField;
    Label1: TLabel;
    Panel4: TPanel;
    RelativePanel1: TRelativePanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    StackPanel5: TStackPanel;
    vimgVisSiteZone: TVirtualImage;
    Label2: TLabel;
    LinkPropertyToFieldCaption13: TLinkPropertyToField;
    bindsrcSiteZone: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB16: TLinkGridToDataSource;
    lblHRSiteZone: TLabel;
    LinkPropertyToFieldCaption14: TLinkPropertyToField;
    lblHRZone: TLabel;
    LinkPropertyToFieldCaption15: TLinkPropertyToField;
    lblInspectOIDTS: TLabel;
    lblSiteAddrTS: TLabel;
    lblStartTS: TLabel;
    lblEndTS: TLabel;
    HeaderControl1: THeaderControl;
    bindsrcTimeSheet: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB17: TLinkGridToDataSource;
    LinkPropertyToFieldCaption16: TLinkPropertyToField;
    LinkPropertyToFieldCaption17: TLinkPropertyToField;
    LinkPropertyToFieldCaption18: TLinkPropertyToField;
    LinkPropertyToFieldCaption19: TLinkPropertyToField;
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
