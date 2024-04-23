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
      Width = 74
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
    ActivePage = TabSheet6
    Align = alClient
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Details'
      DesignSize = (
        821
        385)
      object lblNotes: TLabel
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
      object cntrlistNumber: TControlList
        Left = 0
        Top = 32
        Width = 821
        Height = 353
        Align = alClient
        ItemHeight = 40
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
        ExplicitTop = 33
        object lblNumber: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 142
          Height = 34
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object lblAliasHRNum: TLabel
          AlignWithMargins = True
          Left = 151
          Top = 3
          Width = 4
          Height = 34
          Align = alLeft
          Layout = tlCenter
          ExplicitHeight = 21
        end
        object lblCreatedOnNum: TLabel
          AlignWithMargins = True
          Left = 480
          Top = 3
          Width = 184
          Height = 34
          Align = alRight
          AutoSize = False
          Transparent = True
          Layout = tlCenter
          ExplicitLeft = 552
        end
        object btnPinNum: TControlListButton
          AlignWithMargins = True
          Left = 739
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
          ExplicitLeft = 725
        end
        object btnEditNum: TControlListButton
          AlignWithMargins = True
          Left = 775
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
          ExplicitLeft = 40
          ExplicitTop = 19
          ExplicitHeight = 32
        end
        object btnUpNum: TControlListButton
          AlignWithMargins = True
          Left = 703
          Top = 3
          Width = 32
          Height = 34
          Margins.Left = 0
          Margins.Right = 4
          Align = alRight
          Images = FES.imgList32x32
          ImageIndex = 20
          ImageName = 'arrow_circle_up_FILL'
          Style = clbkToolButton
          ExplicitLeft = 725
        end
        object btnDownNum: TControlListButton
          AlignWithMargins = True
          Left = 667
          Top = 3
          Width = 32
          Height = 34
          Margins.Left = 0
          Margins.Right = 4
          Align = alRight
          Images = FES.imgList32x32
          ImageIndex = 19
          ImageName = 'arrow_circle_down_FILL'
          Style = clbkToolButton
          ExplicitLeft = 725
        end
      end
      object stackNumber: TStackPanel
        Left = 0
        Top = 0
        Width = 821
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = vimgVisNum
          end
          item
            Control = vimgNewNum
          end
          item
            Control = vimgDeleteNum
          end>
        Orientation = spoHorizontal
        TabOrder = 1
        object vimgVisNum: TVirtualImage
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
        object vimgNewNum: TVirtualImage
          Left = 34
          Top = 0
          Width = 32
          Height = 32
          Hint = 'Insert a new number'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 14
          ImageName = 'record\new'
          ParentShowHint = False
          ShowHint = True
        end
        object vimgDeleteNum: TVirtualImage
          Left = 68
          Top = 0
          Width = 32
          Height = 32
          Hint = 'Delete the selected number'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 9
          ImageName = 'record\delete'
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Role'
      ImageIndex = 2
      object cntrlistRole: TControlList
        Left = 0
        Top = 32
        Width = 821
        Height = 353
        Align = alClient
        ItemHeight = 40
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
        object lblRole: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 129
          Height = 34
          Align = alLeft
          AutoSize = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitHeight = 40
        end
        object btndownRole: TControlListButton
          AlignWithMargins = True
          Left = 667
          Top = 3
          Width = 32
          Height = 34
          Margins.Left = 0
          Margins.Right = 4
          Align = alRight
          Images = FES.imgList32x32
          ImageIndex = 19
          ImageName = 'arrow_circle_down_FILL'
          Style = clbkToolButton
          ExplicitLeft = 631
          ExplicitTop = 4
        end
        object btnUpRole: TControlListButton
          AlignWithMargins = True
          Left = 703
          Top = 3
          Width = 32
          Height = 34
          Margins.Left = 0
          Margins.Right = 4
          Align = alRight
          Images = FES.imgList32x32
          ImageIndex = 20
          ImageName = 'arrow_circle_up_FILL'
          Style = clbkToolButton
          ExplicitLeft = 691
          ExplicitTop = 4
        end
        object btnPinRole: TControlListButton
          AlignWithMargins = True
          Left = 739
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
          ExplicitLeft = 725
        end
        object btnEditRole: TControlListButton
          AlignWithMargins = True
          Left = 775
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
          ExplicitLeft = 747
          ExplicitTop = 6
        end
        object lblCreatedOnRole: TLabel
          AlignWithMargins = True
          Left = 480
          Top = 3
          Width = 184
          Height = 34
          Align = alRight
          AutoSize = False
          Transparent = True
          Layout = tlCenter
          ExplicitLeft = 488
          ExplicitTop = 6
        end
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
            Control = vimgVisRole
          end
          item
            Control = VirtualImage8
          end
          item
            Control = VirtualImage2
          end>
        Orientation = spoHorizontal
        TabOrder = 1
        object vimgVisRole: TVirtualImage
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
        object VirtualImage8: TVirtualImage
          Left = 34
          Top = 0
          Width = 32
          Height = 32
          Hint = 'Insert a new number'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 14
          ImageName = 'record\new'
          ParentShowHint = False
          ShowHint = True
        end
        object VirtualImage2: TVirtualImage
          Left = 68
          Top = 0
          Width = 32
          Height = 32
          Hint = 'Delete the selected number'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 9
          ImageName = 'record\delete'
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Email'
      ImageIndex = 3
      object cntrlistHREmail: TControlList
        Left = 0
        Top = 32
        Width = 821
        Height = 353
        Align = alClient
        ItemHeight = 40
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
        object lblCreatedOnEmail: TLabel
          AlignWithMargins = True
          Left = 480
          Top = 3
          Width = 184
          Height = 34
          Align = alRight
          AutoSize = False
          Transparent = True
          Layout = tlCenter
          ExplicitLeft = 290
          ExplicitTop = 4
        end
        object ControlListButton1: TControlListButton
          AlignWithMargins = True
          Left = 667
          Top = 3
          Width = 32
          Height = 34
          Margins.Left = 0
          Margins.Right = 4
          Align = alRight
          Images = FES.imgList32x32
          ImageIndex = 19
          ImageName = 'arrow_circle_down_FILL'
          Style = clbkToolButton
          ExplicitLeft = 631
          ExplicitTop = 4
        end
        object ControlListButton2: TControlListButton
          AlignWithMargins = True
          Left = 703
          Top = 3
          Width = 32
          Height = 34
          Margins.Left = 0
          Margins.Right = 4
          Align = alRight
          Images = FES.imgList32x32
          ImageIndex = 20
          ImageName = 'arrow_circle_up_FILL'
          Style = clbkToolButton
          ExplicitLeft = 691
          ExplicitTop = 4
        end
        object ControlListButton3: TControlListButton
          AlignWithMargins = True
          Left = 739
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
          ExplicitLeft = 725
        end
        object ControlListButton4: TControlListButton
          AlignWithMargins = True
          Left = 775
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
          ExplicitLeft = 747
          ExplicitTop = 6
        end
        object lblHREmail: TLabel
          AlignWithMargins = True
          Left = 107
          Top = 3
          Width = 4
          Height = 34
          Margins.Left = 6
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 21
        end
        object lblHREmailType: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 95
          Height = 34
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Layout = tlCenter
        end
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
            Control = vimgVisEmail
          end
          item
            Control = vimgNewEmail
          end
          item
            Control = vimgDeleteEmail
          end
          item
            Control = vimgCopyEmail
          end>
        Orientation = spoHorizontal
        TabOrder = 1
        object vimgVisEmail: TVirtualImage
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
        object vimgNewEmail: TVirtualImage
          Left = 34
          Top = 0
          Width = 32
          Height = 32
          Hint = 'Insert a new email address'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 14
          ImageName = 'record\new'
          ParentShowHint = False
          ShowHint = True
        end
        object vimgDeleteEmail: TVirtualImage
          Left = 68
          Top = 0
          Width = 32
          Height = 32
          Hint = 'Delete the selected email'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 9
          ImageName = 'record\delete'
          ParentShowHint = False
          ShowHint = True
        end
        object vimgCopyEmail: TVirtualImage
          Left = 102
          Top = 0
          Width = 32
          Height = 32
          Hint = 'Copy email address to the clipboard'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 87
          ImageName = 'content\content_copy'
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Address'
      ImageIndex = 4
      object cntrlistHRAddr: TControlList
        Left = 0
        Top = 32
        Width = 821
        Height = 353
        Align = alClient
        ItemHeight = 40
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
        object btnDownAddr: TControlListButton
          AlignWithMargins = True
          Left = 667
          Top = 3
          Width = 32
          Height = 34
          Margins.Left = 0
          Margins.Right = 4
          Align = alRight
          Images = FES.imgList32x32
          ImageIndex = 19
          ImageName = 'arrow_circle_down_FILL'
          Style = clbkToolButton
          ExplicitLeft = 641
          ExplicitTop = 4
        end
        object btnUpAddr: TControlListButton
          AlignWithMargins = True
          Left = 703
          Top = 3
          Width = 32
          Height = 34
          Margins.Left = 0
          Margins.Right = 4
          Align = alRight
          Images = FES.imgList32x32
          ImageIndex = 20
          ImageName = 'arrow_circle_up_FILL'
          Style = clbkToolButton
          ExplicitLeft = 691
          ExplicitTop = 4
        end
        object btnPinAddr: TControlListButton
          AlignWithMargins = True
          Left = 739
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
          ExplicitLeft = 725
        end
        object btnEditAddr: TControlListButton
          AlignWithMargins = True
          Left = 775
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
          ExplicitLeft = 747
          ExplicitTop = 6
          ExplicitHeight = 64
        end
        object lblHRAddrType: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 72
          Height = 34
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Layout = tlCenter
        end
        object lblHRAddr: TLabel
          AlignWithMargins = True
          Left = 84
          Top = 3
          Width = 4
          Height = 34
          Margins.Left = 6
          Align = alLeft
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 21
        end
        object lblHRAddrCreatedOn: TLabel
          AlignWithMargins = True
          Left = 660
          Top = 3
          Width = 4
          Height = 34
          Align = alRight
          Layout = tlCenter
          ExplicitLeft = 569
          ExplicitHeight = 21
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
            Control = vimgVisAddr
          end
          item
            Control = vimgNewAddr
          end
          item
            Control = vimgDeleteAddr
          end
          item
            Control = vimgCopyAddr
          end>
        Orientation = spoHorizontal
        TabOrder = 1
        ExplicitTop = -1
        object vimgVisAddr: TVirtualImage
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
        object vimgNewAddr: TVirtualImage
          Left = 34
          Top = 0
          Width = 32
          Height = 32
          Hint = 'Insert a new email address'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 14
          ImageName = 'record\new'
          ParentShowHint = False
          ShowHint = True
        end
        object vimgDeleteAddr: TVirtualImage
          Left = 68
          Top = 0
          Width = 32
          Height = 32
          Hint = 'Delete the selected email'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 9
          ImageName = 'record\delete'
          ParentShowHint = False
          ShowHint = True
        end
        object vimgCopyAddr: TVirtualImage
          Left = 102
          Top = 0
          Width = 32
          Height = 32
          Hint = 'Copy email address to the clipboard'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 87
          ImageName = 'content\content_copy'
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Cutomer Contacts'
      ImageIndex = 5
      object cntrlistCustContact: TControlList
        Left = 0
        Top = 32
        Width = 821
        Height = 353
        Align = alClient
        ItemHeight = 40
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
        object btnEditCustContact: TControlListButton
          AlignWithMargins = True
          Left = 775
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
          ExplicitLeft = 783
          ExplicitTop = 6
        end
        object btnPinCustContact: TControlListButton
          AlignWithMargins = True
          Left = 739
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
          ExplicitTop = 4
        end
        object btnUpCustContact: TControlListButton
          AlignWithMargins = True
          Left = 703
          Top = 3
          Width = 32
          Height = 34
          Margins.Left = 0
          Margins.Right = 4
          Align = alRight
          Images = FES.imgList32x32
          ImageIndex = 20
          ImageName = 'arrow_circle_up_FILL'
          Style = clbkToolButton
          ExplicitTop = 4
        end
        object btnDownCustContact: TControlListButton
          AlignWithMargins = True
          Left = 667
          Top = 3
          Width = 32
          Height = 34
          Margins.Left = 0
          Margins.Right = 4
          Align = alRight
          Images = FES.imgList32x32
          ImageIndex = 19
          ImageName = 'arrow_circle_down_FILL'
          Style = clbkToolButton
          ExplicitLeft = 675
          ExplicitTop = 6
        end
        object lblHRCustContactName: TLabel
          Left = 24
          Top = 8
          Width = 4
          Height = 21
        end
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
            Control = VirtualImage5
          end
          item
            Control = VirtualImage11
          end
          item
            Control = VirtualImage12
          end
          item
            Control = VirtualImage13
          end>
        Orientation = spoHorizontal
        TabOrder = 1
        ExplicitTop = 8
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
        object VirtualImage11: TVirtualImage
          Left = 34
          Top = 0
          Width = 32
          Height = 32
          Hint = 'Insert a new email address'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 14
          ImageName = 'record\new'
          ParentShowHint = False
          ShowHint = True
        end
        object VirtualImage12: TVirtualImage
          Left = 68
          Top = 0
          Width = 32
          Height = 32
          Hint = 'Delete the selected email'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 9
          ImageName = 'record\delete'
          ParentShowHint = False
          ShowHint = True
        end
        object VirtualImage13: TVirtualImage
          Left = 102
          Top = 0
          Width = 32
          Height = 32
          Hint = 'Copy email address to the clipboard'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 87
          ImageName = 'content\content_copy'
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
  object bindlistNum: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 388
    Top = 253
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcNum
      GridControl = cntrlistNumber
      Columns = <>
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcNum
      FieldName = 'Number'
      Component = lblNumber
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcNum
      FieldName = 'AliasHR'
      Component = lblAliasHRNum
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcNum
      FieldName = 'CreatedOn'
      Component = lblCreatedOnNum
      ComponentProperty = 'Caption'
    end
    object LinkGridToDataSourceBindSourceDB12: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcRole
      GridControl = cntrlistRole
      Columns = <>
    end
    object LinkPropertyToFieldCaption4: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcRole
      FieldName = 'Caption'
      Component = lblRole
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption5: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcRole
      FieldName = 'CreatedOn'
      Component = lblCreatedOnRole
      ComponentProperty = 'Caption'
    end
    object LinkGridToDataSourceBindSourceDB13: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcEmail
      GridControl = cntrlistHREmail
      Columns = <>
    end
    object LinkPropertyToFieldCaption6: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcEmail
      FieldName = 'Email'
      Component = lblHREmail
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption7: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcEmail
      FieldName = 'AliasHR'
      Component = lblHREmailType
      ComponentProperty = 'Caption'
    end
    object LinkGridToDataSourceBindSourceDB14: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcAddr
      GridControl = cntrlistHRAddr
      Columns = <>
    end
    object LinkPropertyToFieldCaption8: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcAddr
      FieldName = 'AliasHR'
      Component = lblHRAddrType
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption9: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcAddr
      FieldName = 'AddrSingleLine'
      Component = lblHRAddr
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption10: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcAddr
      FieldName = 'CreatedOn'
      Component = lblHRAddrCreatedOn
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption11: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcEmail
      FieldName = 'CreatedOn'
      Component = lblCreatedOnEmail
      ComponentProperty = 'Caption'
    end
    object LinkGridToDataSourceBindSourceDB15: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcCustContact
      GridControl = cntrlistCustContact
      Columns = <>
    end
    object LinkPropertyToFieldCaption12: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustContact
      FieldName = 'CustName'
      Component = lblHRCustContactName
      ComponentProperty = 'Caption'
    end
  end
  object bindsrcNum: TBindSourceDB
    DataSet = HRData.qryHRNumber
    ScopeMappings = <>
    Left = 248
    Top = 320
  end
  object bindsrcRole: TBindSourceDB
    DataSet = HRData.qryRoleList
    ScopeMappings = <>
    Left = 320
    Top = 320
  end
  object bindsrcEmail: TBindSourceDB
    DataSet = HRData.qryHREmail
    ScopeMappings = <>
    Left = 392
    Top = 320
  end
  object bindsrcAddr: TBindSourceDB
    DataSet = HRData.qryAddress
    ScopeMappings = <>
    Left = 464
    Top = 320
  end
  object bindsrcCustContact: TBindSourceDB
    DataSet = HRData.qryCustContact
    ScopeMappings = <>
    Left = 560
    Top = 320
  end
end
