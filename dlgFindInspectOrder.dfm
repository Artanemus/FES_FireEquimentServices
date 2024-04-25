object FindInspectOrders: TFindInspectOrders
  Left = 0
  Top = 0
  Caption = 'Find Inspection Order'
  ClientHeight = 847
  ClientWidth = 889
  Color = clBtnFace
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Height = 34
  CustomTitleBar.SystemHeight = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Top = 34
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 34
    Width = 889
    Height = 39
    Align = alTop
    BevelEdges = [beBottom]
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 9
      Width = 75
      Height = 21
      Alignment = taRightJustify
      Caption = ' Search for'
    end
    object edtSearch: TEdit
      Left = 92
      Top = 6
      Width = 333
      Height = 29
      Hint = 'Enter customer name,  address, site address, ID, etc.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'edtSearch'
    end
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 889
    Height = 34
    CustomButtons = <>
    object vimgToggleFilters: TVirtualImage
      AlignWithMargins = True
      Left = 599
      Top = 0
      Width = 32
      Height = 34
      Hint = 'Toggle Filters ON/OFF'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 73
      ImageName = 'filter\filter_off'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 485
      ExplicitHeight = 30
    end
    object vimgSync: TVirtualImage
      AlignWithMargins = True
      Left = 707
      Top = 0
      Width = 32
      Height = 34
      Hint = 'Syncronize and refresh.'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 150
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 43
      ImageName = 'Sync'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
      ExplicitHeight = 40
    end
    object vimgFilterCommon: TVirtualImage
      Tag = 1
      AlignWithMargins = True
      Left = 527
      Top = 0
      Width = 32
      Height = 34
      Hint = 'Set Filters'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 69
      ImageName = 'filter\arrow_drop_down_circle'
      ParentShowHint = False
      ShowHint = True
      OnClick = vimgFilterCommonClick
      ExplicitLeft = 507
    end
    object vimgFindCustomer: TVirtualImage
      AlignWithMargins = True
      Left = 635
      Top = 0
      Width = 32
      Height = 34
      Hint = 'Find a customer'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 41
      ImageName = 'record\search'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 537
      ExplicitHeight = 30
    end
    object VirtualImage5: TVirtualImage
      AlignWithMargins = True
      Left = 671
      Top = 0
      Width = 32
      Height = 34
      Hint = 'Goto customer ID or CODE'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 55
      ImageName = 'goto'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
      ExplicitHeight = 39
    end
    object vimgFilterStatus: TVirtualImage
      Tag = 2
      AlignWithMargins = True
      Left = 563
      Top = 0
      Width = 32
      Height = 34
      Hint = 'Set Filters'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 69
      ImageName = 'filter\arrow_drop_down_circle'
      ParentShowHint = False
      ShowHint = True
      OnClick = vimgFilterStatusClick
      ExplicitLeft = 429
      ExplicitHeight = 30
    end
  end
  object ControlList1: TControlList
    Left = 0
    Top = 73
    Width = 889
    Height = 774
    Align = alClient
    ItemCount = 136
    ItemHeight = 50
    ItemIndex = 0
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    TabOrder = 2
    OnBeforeDrawItem = ControlList1BeforeDrawItem
    object lblStatusStr: TLabel
      AlignWithMargins = True
      Left = 25
      Top = 3
      Width = 104
      Height = 44
      Margins.Left = 10
      Align = alLeft
      AutoSize = False
      Caption = 'Action'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 49
    end
    object Shape1: TShape
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 9
      Height = 44
      Align = alLeft
      Brush.Color = 16744703
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 100
    end
    object btnEdit: TControlListButton
      Left = 791
      Top = 0
      Width = 32
      Height = 50
      Hint = 'Edit inpection order.'
      Align = alRight
      ParentShowHint = False
      ShowHint = True
      Images = FES.imgList32x32
      ImageIndex = 13
      ImageName = 'edit'
      Style = clbkToolButton
      ExplicitLeft = 761
      ExplicitTop = 12
      ExplicitHeight = 32
    end
    object btnIsEnabled: TControlListButton
      AlignWithMargins = True
      Left = 826
      Top = 3
      Width = 32
      Height = 44
      Hint = 'Link Status'
      Margins.Right = 10
      Align = alRight
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      Images = FES.imgList32x32
      ImageIndex = 22
      ImageName = 'checked_box'
      Style = clbkToolButton
      ExplicitLeft = 723
      ExplicitTop = 12
      ExplicitHeight = 32
    end
    object lblBookIN: TLabel
      AlignWithMargins = True
      Left = 142
      Top = 3
      Width = 75
      Height = 44
      Margins.Left = 10
      Margins.Right = 4
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = 'Jul 02, 2022  09:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object HTMLabel1: THTMLabel
      AlignWithMargins = True
      Left = 227
      Top = 3
      Width = 561
      Height = 44
      Margins.Left = 6
      Align = alClient
      BorderColor = 15987699
      Color = 15987699
      HTMLText.Strings = (
        
          '<B>Tivoli Gardens  - The Body Corporate 2036</B><BR><FONT color=' +
          '"clgrey"><IND x="20">56 A Moores Pocket Rd TIVOLI, QLD 4305</FON' +
          'T>')
      ParentColor = False
      Transparent = True
      Version = '2.3.0.0'
      ExplicitLeft = 240
      ExplicitTop = 4
      ExplicitWidth = 537
      ExplicitHeight = 53
    end
    object lblCustCode: TLabel
      Left = 25
      Top = 24
      Width = 4
      Height = 21
    end
  end
  object qryFindInspectOrder: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Active = True
    Connection = FES.fesConnection
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime, fvFmtDisplayDate]
    FormatOptions.FmtDisplayDateTime = 'yy-mm-dd hhnn'
    SQL.Strings = (
      ''
      'SELECT dbo.InspectionOrder.InspectionOrderID,'
      '       dbo.InspectionOrder.CreatedOn,'
      '       dbo.InspectionOrder.CustomerID,'
      '       dbo.Customer.CustCode,'
      '       dbo.InspectionOrder.SiteID,'
      '       dbo.CustSite.IsEnabled,'
      '    dbo.InspectionStatus.TMSTrackColor,'
      '       dbo.InspectionOrder.BookIN,'
      '       dbo.InspectionOrder.BookOUT,'
      '       dbo.InspectionStatus.Caption AS StatusStr,'
      ''
      '       CONCAT('#39'CUST: '#39', dbo.Customer.CustName, '#39' '#39','
      '       dbo.GetCustAddressID(dbo.InspectionOrder.CustomerID),'
      '       CHAR(13)+CHAR(10), '#39'SITE: '#39','
      
        '       dbo.GetSiteAddrSingleLine(dbo.InspectionOrder.SiteID, 1) ' +
        ') AS DetailStr,'
      ''
      '       CONCAT('#39'<B>'#39', dbo.Customer.CustName, '#39' '#39','
      
        '       dbo.GetCustAddressID(dbo.InspectionOrder.CustomerID), '#39'</' +
        'B>'#39','
      '       '#39'<BR><FONT color="clgrey"><IND x="20">'#39','
      
        '       dbo.GetSiteAddrSingleLine(dbo.InspectionOrder.SiteID, 1),' +
        ' '#39'</FONT>'#39') AS HTMLStr,'
      ''
      ''
      
        '       -- 103, USE 101 for US format '#39'yy-mm-dd HH:mi'#39' MILITARY T' +
        'IME'
      '       -- CONVERT(VARCHAR, GETDATE(), 126) AS DTStr '
      '       --FORMAT(GETDATE(), '#39'yy-mm-dd'#39') AS DTStr '
      '       '
      
        '       CONCAT(CONVERT(VARCHAR, dbo.InspectionOrder.BookIN, 107),' +
        ' '
      
        '       '#39'  '#39', FORMAT(CAST(dbo.InspectionOrder.BookIN AS datetime2' +
        '), N'#39'HH:mm'#39') '
      '       ) AS DTStr  '
      ''
      '       '
      ''
      'FROM dbo.InspectionOrder'
      '    LEFT JOIN dbo.InspectionStatus'
      
        '        ON dbo.InspectionOrder.InspectionStatusID = dbo.Inspecti' +
        'onStatus.InspectionStatusID'
      '    LEFT JOIN dbo.CustSite'
      
        '        ON dbo.InspectionOrder.CustSiteID = dbo.CustSite.CustSit' +
        'eID'
      '    LEFT JOIN dbo.Site'
      '        ON dbo.CustSite.SiteID = dbo.Site.SiteID'
      '    LEFT JOIN dbo.Customer'
      '        ON dbo.CustSite.CustomerID = dbo.Customer.CustomerID'
      'ORDER BY dbo.InspectionOrder.BookIN DESC;'
      ''
      ''
      '')
    Left = 88
    Top = 216
  end
  object dsFindInspectOrder: TDataSource
    DataSet = qryFindInspectOrder
    Left = 216
    Top = 216
  end
  object actnList: TActionList
    Images = FES.imgList32x32
    Left = 328
    Top = 216
    object actnFilters: TAction
      Caption = 'Filters'
    end
    object actnFilterToggle: TAction
      Caption = 'Filter Toggle'
    end
    object actnSearch: TAction
      Caption = 'Search'
    end
  end
  object bindSrc: TBindSourceDB
    DataSet = qryFindInspectOrder
    ScopeMappings = <>
    Left = 160
    Top = 160
  end
  object bindList: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 84
    Top = 157
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindSrc
      GridControl = ControlList1
      Columns = <>
    end
    object LinkPropertyToFieldCaption2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindSrc
      FieldName = 'StatusStr'
      Component = lblStatusStr
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldBrushColor: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindSrc
      FieldName = 'TMSTrackColor'
      Component = Shape1
      ComponentProperty = 'Brush.Color'
    end
    object LinkPropertyToFieldCaption4: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindSrc
      FieldName = 'DTStr'
      Component = lblBookIN
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldHTMLTextText: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindSrc
      FieldName = 'HTMLStr'
      Component = HTMLabel1
      ComponentProperty = 'HTMLText.Text'
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindSrc
      FieldName = 'CustCode'
      Component = lblCustCode
      ComponentProperty = 'Caption'
    end
  end
end
