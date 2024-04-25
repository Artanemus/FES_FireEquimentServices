object HR: THR
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'HR'
  ClientHeight = 713
  ClientWidth = 816
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
    Top = 644
    Width = 816
    Height = 69
    Align = alBottom
    BevelEdges = []
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 494
    ExplicitWidth = 829
    object DBNavigator1: TDBNavigator
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 796
      Height = 49
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      DataSource = HRData.dsHR
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 809
    end
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 816
    Height = 31
    CustomButtons = <>
    ExplicitWidth = 829
    object vimgToggleFilters: TVirtualImage
      AlignWithMargins = True
      Left = 526
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
      Left = 634
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
      Left = 490
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
      Left = 562
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
      Left = 598
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
    Width = 816
    Height = 42
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 829
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
    Width = 816
    Height = 571
    ActivePage = TabSheet8
    Align = alClient
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Details'
      object RelativePanel1: TRelativePanel
        Left = 0
        Top = 0
        Width = 808
        Height = 535
        ControlCollection = <
          item
            Control = Panel4
            AlignBottomWithPanel = True
            AlignHorizontalCenterWithPanel = False
            AlignLeftWith = Splitter1
            AlignLeftWithPanel = False
            AlignRightWithPanel = True
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = Splitter1
            AlignBottomWithPanel = True
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = True
          end
          item
            Control = Panel3
            AlignBottomWithPanel = True
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWith = Splitter1
            AlignRightWithPanel = False
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end>
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          808
          535)
        object Panel4: TPanel
          Left = 402
          Top = 0
          Width = 406
          Height = 535
          Anchors = []
          BevelOuter = bvNone
          Caption = 'Panel4'
          ShowCaption = False
          TabOrder = 0
          object Label1: TLabel
            Left = 20
            Top = 43
            Width = 194
            Height = 21
            Caption = 'DETAILS FOR STAFF ONLY ...'
          end
          object DBLabeledEdit4: TDBLabeledEdit
            Left = 21
            Top = 99
            Width = 366
            Height = 29
            DataField = 'LastName'
            DataSource = HRData.dsHR
            TabOrder = 0
            EditLabel.Width = 121
            EditLabel.Height = 21
            EditLabel.Caption = 'User Login Name'
            LabelSpacing = 6
          end
          object DBLabeledEdit5: TDBLabeledEdit
            Left = 21
            Top = 157
            Width = 366
            Height = 29
            DataField = 'FNAME'
            DataSource = HRData.dsEmergencyHR
            TabOrder = 1
            EditLabel.Width = 134
            EditLabel.Height = 21
            EditLabel.Caption = 'Emergency Contact'
            LabelSpacing = 6
          end
          object DBLabeledEdit6: TDBLabeledEdit
            Left = 21
            Top = 220
            Width = 366
            Height = 29
            DataField = 'EmergencyNumber'
            DataSource = HRData.dsEmergencyHR
            TabOrder = 2
            EditLabel.Width = 139
            EditLabel.Height = 21
            EditLabel.Caption = 'Emergency Number'
            LabelSpacing = 6
          end
        end
        object Splitter1: TSplitter
          Left = 402
          Top = 0
          Height = 535
          Visible = False
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 405
          Height = 535
          Anchors = []
          BevelOuter = bvNone
          Caption = 'Panel3'
          ShowCaption = False
          TabOrder = 1
          DesignSize = (
            405
            535)
          object lblNotes: TLabel
            Left = 11
            Top = 193
            Width = 41
            Height = 21
            Caption = 'Notes'
          end
          object DBLabeledEdit1: TDBLabeledEdit
            Left = 11
            Top = 40
            Width = 368
            Height = 29
            Anchors = [akLeft, akTop, akRight]
            DataField = 'FirstName'
            DataSource = HRData.dsHR
            TabOrder = 0
            EditLabel.Width = 76
            EditLabel.Height = 21
            EditLabel.Caption = 'First Name'
            LabelSpacing = 6
            ExplicitWidth = 366
          end
          object DBLabeledEdit2: TDBLabeledEdit
            Left = 11
            Top = 99
            Width = 368
            Height = 29
            Anchors = [akLeft, akTop, akRight]
            DataSource = HRData.dsHR
            TabOrder = 1
            EditLabel.Width = 94
            EditLabel.Height = 21
            EditLabel.Caption = 'Middle Name'
            LabelSpacing = 6
            ExplicitWidth = 366
          end
          object DBLabeledEdit3: TDBLabeledEdit
            Left = 11
            Top = 158
            Width = 368
            Height = 29
            Anchors = [akLeft, akTop, akRight]
            DataField = 'LastName'
            DataSource = HRData.dsHR
            TabOrder = 2
            EditLabel.Width = 74
            EditLabel.Height = 21
            EditLabel.Caption = 'Last Name'
            LabelSpacing = 6
            ExplicitWidth = 366
          end
          object DBMemo1: TDBMemo
            Left = 11
            Top = 220
            Width = 368
            Height = 295
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'Note'
            DataSource = HRData.dsHR
            TabOrder = 3
            ExplicitWidth = 366
            ExplicitHeight = 293
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Contact Numbers'
      ImageIndex = 1
      object cntrlistNumber: TControlList
        Left = 0
        Top = 32
        Width = 808
        Height = 503
        Align = alClient
        ItemHeight = 40
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
        ExplicitWidth = 821
        ExplicitHeight = 514
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
          Left = 467
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
          Left = 726
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
          Left = 762
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
          Left = 690
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
          Left = 654
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
        Width = 808
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
        ExplicitWidth = 821
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
        Width = 808
        Height = 503
        Align = alClient
        ItemHeight = 40
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
        ExplicitWidth = 821
        ExplicitHeight = 514
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
          Left = 654
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
          Left = 690
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
          Left = 726
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
          Left = 762
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
          Left = 467
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
        Width = 808
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
        ExplicitWidth = 821
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
        Width = 808
        Height = 503
        Align = alClient
        ItemHeight = 40
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
        ExplicitWidth = 821
        ExplicitHeight = 514
        object lblCreatedOnEmail: TLabel
          AlignWithMargins = True
          Left = 467
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
          Left = 654
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
          Left = 690
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
          Left = 726
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
          Left = 762
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
        Width = 808
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
        ExplicitWidth = 821
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
        Width = 808
        Height = 503
        Align = alClient
        ItemHeight = 40
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
        ExplicitWidth = 821
        ExplicitHeight = 514
        object btnDownAddr: TControlListButton
          AlignWithMargins = True
          Left = 654
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
          Left = 690
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
          Left = 726
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
          Left = 762
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
          Left = 647
          Top = 3
          Width = 4
          Height = 34
          Align = alRight
          Layout = tlCenter
          ExplicitLeft = 660
          ExplicitHeight = 21
        end
      end
      object StackPanel1: TStackPanel
        Left = 0
        Top = 0
        Width = 808
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
        ExplicitWidth = 821
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
        Width = 808
        Height = 503
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
          Left = 762
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
          Left = 726
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
          ExplicitLeft = 739
          ExplicitTop = 4
        end
        object btnUpCustContact: TControlListButton
          AlignWithMargins = True
          Left = 690
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
          ExplicitLeft = 703
          ExplicitTop = 4
        end
        object btnDownCustContact: TControlListButton
          AlignWithMargins = True
          Left = 654
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
          AlignWithMargins = True
          Left = 6
          Top = 3
          Width = 468
          Height = 34
          Margins.Left = 6
          Align = alClient
          AutoSize = False
          Layout = tlCenter
          ExplicitLeft = 24
          ExplicitTop = 8
          ExplicitWidth = 409
          ExplicitHeight = 21
        end
        object Label2: TLabel
          AlignWithMargins = True
          Left = 480
          Top = 3
          Width = 171
          Height = 34
          Align = alRight
          AutoSize = False
          Layout = tlCenter
          ExplicitLeft = 463
          ExplicitTop = 4
          ExplicitHeight = 21
        end
      end
      object StackPanel4: TStackPanel
        Left = 0
        Top = 0
        Width = 808
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = vimgVisCC
          end
          item
            Control = vimgNewCC
          end
          item
            Control = vimgDeleteCC
          end
          item
            Control = vimgCopyCC
          end>
        Orientation = spoHorizontal
        TabOrder = 1
        ExplicitWidth = 821
        object vimgVisCC: TVirtualImage
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
        object vimgNewCC: TVirtualImage
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
        object vimgDeleteCC: TVirtualImage
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
        object vimgCopyCC: TVirtualImage
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
      object cntlistHRSiteZones: TControlList
        Left = 0
        Top = 32
        Width = 808
        Height = 503
        Align = alClient
        ItemHeight = 40
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
        object lblHRSiteZone: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 3
          Width = 4
          Height = 34
          Margins.Left = 6
          Align = alLeft
          Layout = tlCenter
          ExplicitHeight = 21
        end
        object lblHRZone: TLabel
          AlignWithMargins = True
          Left = 19
          Top = 3
          Width = 4
          Height = 34
          Margins.Left = 6
          Align = alLeft
          Layout = tlCenter
          ExplicitLeft = 291
          ExplicitHeight = 21
        end
      end
      object StackPanel5: TStackPanel
        Left = 0
        Top = 0
        Width = 808
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = vimgVisSiteZone
          end>
        Orientation = spoHorizontal
        TabOrder = 1
        ExplicitTop = 8
        object vimgVisSiteZone: TVirtualImage
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
      object cntrlistHRTimeSheet: TControlList
        Left = 0
        Top = 49
        Width = 808
        Height = 486
        Align = alClient
        ItemHeight = 40
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
        ExplicitTop = 50
        object lblInspectOIDTS: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 3
          Width = 51
          Height = 34
          Margins.Left = 6
          Align = alLeft
          AutoSize = False
          Layout = tlCenter
        end
        object lblSiteAddrTS: TLabel
          AlignWithMargins = True
          Left = 66
          Top = 3
          Width = 391
          Height = 34
          Margins.Left = 6
          Align = alLeft
          AutoSize = False
          Layout = tlCenter
        end
        object lblStartTS: TLabel
          AlignWithMargins = True
          Left = 466
          Top = 3
          Width = 90
          Height = 34
          Margins.Left = 6
          Align = alLeft
          AutoSize = False
          Layout = tlCenter
        end
        object lblEndTS: TLabel
          AlignWithMargins = True
          Left = 565
          Top = 3
          Width = 90
          Height = 34
          Margins.Left = 6
          Align = alLeft
          AutoSize = False
          Layout = tlCenter
        end
      end
      object StackPanel7: TStackPanel
        Left = 0
        Top = 0
        Width = 808
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = vimgVisTimeSheet
          end>
        TabOrder = 1
        ExplicitWidth = 821
        object vimgVisTimeSheet: TVirtualImage
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
      object HeaderControl1: THeaderControl
        Left = 0
        Top = 32
        Width = 808
        Height = 17
        Sections = <
          item
            Alignment = taCenter
            ImageIndex = -1
            Text = 'ID'
            Width = 60
          end
          item
            AutoSize = True
            ImageIndex = -1
            Text = 'SITE ADDRESS'
            Width = 400
          end
          item
            ImageIndex = -1
            Text = 'PUNCH IN'
            Width = 100
          end
          item
            ImageIndex = -1
            Text = 'PUNCH OUT '
            Width = 100
          end>
        ExplicitLeft = 408
        ExplicitTop = 256
        ExplicitWidth = 0
      end
    end
  end
  object bindlistHR: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 364
    Top = 245
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
    object LinkPropertyToFieldCaption13: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustContact
      FieldName = 'CustNumber'
      Component = Label2
      ComponentProperty = 'Caption'
    end
    object LinkGridToDataSourceBindSourceDB16: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcSiteZone
      GridControl = cntlistHRSiteZones
      Columns = <>
    end
    object LinkPropertyToFieldCaption14: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcSiteZone
      FieldName = 'Address'
      Component = lblHRSiteZone
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption15: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcSiteZone
      FieldName = 'Zone'
      Component = lblHRZone
      ComponentProperty = 'Caption'
    end
    object LinkGridToDataSourceBindSourceDB17: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcTimeSheet
      GridControl = cntrlistHRTimeSheet
      Columns = <>
    end
    object LinkPropertyToFieldCaption16: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcTimeSheet
      FieldName = 'InspectionOrderID'
      Component = lblInspectOIDTS
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption17: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcTimeSheet
      FieldName = 'SiteAddr'
      Component = lblSiteAddrTS
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption18: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcTimeSheet
      FieldName = 'StartDT'
      Component = lblStartTS
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption19: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcTimeSheet
      FieldName = 'EndDT'
      Component = lblEndTS
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
    Left = 248
    Top = 392
  end
  object bindsrcSiteZone: TBindSourceDB
    DataSet = HRData.qrySiteZone
    ScopeMappings = <>
    Left = 360
    Top = 392
  end
  object bindsrcTimeSheet: TBindSourceDB
    DataSet = HRData.qryTimeSheet
    ScopeMappings = <>
    Left = 464
    Top = 392
  end
end
