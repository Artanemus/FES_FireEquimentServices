object FESCustContact: TFESCustContact
  Left = 0
  Top = 0
  Width = 636
  Height = 480
  Align = alClient
  TabOrder = 0
  object StackPanel1: TStackPanel
    Left = 0
    Top = 0
    Width = 636
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
  object ctrllistCustEmail: TControlList
    Left = 0
    Top = 32
    Width = 636
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
    object lblContactType: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 3
      Width = 143
      Height = 34
      Margins.Left = 10
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Site Contact'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lblContactName: TLabel
      AlignWithMargins = True
      Left = 166
      Top = 3
      Width = 155
      Height = 34
      Margins.Left = 10
      Align = alLeft
      Alignment = taCenter
      Caption = 'Tony LEE (32731360)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      StyleElements = [seClient, seBorder]
      ExplicitHeight = 21
    end
    object btnEditContact: TControlListButton
      AlignWithMargins = True
      Left = 590
      Top = 3
      Width = 32
      Height = 34
      Margins.Left = 0
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
    object btnPinContact: TControlListButton
      AlignWithMargins = True
      Left = 554
      Top = 3
      Width = 32
      Height = 34
      Margins.Left = 0
      Margins.Right = 4
      Align = alRight
      Images = FES.imgList32x32
      ImageIndex = 14
      ImageName = 'pin'
      Style = clbkToolButton
      ExplicitLeft = 555
      ExplicitTop = 4
      ExplicitHeight = 32
    end
    object lblContactCreatedDT: TLabel
      AlignWithMargins = True
      Left = 498
      Top = 3
      Width = 52
      Height = 34
      Margins.Left = 0
      Margins.Right = 4
      Align = alRight
      Alignment = taRightJustify
      Caption = '15/06/21'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 17
    end
  end
  object bindlistCustContact: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 352
    Top = 144
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcCustContact
      GridControl = ctrllistCustEmail
      Columns = <>
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustContact
      FieldName = 'CreatedOn102'
      Component = lblContactCreatedDT
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustContact
      FieldName = 'FName'
      Component = lblContactName
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustContact
      FieldName = 'ContactTypeStr'
      Component = lblContactType
      ComponentProperty = 'Caption'
    end
  end
  object bindsrcCustContact: TBindSourceDB
    DataSet = CustomerData.qryCustContact
    ScopeMappings = <>
    Left = 352
    Top = 200
  end
end
