object FESCustSite: TFESCustSite
  Left = 0
  Top = 0
  Width = 579
  Height = 480
  Align = alClient
  TabOrder = 0
  object StackPanel1: TStackPanel
    Left = 0
    Top = 0
    Width = 579
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
    end
  end
  object ctrllistCustSite: TControlList
    Left = 0
    Top = 32
    Width = 579
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
    TabOrder = 1
    OnBeforeDrawItem = ctrllistCustSiteBeforeDrawItem
    object lblSiteContact_ss: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 50
      Width = 562
      Height = 17
      Margins.Right = 10
      Align = alBottom
      Alignment = taRightJustify
      Caption = 'Tony LEE  (32731360)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlBottom
      ExplicitLeft = 442
      ExplicitWidth = 123
    end
    object lblSiteAddress: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 0
      Width = 478
      Height = 47
      Margins.Left = 10
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = '66 Learoyd Road'#13#10'ACACIA RIDGE, QLD 4110'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      ExplicitWidth = 189
      ExplicitHeight = 42
    end
    object btnPinSite: TControlListButton
      AlignWithMargins = True
      Left = 494
      Top = 3
      Width = 32
      Height = 41
      Margins.Right = 4
      Align = alRight
      Images = FES.imgList32x32
      ImageIndex = 14
      ImageName = 'pin'
      Style = clbkToolButton
      ExplicitLeft = 533
      ExplicitTop = 4
      ExplicitHeight = 64
    end
    object btnEditSite: TControlListButton
      AlignWithMargins = True
      Left = 533
      Top = 3
      Width = 32
      Height = 41
      Margins.Right = 10
      Align = alRight
      Images = FES.imgList32x32
      ImageIndex = 13
      ImageName = 'edit'
      Style = clbkToolButton
      ExplicitLeft = 600
      ExplicitTop = 8
      ExplicitHeight = 32
    end
  end
  object bindlistCustSite: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 192
    Top = 152
    object LinkGridToDataSource1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcCustSite
      GridControl = ctrllistCustSite
      Columns = <>
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustSite
      FieldName = 'SiteAddrStr'
      Component = lblSiteAddress
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustSite
      FieldName = 'SiteContactStr'
      Component = lblSiteContact_ss
      ComponentProperty = 'Caption'
    end
  end
  object bindsrcCustSite: TBindSourceDB
    DataSet = CustomerData.qryCustSite
    ScopeMappings = <>
    Left = 192
    Top = 224
  end
end
