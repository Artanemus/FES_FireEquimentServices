object FESCustEmail: TFESCustEmail
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
  object ctrllistCustEmail: TControlList
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
    ItemCount = 2
    ItemHeight = 40
    ItemIndex = 0
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    OnBeforeDrawItem = ctrllistCustEmailBeforeDrawItem
    ExplicitTop = 38
    object lblEmailType: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 3
      Width = 175
      Height = 34
      Margins.Left = 10
      Align = alLeft
      AutoSize = False
      Caption = 'Accounts Department'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lblEmail: TLabel
      AlignWithMargins = True
      Left = 188
      Top = 0
      Width = 291
      Height = 40
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = 'admin@cooperpg.com.au'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      StyleElements = [seClient, seBorder]
      ExplicitWidth = 197
      ExplicitHeight = 21
    end
    object lblEmailCreatedDT: TLabel
      AlignWithMargins = True
      Left = 482
      Top = 3
      Width = 66
      Height = 34
      Margins.Right = 4
      Align = alRight
      Alignment = taRightJustify
      Caption = '15/06/2021'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 17
    end
    object btnPinEmail: TControlListButton
      AlignWithMargins = True
      Left = 555
      Top = 3
      Width = 32
      Height = 34
      Margins.Right = 4
      Align = alRight
      Images = FES.imgList32x32
      ImageIndex = 14
      ImageName = 'pin'
      Style = clbkToolButton
      OnClick = btnPinEmailClick
      ExplicitTop = 4
      ExplicitHeight = 32
    end
    object btnEditEmail: TControlListButton
      AlignWithMargins = True
      Left = 594
      Top = 3
      Width = 32
      Height = 34
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
  object bindsrcCustEmail: TBindSourceDB
    DataSet = CustomerData.qryCustEmails
    ScopeMappings = <>
    Left = 144
    Top = 160
  end
  object bindListCustEmail: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 144
    Top = 96
    object LinkPropertyToField1: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustEmail
      FieldName = 'EmailTypeStr'
      Component = lblEmailType
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToField2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustEmail
      FieldName = 'Email'
      Component = lblEmail
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToField3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustEmail
      FieldName = 'ShortDateStr'
      Component = lblEmailCreatedDT
      ComponentProperty = 'Caption'
    end
    object LinkGridToDataSourcebindsrcCustEmail: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcCustEmail
      GridControl = ctrllistCustEmail
      Columns = <>
    end
  end
end
