object FindInspectOrders: TFindInspectOrders
  Left = 0
  Top = 0
  Caption = 'Find Inspection Order'
  ClientHeight = 847
  ClientWidth = 1502
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
    Width = 1502
    Height = 39
    Align = alTop
    BevelEdges = [beBottom]
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 9
      Width = 113
      Height = 21
      Alignment = taRightJustify
      Caption = 'Company Name'
    end
    object Label2: TLabel
      Left = 476
      Top = 9
      Width = 86
      Height = 21
      Alignment = taRightJustify
      Caption = 'Site Address'
    end
    object Edit1: TEdit
      Left = 128
      Top = 6
      Width = 289
      Height = 29
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 568
      Top = 6
      Width = 289
      Height = 29
      TabOrder = 1
      Text = 'Edit1'
    end
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 1502
    Height = 34
    CustomButtons = <>
    object vimgToggleFilters: TVirtualImage
      AlignWithMargins = True
      Left = 1212
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
      Left = 1320
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
    object vimgFilters: TVirtualImage
      AlignWithMargins = True
      Left = 1176
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
      OnClick = vimgFiltersClick
      ExplicitLeft = 429
      ExplicitHeight = 30
    end
    object vimgFindCustomer: TVirtualImage
      AlignWithMargins = True
      Left = 1248
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
      Left = 1284
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
  end
  object qryFindInspectOrder: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = FES.fesConnection
    SQL.Strings = (
      'USE IDFES'
      ';'
      ''
      'SELECT dbo.InspectionOrder.InspectionOrderID,'
      '       dbo.CustSite.CustomerID,'
      '       dbo.CustSite.SiteID,'
      '       dbo.CustSite.IsEnabled,'
      '       dbo.InspectionOrder.RequestedDT,'
      '       dbo.InspectionOrder.CompletedDT,'
      '       dbo.Customer.CustName,'
      '       dbo.InspectionStatus.Caption,'
      '       dbo.Site.[Address],'
      '       dbo.InspectionOrder.InspectionStatusID,'
      '       dbo.Site.PostcodeID,'
      '       dbo.Postcode.Suburb,'
      '       -- Human reable label for grid'
      '       CASE dbo.CustSite.IsEnabled'
      '           WHEN 1 THEN'
      '               '#39'ENABLED'#39
      '           ELSE'
      '               '#39'DISABLED'#39
      '       END AS LinkStatus,'
      
        '       -- Field address is a Memo type. What'#39's needed is a singl' +
        'e line without line feeds and carriage returns.'
      
        '       REPLACE(REPLACE([Address], CHAR(10), '#39#39'), CHAR(13), '#39#39') A' +
        'S xAddress,'
      '       dbo.InspectionOrder.CreatedOn'
      'FROM dbo.InspectionOrder'
      '    LEFT JOIN dbo.InspectionStatus'
      
        '        ON dbo.InspectionOrder.InspectionStatusID = dbo.Inspecti' +
        'onStatus.InspectionStatusID'
      '    LEFT JOIN dbo.CustSite'
      
        '        ON dbo.InspectionOrder.CustSiteID = dbo.CustSite.CustSit' +
        'eID'
      '    LEFT JOIN dbo.Site'
      '        ON dbo.CustSite.SiteID = dbo.Site.SiteID'
      '    LEFT JOIN dbo.Postcode'
      '        ON dbo.Site.PostcodeID = dbo.Postcode.PostcodeID'
      '    LEFT JOIN dbo.Customer'
      '        ON dbo.CustSite.CustomerID = dbo.Customer.CustomerID'
      'ORDER BY dbo.InspectionOrder.RequestedDT DESC;'
      ''
      ''
      ''
      '')
    Left = 168
    Top = 112
    object qryFindInspectOrderInspectionOrderID: TFDAutoIncField
      DisplayLabel = 'Order#'
      DisplayWidth = 6
      FieldName = 'InspectionOrderID'
      Origin = 'InspectionOrderID'
    end
    object qryFindInspectOrderCustomerID: TIntegerField
      DisplayLabel = 'Cust#'
      DisplayWidth = 6
      FieldName = 'CustomerID'
      Origin = 'CustomerID'
    end
    object qryFindInspectOrderSiteID: TIntegerField
      DisplayLabel = 'Site#'
      DisplayWidth = 6
      FieldName = 'SiteID'
      Origin = 'SiteID'
    end
    object qryFindInspectOrderIsEnabled: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'Link On'
      FieldName = 'IsEnabled'
      Origin = 'IsEnabled'
    end
    object qryFindInspectOrderLinkStatus: TStringField
      Alignment = taCenter
      DisplayLabel = 'Link On'
      DisplayWidth = 9
      FieldName = 'LinkStatus'
      Origin = 'LinkStatus'
      ReadOnly = True
      Required = True
      Size = 8
    end
    object qryFindInspectOrderRequestedDT: TSQLTimeStampField
      DisplayLabel = 'Requested DT'
      DisplayWidth = 13
      FieldName = 'RequestedDT'
      Origin = 'RequestedDT'
      DisplayFormat = 'dd/mm/yy HH:NN'
    end
    object qryFindInspectOrderCompletedDT: TSQLTimeStampField
      DisplayLabel = 'Completed DT'
      DisplayWidth = 13
      FieldName = 'CompletedDT'
      Origin = 'CompletedDT'
      DisplayFormat = 'dd/mm/yy HH:NN'
    end
    object qryFindInspectOrderCustName: TWideStringField
      DisplayLabel = 'Customer'
      DisplayWidth = 50
      FieldName = 'CustName'
      Origin = 'CustName'
      Size = 64
    end
    object qryFindInspectOrderCaption: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Status'
      DisplayWidth = 12
      FieldName = 'Caption'
      Origin = 'Caption'
      Size = 50
    end
    object qryFindInspectOrderAddress: TWideStringField
      DisplayLabel = 'Customer Address'
      DisplayWidth = 30
      FieldName = 'Address'
      Origin = 'Address'
      Size = 256
    end
    object qryFindInspectOrderInspectionStatusID: TIntegerField
      FieldName = 'InspectionStatusID'
      Origin = 'InspectionStatusID'
    end
    object qryFindInspectOrderPostcodeID: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Postcode'
      DisplayWidth = 6
      FieldName = 'PostcodeID'
      Origin = 'PostcodeID'
    end
    object qryFindInspectOrderSuburb: TWideStringField
      DisplayWidth = 18
      FieldName = 'Suburb'
      Origin = 'Suburb'
      Size = 50
    end
    object qryFindInspectOrderxAddress: TWideStringField
      DisplayLabel = 'Site Address'
      DisplayWidth = 30
      FieldName = 'xAddress'
      Origin = 'xAddress'
      ReadOnly = True
      Size = 4000
    end
    object qryFindInspectOrderCreatedOn: TSQLTimeStampField
      DisplayLabel = 'Created On'
      DisplayWidth = 13
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
      DisplayFormat = 'dd/mm/yy HH:NN'
    end
  end
  object dsFindInspectOrder: TDataSource
    DataSet = qryFindInspectOrder
    Left = 168
    Top = 168
  end
  object actnList: TActionList
    Images = FES.imgList32x32
    Left = 312
    Top = 120
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
end
