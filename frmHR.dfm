object HR: THR
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'HR'
  ClientHeight = 563
  ClientWidth = 829
  Color = clBtnFace
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Height = 31
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Top = 31
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 494
    Width = 829
    Height = 69
    Align = alBottom
    BevelEdges = []
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 809
      Height = 49
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      DataSource = HRData.dsHR
      Align = alClient
      TabOrder = 0
    end
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 829
    Height = 31
    CustomButtons = <>
    object vimgToggleFilters: TVirtualImage
      AlignWithMargins = True
      Left = 539
      Top = 0
      Width = 32
      Height = 31
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
      Left = 647
      Top = 0
      Width = 32
      Height = 31
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
    object vimgSetFilters: TVirtualImage
      AlignWithMargins = True
      Left = 503
      Top = 0
      Width = 32
      Height = 31
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
      ExplicitLeft = 429
      ExplicitHeight = 30
    end
    object vimgFindCustomer: TVirtualImage
      AlignWithMargins = True
      Left = 575
      Top = 0
      Width = 32
      Height = 31
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
    object VirtualImage1: TVirtualImage
      AlignWithMargins = True
      Left = 611
      Top = 0
      Width = 32
      Height = 31
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
  object Panel2: TPanel
    Left = 0
    Top = 31
    Width = 829
    Height = 42
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 2
    object dbtxtHRID: TDBText
      Left = 16
      Top = 6
      Width = 65
      Height = 30
      Alignment = taRightJustify
      DataField = 'HRID'
      DataSource = HRData.dsHR
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object dbtxtHRName: TDBText
      Left = 95
      Top = 6
      Width = 65
      Height = 30
      AutoSize = True
      DataField = 'FNAME'
      DataSource = HRData.dsHR
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 73
    Width = 829
    Height = 421
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Details'
      DesignSize = (
        821
        385)
      object Label1: TLabel
        Left = 65
        Top = 124
        Width = 41
        Height = 21
        Caption = 'Notes'
      end
      object DBLabeledEdit1: TDBLabeledEdit
        Left = 112
        Top = 16
        Width = 337
        Height = 29
        DataField = 'FirstName'
        DataSource = HRData.dsHR
        TabOrder = 0
        EditLabel.Width = 76
        EditLabel.Height = 29
        EditLabel.Caption = 'First Name'
        LabelPosition = lpLeft
        LabelSpacing = 6
      end
      object DBLabeledEdit2: TDBLabeledEdit
        Left = 112
        Top = 51
        Width = 337
        Height = 29
        DataSource = HRData.dsHR
        TabOrder = 1
        EditLabel.Width = 94
        EditLabel.Height = 29
        EditLabel.Caption = 'Middle Name'
        LabelPosition = lpLeft
        LabelSpacing = 6
      end
      object DBLabeledEdit3: TDBLabeledEdit
        Left = 112
        Top = 86
        Width = 337
        Height = 29
        DataField = 'LastName'
        DataSource = HRData.dsHR
        TabOrder = 2
        EditLabel.Width = 74
        EditLabel.Height = 29
        EditLabel.Caption = 'Last Name'
        LabelPosition = lpLeft
        LabelSpacing = 6
      end
      object DBMemo1: TDBMemo
        Left = 112
        Top = 121
        Width = 706
        Height = 262
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataField = 'Note'
        DataSource = HRData.dsHR
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Contact Numbers'
      ImageIndex = 1
      object ControlList1: TControlList
        Left = 0
        Top = 48
        Width = 821
        Height = 306
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
        object Label2: TLabel
          Left = 32
          Top = 12
          Width = 4
          Height = 21
        end
        object Label3: TLabel
          Left = 139
          Top = 7
          Width = 4
          Height = 21
        end
        object Label4: TLabel
          Left = 360
          Top = 8
          Width = 4
          Height = 21
        end
      end
      object StackPanel1: TStackPanel
        Left = 0
        Top = 0
        Width = 821
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = vimgHideUnPinned
          end>
        TabOrder = 1
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
    end
    object TabSheet3: TTabSheet
      Caption = 'Role'
      ImageIndex = 2
      object ControlList2: TControlList
        Left = 0
        Top = 32
        Width = 821
        Height = 353
        Align = alClient
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
      end
      object StackPanel2: TStackPanel
        Left = 0
        Top = 0
        Width = 821
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = VirtualImage2
          end>
        TabOrder = 1
        object VirtualImage2: TVirtualImage
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
    end
    object TabSheet4: TTabSheet
      Caption = 'Email'
      ImageIndex = 3
      object ControlList3: TControlList
        Left = 0
        Top = 32
        Width = 821
        Height = 353
        Align = alClient
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
      end
      object StackPanel3: TStackPanel
        Left = 0
        Top = 0
        Width = 821
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = VirtualImage3
          end>
        TabOrder = 1
        object VirtualImage3: TVirtualImage
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
    end
    object TabSheet5: TTabSheet
      Caption = 'Address'
      ImageIndex = 4
      object ControlList4: TControlList
        Left = 0
        Top = 32
        Width = 821
        Height = 353
        Align = alClient
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
      end
      object StackPanel4: TStackPanel
        Left = 0
        Top = 0
        Width = 821
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = VirtualImage4
          end>
        TabOrder = 1
        object VirtualImage4: TVirtualImage
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
    end
    object TabSheet6: TTabSheet
      Caption = 'Cutomer Contacts'
      ImageIndex = 5
      object ControlList5: TControlList
        Left = 0
        Top = 32
        Width = 821
        Height = 353
        Align = alClient
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
      end
      object StackPanel5: TStackPanel
        Left = 0
        Top = 0
        Width = 821
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = VirtualImage5
          end>
        TabOrder = 1
        object VirtualImage5: TVirtualImage
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
    end
    object TabSheet7: TTabSheet
      Caption = 'Sites-Zones'
      ImageIndex = 6
      object ControlList6: TControlList
        Left = 0
        Top = 32
        Width = 821
        Height = 353
        Align = alClient
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
      end
      object StackPanel6: TStackPanel
        Left = 0
        Top = 0
        Width = 821
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = VirtualImage6
          end>
        TabOrder = 1
        object VirtualImage6: TVirtualImage
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
    end
    object TabSheet8: TTabSheet
      Caption = 'Time Sheet'
      ImageIndex = 7
      object ControlList7: TControlList
        Left = 0
        Top = 32
        Width = 821
        Height = 353
        Align = alClient
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
      end
      object StackPanel7: TStackPanel
        Left = 0
        Top = 0
        Width = 821
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = VirtualImage7
          end>
        TabOrder = 1
        object VirtualImage7: TVirtualImage
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
    end
    object TabSheet9: TTabSheet
      Caption = 'Staff'
      ImageIndex = 8
      object DBLabeledEdit4: TDBLabeledEdit
        Left = 184
        Top = 22
        Width = 225
        Height = 29
        DataField = 'LastName'
        DataSource = HRData.dsHR
        TabOrder = 0
        EditLabel.Width = 121
        EditLabel.Height = 29
        EditLabel.Caption = 'User Login Name'
        LabelPosition = lpLeft
        LabelSpacing = 6
      end
      object DBLabeledEdit5: TDBLabeledEdit
        Left = 184
        Top = 112
        Width = 225
        Height = 29
        DataField = 'FNAME'
        DataSource = HRData.dsEmergencyHR
        TabOrder = 1
        EditLabel.Width = 134
        EditLabel.Height = 29
        EditLabel.Caption = 'Emergency Contact'
        LabelPosition = lpLeft
        LabelSpacing = 6
      end
      object DBLabeledEdit6: TDBLabeledEdit
        Left = 184
        Top = 147
        Width = 225
        Height = 29
        DataField = 'EmergencyNumber'
        DataSource = HRData.dsEmergencyHR
        TabOrder = 2
        EditLabel.Width = 139
        EditLabel.Height = 29
        EditLabel.Caption = 'Emergency Number'
        LabelPosition = lpLeft
        LabelSpacing = 6
      end
    end
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 324
    Top = 245
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = ControlList1
      Columns = <>
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'Number'
      Component = Label2
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'AliasHR'
      Component = Label3
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'CreatedOn'
      Component = Label4
      ComponentProperty = 'Caption'
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = HRData.qryHRNumber
    ScopeMappings = <>
    Left = 408
    Top = 288
  end
end
