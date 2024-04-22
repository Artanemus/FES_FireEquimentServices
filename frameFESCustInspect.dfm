object FESCustInspect: TFESCustInspect
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Align = alClient
  TabOrder = 0
  object StackPanel1: TStackPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    ControlCollection = <
      item
        Control = btnTogglePinVisibility
        HorizontalPositioning = sphpLeft
        VerticalPositioning = spvpFill
      end
      item
        Control = btnClipboard
        HorizontalPositioning = sphpLeft
        VerticalPositioning = spvpFill
      end
      item
        Control = btnNew
      end
      item
        Control = btnDelete
      end>
    Orientation = spoHorizontal
    Padding.Left = 34
    Spacing = 8
    TabOrder = 0
    object btnTogglePinVisibility: TVirtualImage
      Left = 34
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
    object btnClipboard: TVirtualImage
      Left = 74
      Top = 0
      Width = 32
      Height = 32
      Hint = 'Toggle visibility of un-pinned items.'
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 89
      ImageName = 'content\content_paste'
      ParentShowHint = False
      ShowHint = True
    end
    object btnNew: TVirtualImage
      Left = 114
      Top = 0
      Width = 32
      Height = 32
      Hint = 'Toggle visibility of un-pinned items.'
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 14
      ImageName = 'record\new'
      ParentShowHint = False
      ShowHint = True
    end
    object btnDelete: TVirtualImage
      Left = 154
      Top = 0
      Width = 32
      Height = 32
      Hint = 'Toggle visibility of un-pinned items.'
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 9
      ImageName = 'record\delete'
      ParentShowHint = False
      ShowHint = True
    end
  end
  object ctrllistCustInspect: TControlList
    Left = 0
    Top = 32
    Width = 640
    Height = 448
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemCount = 1
    ItemHeight = 80
    ItemIndex = 0
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    OnBeforeDrawItem = ctrllistCustInspectBeforeDrawItem
    object lblInspectAddress: TLabel
      AlignWithMargins = True
      Left = 130
      Top = 3
      Width = 381
      Height = 74
      Margins.Left = 130
      Align = alClient
      Caption = '66 Learoyd Road ACACIA RIDGE, QLD 4110'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      StyleElements = [seClient, seBorder]
      ExplicitWidth = 319
      ExplicitHeight = 21
    end
    object lblInspectTech: TLabel
      Left = 7
      Top = 4
      Width = 44
      Height = 21
      Caption = 'TECH: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblInspectStatus: TLabel
      AlignWithMargins = True
      Left = 517
      Top = 3
      Width = 31
      Height = 74
      Margins.Right = 4
      Align = alRight
      Caption = 'Sent'
      Layout = tlCenter
      ExplicitLeft = 504
      ExplicitHeight = 21
    end
    object lblInspectRequestedDT: TLabel
      Left = 11
      Top = 44
      Width = 107
      Height = 17
      Caption = 'REQU: 2021-06-30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblInspectInspectedDT: TLabel
      Left = 17
      Top = 43
      Width = 4
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblInspectCompletedDT: TLabel
      Left = 7
      Top = 60
      Width = 110
      Height = 17
      Caption = 'COMP: 2021-06-30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnPinInspect: TControlListButton
      AlignWithMargins = True
      Left = 555
      Top = 3
      Width = 32
      Height = 74
      Margins.Right = 4
      Align = alRight
      Images = FES.imgList32x32
      ImageIndex = 14
      ImageName = 'pin'
      Style = clbkToolButton
      ExplicitLeft = 576
      ExplicitTop = 4
    end
    object btnEditInspect: TControlListButton
      AlignWithMargins = True
      Left = 594
      Top = 3
      Width = 32
      Height = 74
      Margins.Right = 10
      Align = alRight
      Images = FES.imgList32x32
      ImageIndex = 13
      ImageName = 'edit'
      Style = clbkToolButton
      ExplicitLeft = 593
      ExplicitTop = 4
      ExplicitHeight = 32
    end
  end
  object bindlistCustInspect: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 120
    Top = 160
    object LinkGridToDataSource1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcCustInspect
      GridControl = ctrllistCustInspect
      Columns = <>
    end
    object LinkPropertyToField2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustInspect
      FieldName = 'SiteAddrStr'
      Component = lblInspectAddress
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToField3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustInspect
      FieldName = 'InspectStatusStr'
      Component = lblInspectStatus
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToField5: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustInspect
      FieldName = 'BookINstr'
      Component = lblInspectRequestedDT
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToField6: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustInspect
      FieldName = 'BookOUTstr'
      Component = lblInspectCompletedDT
      ComponentProperty = 'Caption'
    end
  end
  object bindsrcCustInspect: TBindSourceDB
    DataSet = CustomerData.qryCustInspect
    ScopeMappings = <>
    Left = 112
    Top = 240
  end
end
