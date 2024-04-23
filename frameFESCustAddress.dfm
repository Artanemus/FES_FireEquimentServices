object FESCustAddress: TFESCustAddress
  Left = 0
  Top = 0
  Width = 629
  Height = 480
  TabOrder = 0
  object StackPanel1: TStackPanel
    Left = 0
    Top = 0
    Width = 629
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    ControlCollection = <
      item
        Control = vimgHideUnPinned
      end>
    TabOrder = 0
    object vimgHideUnPinned: TVirtualImage
      Left = 0
      Top = 0
      Width = 32
      Height = 32
      Hint = 'Toggle visibility of un-pinned items.'
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 77
      ImageName = 'VisibilityOn'
      ParentShowHint = False
      ShowHint = True
      OnClick = vimgHideUnPinnedClick
    end
  end
  object ctrllistCustAddress: TControlList
    Left = 0
    Top = 32
    Width = 629
    Height = 448
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemCount = 1
    ItemIndex = 0
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    ParentFont = False
    PopupMenu = pumenuCustAddress
    TabOrder = 1
    OnBeforeDrawItem = ctrllistCustAddressBeforeDrawItem
    object lblAddress: TLabel
      AlignWithMargins = True
      Left = 150
      Top = 0
      Width = 381
      Height = 70
      Margins.Left = 150
      Margins.Top = 0
      Margins.Right = 16
      Margins.Bottom = 0
      Align = alClient
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      ExplicitLeft = 200
      ExplicitTop = 10
      ExplicitWidth = 415
      ExplicitHeight = 50
    end
    object lblAddressType: TLabel
      Left = 15
      Top = 15
      Width = 60
      Height = 21
      Caption = 'Business'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnEditAddress: TControlListButton
      AlignWithMargins = True
      Left = 583
      Top = 3
      Width = 32
      Height = 64
      Margins.Left = 0
      Margins.Right = 10
      Align = alRight
      Images = FES.imgList32x32
      ImageIndex = 13
      ImageName = 'edit'
      Style = clbkToolButton
      OnClick = btnEditAddressClick
      ExplicitLeft = 40
      ExplicitTop = 19
      ExplicitHeight = 32
    end
    object btnPinAddress: TControlListButton
      AlignWithMargins = True
      Left = 547
      Top = 3
      Width = 32
      Height = 64
      Margins.Left = 0
      Margins.Right = 4
      Align = alRight
      Images = FES.imgList32x32
      ImageIndex = 14
      ImageName = 'pin'
      Style = clbkToolButton
      OnClick = btnPinAddressClick
      ExplicitTop = 4
    end
    object lblPostalZone: TLabel
      Left = 15
      Top = 35
      Width = 111
      Height = 17
      Caption = 'Forest Lake - Oxley'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object pumenuCustAddress: TPopupMenu
    Left = 312
    Top = 272
    object puEdit: TMenuItem
      Caption = 'Edit'
      ImageName = 'Edit'
      ShortCut = 113
    end
    object puInsert: TMenuItem
      Caption = 'Insert'
      ImageName = 'New'
      ShortCut = 8237
    end
    object puDelete: TMenuItem
      Caption = 'Delete'
      ImageName = 'Delete'
      ShortCut = 16430
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object puPin: TMenuItem
      Caption = 'Pin'
      ImageName = 'pin'
    end
    object puFilter: TMenuItem
      Caption = 'Filter'
      ImageName = 'filter_alt_off'
    end
    object puRefresh: TMenuItem
      Caption = 'Refresh'
      ImageName = 'Refresh'
      ShortCut = 123
    end
  end
  object bindlistCustAddress: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 128
    Top = 176
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcCustAddress
      GridControl = ctrllistCustAddress
      Columns = <>
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustAddress
      FieldName = 'Zone'
      Component = lblPostalZone
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustAddress
      FieldName = 'AddressStr'
      Component = lblAddress
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustAddress
      FieldName = 'AddrTypeStr'
      Component = lblAddressType
      ComponentProperty = 'Caption'
    end
  end
  object bindsrcCustAddress: TBindSourceDB
    DataSource.Enabled = False
    DataSet = CustomerData.qryCustAddress
    ScopeMappings = <>
    Left = 128
    Top = 240
  end
end
