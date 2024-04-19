object FESMain: TFESMain
  Left = 0
  Top = 0
  Hint = 'A form hint'
  Caption = 'FES  v0.0.0.0'
  ClientHeight = 908
  ClientWidth = 1295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  TextHeight = 21
  object pnlHeader: TPanel
    Left = 0
    Top = 31
    Width = 1295
    Height = 42
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      1295
      42)
    object vimageLogo: TVirtualImage
      Left = 14
      Top = 6
      Width = 32
      Height = 32
      Hint = 'Generic Logo used by FES'
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 0
      ImageName = 'FES_512x512'
      ParentShowHint = False
      ShowHint = True
    end
    object lblCompanyName: TLabel
      Left = 52
      Top = 12
      Width = 113
      Height = 21
      Caption = 'Company Name'
    end
    object vimgFilters: TVirtualImage
      Left = 988
      Top = 6
      Width = 32
      Height = 32
      Anchors = [akTop, akRight]
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 69
      ImageName = 'filter\arrow_drop_down_circle'
      OnClick = vimgFiltersClick
    end
    object sbtnFilterToggle: TSpeedButton
      Left = 1026
      Top = 6
      Width = 32
      Height = 32
      Action = actnFilterToggle
      Anchors = [akTop, akRight]
      Flat = True
      Margin = 0
    end
    object StackPanel1: TStackPanel
      Left = 1064
      Top = 0
      Width = 166
      Height = 42
      Align = alRight
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = dtPicker
        end
        item
          Control = edtNumOfDays
        end>
      Orientation = spoHorizontal
      Spacing = 10
      TabOrder = 0
      DesignSize = (
        166
        42)
      object dtPicker: TDateTimePicker
        Left = 0
        Top = 6
        Width = 114
        Height = 29
        Anchors = [akTop, akRight]
        Date = 45400.000000000000000000
        Time = 0.456181666668271600
        TabOrder = 1
        OnChange = dtPickerChange
      end
      object edtNumOfDays: TEdit
        Left = 124
        Top = 6
        Width = 40
        Height = 29
        Hint = 'Number of days to display.'
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        NumbersOnly = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TextHint = 'Days'
        OnChange = edtNumOfDaysChange
      end
    end
    object StackPanel2: TStackPanel
      Left = 1230
      Top = 0
      Width = 65
      Height = 42
      Align = alRight
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = vimgDayCountInc
        end
        item
          Control = vimgDayCountDec
        end>
      TabOrder = 1
      object vimgDayCountInc: TVirtualImage
        Left = 0
        Top = 0
        Width = 32
        Height = 20
        ImageCollection = FES.imgCollection
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 85
        ImageName = 'expand_less'
        Proportional = False
        OnClick = vimgDayCountIncClick
      end
      object vimgDayCountDec: TVirtualImage
        Left = 0
        Top = 22
        Width = 32
        Height = 20
        ImageCollection = FES.imgCollection
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 86
        ImageName = 'expand_more'
        Proportional = False
        OnClick = vimgDayCountDecClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 889
    Width = 1295
    Height = 19
    Panels = <>
  end
  object ActionMainMenuBar1: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 1295
    Height = 31
    ActionManager = actnmanMain
    Caption = 'ActionMainMenuBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    HorzMargin = 10
    Spacing = 10
    VertMargin = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 73
    Width = 1295
    Height = 816
    Align = alClient
    Caption = 'frameFESPlanner'
    TabOrder = 3
    object PLAN: TDBPlanner
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 1287
      Height = 808
      ActiveDisplay = True
      Align = alClient
      AttachementGlyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888700078888888888708880788888888808808808888888880808080
        8888888880808080888888888080808088888888808080808888888880808080
        8888888880808080888888888080808088888888808080808888888888808080
        8888888888808880888888888888000888888888888888888888}
      Bands.Show = True
      Bands.ActivePrimary = 16774634
      Bands.ActiveSecondary = 16641239
      Bands.NonActivePrimary = clWhite
      Bands.NonActiveSecondary = 16382457
      Caption.Title = 'TMS software <b>TDBPlanner</b>'
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clBlack
      Caption.Font.Height = -13
      Caption.Font.Name = 'Verdana'
      Caption.Font.Style = []
      Caption.Background = clWhite
      Caption.Visible = False
      Color = clWhite
      DayNames.Strings = (
        'Sun'
        'Mon'
        'Tue'
        'Wed'
        'Thu'
        'Fri'
        'Sat')
      DefaultItem.BorderColor = 11250603
      DefaultItem.CaptionBkg = 14925219
      DefaultItem.CaptionBkgTo = 14925219
      DefaultItem.CaptionFont.Charset = DEFAULT_CHARSET
      DefaultItem.CaptionFont.Color = 4474440
      DefaultItem.CaptionFont.Height = -13
      DefaultItem.CaptionFont.Name = 'Segoe UI'
      DefaultItem.CaptionFont.Style = [fsBold]
      DefaultItem.CaptionType = ctText
      DefaultItem.CaptionText = 'Inspection Order'
      DefaultItem.ColorTo = clWhite
      DefaultItem.Cursor = -1
      DefaultItem.Font.Charset = DEFAULT_CHARSET
      DefaultItem.Font.Color = 4474440
      DefaultItem.Font.Height = -12
      DefaultItem.Font.Name = 'Segoe UI'
      DefaultItem.Font.Style = []
      DefaultItem.ItemBegin = 16
      DefaultItem.ItemEnd = 17
      DefaultItem.ItemPos = 0
      DefaultItem.Name = 'PlannerItem0'
      DefaultItem.ReadOnly = True
      DefaultItem.SelectColor = 14925219
      DefaultItem.SelectColorTo = 14925219
      DefaultItem.SelectFontColor = 3881787
      DefaultItem.Shadow = False
      DefaultItem.TrackColor = 11565130
      DefaultItem.TrackSelectColor = 11565130
      DeleteGlyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D9ED07070707
        0707070707070707ECD9EC5E5E5E5E5E5E5E5E5E5E5E5E5E5DED070D0E161616
        161616160E0E0E0E5E07070D161656561616161616160E0E5E07070D16AF075E
        56561657B7EF0E0E5E07070D56AFF6075F565FAFF6AF160E5E07070D565EAFF6
        075FEFF6AF17160E5E07070D5E5E5EAFF607F6AF161616165E07070D5E5E5E5E
        EFF60756161616165E07070D5E5E5FEFF6EFF6075E1616165E07070D5F5F07F6
        EF5EAFF6075616165E07070D6707F6075E5656AFF60716165E07070DA7AF075F
        5E5E5E5EAFAF56165E07070DA7A7675F5F5E5E5E5E5E56165E07EDAF0D0D0D0D
        0D0D0D0D0D0D0D0D5EECD9ED070707070707070707070707EDD1}
      Display.ActiveEnd = 40
      Display.CurrentPosFrom = 1002
      Display.CurrentPosTo = 1002
      Display.ColorNonActive = clWhite
      Display.HourLineColor = 15987699
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Footer.Captions.Strings = (
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        '')
      Footer.CompletionFormat = '%d%%'
      Footer.Color = clWhite
      Footer.Completion.Font.Charset = DEFAULT_CHARSET
      Footer.Completion.Font.Color = clWindowText
      Footer.Completion.Font.Height = -12
      Footer.Completion.Font.Name = 'Arial'
      Footer.Completion.Font.Style = []
      Footer.Flat = True
      Footer.Font.Charset = DEFAULT_CHARSET
      Footer.Font.Color = clWindowText
      Footer.Font.Height = -12
      Footer.Font.Name = 'Segoe UI'
      Footer.Font.Style = []
      Footer.LineColor = 16444643
      GridLeftCol = 1
      GridLineColor = 15987699
      GridTopRow = 10
      Header.Alignment = taCenter
      Header.AllowResize = True
      Header.Captions.Strings = (
        ''
        '22 Jul 2021'
        '23 Jul 2021'
        '24 Jul 2021'
        '25 Jul 2021'
        '26 Jul 2021'
        '27 Jul 2021'
        '28 Jul 2021')
      Header.Color = clWhite
      Header.ColorTo = clNone
      Header.CustomGroups = <>
      Header.Flat = True
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clBlack
      Header.Font.Height = -13
      Header.Font.Name = 'Segoe UI'
      Header.Font.Style = [fsBold]
      Header.GroupHeight = 0
      Header.GroupFont.Charset = DEFAULT_CHARSET
      Header.GroupFont.Color = clWindowText
      Header.GroupFont.Height = -12
      Header.GroupFont.Name = 'Segoe UI'
      Header.GroupFont.Style = []
      Header.LineColor = 15987699
      Header.ResizeAll = False
      HintPause = 2500
      HTMLOptions.CellFontStyle = []
      HTMLOptions.HeaderFontStyle = []
      HTMLOptions.SidebarFontStyle = []
      Items = <
        item
          BorderColor = 11250603
          CaptionBkg = 14925219
          CaptionBkgTo = 14925219
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = 4474440
          CaptionFont.Height = -13
          CaptionFont.Name = 'Segoe UI'
          CaptionFont.Style = [fsBold]
          CaptionType = ctText
          CaptionText = '21 Completed'
          ColorTo = clWhite
          Cursor = -1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4474440
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemBegin = 18
          ItemEnd = 34
          ItemPos = 5
          Name = 'PlannerItem0'
          ReadOnly = True
          SelectColor = 14925219
          SelectColorTo = 14925219
          SelectFontColor = 3881787
          Shadow = False
          Text.Strings = (
            'Meaning To Stop'
            ''
            '50 Forest Hill - Fernvale Road'
            'FOREST HILL, QLD 4342'
            ''
            'TECH:Mitchell BELL')
          TrackColor = 11565130
          TrackSelectColor = 11565130
        end
        item
          BorderColor = 11250603
          CaptionBkg = 14925219
          CaptionBkgTo = 14925219
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = 4474440
          CaptionFont.Height = -13
          CaptionFont.Name = 'Segoe UI'
          CaptionFont.Style = [fsBold]
          CaptionType = ctText
          CaptionText = '57 Completed'
          ColorTo = clWhite
          Cursor = -1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4474440
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemBegin = 18
          ItemEnd = 35
          ItemPos = 4
          Name = 'PlannerItem0'
          ReadOnly = True
          SelectColor = 14925219
          SelectColorTo = 14925219
          SelectFontColor = 3881787
          Shadow = False
          Text.Strings = (
            'Free Range Kids - Gatton'
            ''
            '5391 Warrego Highway'
            'GATTON, QLD 4343')
          TrackColor = 11565130
          TrackSelectColor = 11565130
        end
        item
          BorderColor = 11250603
          CaptionBkg = 14925219
          CaptionBkgTo = 14925219
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = 4474440
          CaptionFont.Height = -13
          CaptionFont.Name = 'Segoe UI'
          CaptionFont.Style = [fsBold]
          CaptionType = ctText
          CaptionText = '1036 Completed'
          ColorTo = clWhite
          Cursor = -1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4474440
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemBegin = 14
          ItemEnd = 24
          ItemPos = 4
          Name = 'PlannerItem0'
          ReadOnly = True
          SelectColor = 14925219
          SelectColorTo = 14925219
          SelectFontColor = 3881787
          Shadow = False
          Text.Strings = (
            'Allys Kindy'
            ''
            '68 Woodford Street'
            'ONE MILE, QLD 4305'
            '')
          TrackColor = 11565130
          TrackSelectColor = 11565130
        end
        item
          BorderColor = 11250603
          CaptionBkg = 14925219
          CaptionBkgTo = 14925219
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = 4474440
          CaptionFont.Height = -13
          CaptionFont.Name = 'Segoe UI'
          CaptionFont.Style = [fsBold]
          CaptionType = ctText
          CaptionText = '1043 Completed'
          ColorTo = clWhite
          Cursor = -1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4474440
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemBegin = 25
          ItemEnd = 39
          ItemPos = 4
          Name = 'PlannerItem0'
          ReadOnly = True
          SelectColor = 14925219
          SelectColorTo = 14925219
          SelectFontColor = 3881787
          Shadow = False
          Text.Strings = (
            'Sophia College'
            ''
            '56 Otto Road'
            'PLAINLAND, QLD 4341')
          TrackColor = 11565130
          TrackSelectColor = 11565130
        end
        item
          BorderColor = 11250603
          CaptionBkg = 14925219
          CaptionBkgTo = 14925219
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = 4474440
          CaptionFont.Height = -13
          CaptionFont.Name = 'Segoe UI'
          CaptionFont.Style = [fsBold]
          CaptionType = ctText
          CaptionText = '1192 Completed'
          ColorTo = clWhite
          Cursor = -1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4474440
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemBegin = 13
          ItemEnd = 29
          ItemPos = 1
          Name = 'PlannerItem0'
          ReadOnly = True
          SelectColor = 14925219
          SelectColorTo = 14925219
          SelectFontColor = 3881787
          Shadow = False
          Text.Strings = (
            'Savco Vegetation Services Pty Ltd'
            ''
            '134 Briggs Road'
            'RACEVIEW, QLD 4305')
          TrackColor = 11565130
          TrackSelectColor = 11565130
        end
        item
          BorderColor = 11250603
          CaptionBkg = 14925219
          CaptionBkgTo = 14925219
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = 4474440
          CaptionFont.Height = -13
          CaptionFont.Name = 'Segoe UI'
          CaptionFont.Style = [fsBold]
          CaptionType = ctText
          CaptionText = '1446 Action'
          ColorTo = clWhite
          Cursor = -1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4474440
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemBegin = 18
          ItemEnd = 34
          ItemPos = 0
          Name = 'PlannerItem0'
          ReadOnly = True
          SelectColor = 14925219
          SelectColorTo = 14925219
          SelectFontColor = 3881787
          Shadow = False
          Text.Strings = (
            'Len Russell Funeral Director'
            ''
            '238 Brisbane Street'
            'WEST IPSWICH, QLD 4305')
          TrackColor = 11565130
          TrackSelectColor = 11565130
        end
        item
          BorderColor = 11250603
          CaptionBkg = 14925219
          CaptionBkgTo = 14925219
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = 4474440
          CaptionFont.Height = -13
          CaptionFont.Name = 'Segoe UI'
          CaptionFont.Style = [fsBold]
          CaptionType = ctText
          CaptionText = '1448 Action'
          ColorTo = clWhite
          Cursor = -1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4474440
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemBegin = 30
          ItemEnd = 38
          ItemPos = 1
          Name = 'PlannerItem0'
          ReadOnly = True
          SelectColor = 14925219
          SelectColorTo = 14925219
          SelectFontColor = 3881787
          Shadow = False
          Text.Strings = (
            'Plasvacc Pty Ltd'
            ''
            '6066 Cunningham Highway'
            'KALBAR, QLD 4309')
          TrackColor = 11565130
          TrackSelectColor = 11565130
        end
        item
          BorderColor = 11250603
          CaptionBkg = 14925219
          CaptionBkgTo = 14925219
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = 4474440
          CaptionFont.Height = -13
          CaptionFont.Name = 'Segoe UI'
          CaptionFont.Style = [fsBold]
          CaptionType = ctText
          CaptionText = '1449 Action'
          ColorTo = clWhite
          Cursor = -1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4474440
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemBegin = 20
          ItemEnd = 36
          ItemPos = 2
          Name = 'PlannerItem0'
          ReadOnly = True
          SelectColor = 14925219
          SelectColorTo = 14925219
          SelectFontColor = 3881787
          Shadow = False
          Text.Strings = (
            'The Karalee Community Kindergarten Inc.'
            ''
            '56 Harold Summervilles Road'
            'KARALEE, QLD 4306')
          TrackColor = 11565130
          TrackSelectColor = 11565130
        end>
      Mode.Month = 7
      Mode.PeriodStartDay = 18
      Mode.PeriodStartMonth = 4
      Mode.PeriodStartYear = 2024
      Mode.PeriodEndDay = 5
      Mode.PeriodEndMonth = 6
      Mode.PeriodEndYear = 2024
      Mode.TimeLineStart = 45400.000000000000000000
      Mode.TimeLineNVUBegin = 0
      Mode.TimeLineNVUEnd = 0
      Mode.Year = 2021
      Mode.Day = 22
      Sidebar.Background = clWhite
      Sidebar.BackgroundTo = clNone
      Sidebar.Border = False
      Sidebar.BorderColor = 15987699
      Sidebar.Font.Charset = DEFAULT_CHARSET
      Sidebar.Font.Color = clBlack
      Sidebar.Font.Height = -12
      Sidebar.Font.Name = 'Arial'
      Sidebar.Font.Style = []
      Sidebar.HourFontRatio = 1.800000000000000000
      Sidebar.LineColor = 15987699
      Sidebar.Occupied = clWhite
      Sidebar.OccupiedTo = clWhite
      Sidebar.OccupiedFontColor = 3881787
      Sidebar.SeparatorLineColor = 16444643
      Sidebar.Width = 50
      Positions = 7
      PositionAutoSize = True
      PositionProps = <>
      PrintOptions.LineWidth = 0
      PrintOptions.FooterFont.Charset = DEFAULT_CHARSET
      PrintOptions.FooterFont.Color = clWindowText
      PrintOptions.FooterFont.Height = -12
      PrintOptions.FooterFont.Name = 'Segoe UI'
      PrintOptions.FooterFont.Style = []
      PrintOptions.HeaderFont.Charset = DEFAULT_CHARSET
      PrintOptions.HeaderFont.Color = clWindowText
      PrintOptions.HeaderFont.Height = -12
      PrintOptions.HeaderFont.Name = 'Segoe UI'
      PrintOptions.HeaderFont.Style = []
      ScrollSmooth = True
      ScrollSynch = True
      SelectColor = 15917525
      TrackColor = 11565130
      TrackWidth = 8
      URLGlyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888880000800
        0088888808F8F0F8F80888808000000000808880F070888070F0888080000000
        0080880408F8F0F8F80880CCC0000400008874CCC2222C4788887CCCC22226C0
        88887CC822222CC088887C822224642088887C888422C220888877CF8CCCC227
        888887F8F8222208888888776888208888888887777778888888}
      Version = '3.4.6.0'
      WheelAction = pwaScroll
      ItemSource = DAYSRC
      TMSStyle = 0
    end
  end
  object actnmanMain: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = FileConnect
                Caption = '&Connect to Database'
                ImageName = 'link_off'
              end
              item
                Action = FileExit1
                ImageIndex = 6
                ImageName = 'logout'
              end>
            Caption = '&File'
          end
          item
            Items = <
              item
                Action = actnCut
                Caption = '&Cut'
              end
              item
                Action = actnCopy
                Caption = 'C&opy'
              end
              item
                Action = actnPaste
                Caption = '&Paste'
              end
              item
                Action = actnDelete
                Caption = '&Delete'
              end
              item
                Caption = '-'
              end
              item
                Action = actnStatusPalette
                Caption = '&Status Palette...'
              end
              item
                Action = actnPrefernces
                Caption = 'P&references...'
              end>
            Caption = 'E&dit'
          end
          item
            Items = <
              item
                Action = SurveyFind
                Caption = '&Find Survey Order'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = SurveyBrowse
                Caption = '&Browse for Survey Order'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = SurveyGotoID
                Caption = '&Goto Survey Order ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Caption = '-'
              end
              item
                Action = SurveyNew
                Caption = '&Create New Survey Order'
                ImageIndex = 5
                ImageName = 'new'
              end>
            Caption = '&Survey'
          end
          item
            Items = <
              item
                Action = InspectSchedule
                Caption = '&Schedule'
                ImageIndex = 2
                ImageName = 'calendar_today'
              end
              item
                Action = InspectFindOrder
                Caption = '&Find Order'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = InspectBrowseOrders
                Caption = '&Browse for Order'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = InspectGotoOrderID
                Caption = '&Goto Order ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Action = InspectProcessOrders
                Caption = '&Process Orders'
                ImageIndex = 0
                ImageName = 'update'
              end>
            Caption = '&Inspection'
          end
          item
            Items = <
              item
                Action = SiteFind
                Caption = '&Find Site'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = SiteBrowse
                Caption = '&Browse for Site'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = SiteGotoID
                Caption = '&Goto Site ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Caption = '-'
              end
              item
                Action = actnStationEditor
                Caption = '&Edit Stations at Site'
                ImageIndex = 13
                ImageName = 'edit'
              end
              item
                Action = SiteNew
                Caption = '&Create New Site'
                ImageIndex = 5
                ImageName = 'new'
              end>
            Caption = 'Si&tes'
          end
          item
            Items = <
              item
                Action = CustFind
                Caption = '&Find Customer'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = CustBrowse
                Caption = '&Browse for Customer'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = CustGotoID
                Caption = '&Goto Customer ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Action = CustGotoCODE
                Caption = 'G&oto Customer CODE'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Action = CustNew
                Caption = '&Create New Customer'
                ImageIndex = 5
                ImageName = 'new'
              end>
            Caption = '&Customer'
          end
          item
            Items = <
              item
                Action = HRFind
                Caption = '&Find HR'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = HRBrowse
                Caption = '&Browse for HR'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = HRGotoID
                Caption = '&Goto HR ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Action = HRNew
                Caption = '&Create New HR'
                ImageIndex = 5
                ImageName = 'new'
              end>
            Caption = '&HR'
          end
          item
            Items = <
              item
                Action = EquipFind
                Caption = '&Find Equipment'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = EquipBrowse
                Caption = '&Browse Equipment'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = EquipGotoID
                Caption = '&Goto Equipment ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Action = EquipNew
                Caption = '&Create New Equipment'
                ImageIndex = 5
                ImageName = 'new'
              end>
            Caption = '&Equipment'
          end
          item
            Items = <
              item
                Action = LinkFind
                Caption = '&Find Link'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = LinkBrowse
                Caption = '&Browse Links'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = LinkGotoID
                Caption = '&Goto Link ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Action = LinkNew
                Caption = '&Create New Link'
                ImageIndex = 5
                ImageName = 'new'
              end>
            Caption = '&Link'
          end
          item
            Items = <
              item
                Action = ToolsCompanySetup
                Caption = '&Company Setup'
                ImageIndex = 8
                ImageName = 'settings'
              end
              item
                Action = ToolsOptions
                Caption = '&Options'
                ImageIndex = 10
                ImageName = 'settings_applications'
              end
              item
                Action = ToolsSystemLog
                Caption = '&System Log'
                ImageIndex = 9
                ImageName = 'description'
              end>
            Caption = 'T&ools'
          end
          item
            Items = <
              item
                Action = HelpAbout
                Caption = '&About Fire Equipment Services'
                ImageIndex = 11
                ImageName = 'info'
              end
              item
                Action = HelpWebSite
                Caption = '&FES Help'
                ImageIndex = 12
                ImageName = 'help'
              end>
            Caption = 'Hel&p'
          end>
        ActionBar = ActionMainMenuBar1
      end>
    Images = FES.imgList32x32
    Left = 728
    Top = 128
    StyleName = 'Platform Default'
    object SurveyFind: TAction
      Category = 'Survey'
      Caption = 'Find Survey Order'
      ImageIndex = 1
      ImageName = 'search'
    end
    object SurveyBrowse: TAction
      Category = 'Survey'
      Caption = 'Browse for Survey Order'
      ImageIndex = 18
      ImageName = 'open_in_browser'
    end
    object SurveyGotoID: TAction
      Category = 'Survey'
      Caption = 'Goto Survey Order ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object SurveyNew: TAction
      Category = 'Survey'
      Caption = 'Create New Survey Order'
      ImageIndex = 5
      ImageName = 'new'
    end
    object InspectSchedule: TAction
      Category = 'Inspection'
      Caption = 'Schedule'
      ImageIndex = 2
      ImageName = 'calendar_today'
    end
    object InspectFindOrder: TAction
      Category = 'Inspection'
      Caption = 'Find Order'
      ImageIndex = 1
      ImageName = 'search'
      OnExecute = InspectFindOrderExecute
      OnUpdate = GenericUpdate
    end
    object InspectBrowseOrders: TAction
      Category = 'Inspection'
      Caption = 'Browse for Order'
      ImageIndex = 18
      ImageName = 'open_in_browser'
      OnExecute = InspectBrowseOrdersExecute
      OnUpdate = GenericUpdate
    end
    object InspectGotoOrderID: TAction
      Category = 'Inspection'
      Caption = 'Goto Order ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object InspectProcessOrders: TAction
      Category = 'Inspection'
      Caption = 'Process Orders'
      ImageIndex = 0
      ImageName = 'update'
    end
    object SiteFind: TAction
      Category = 'Sites'
      Caption = 'Find Site'
      ImageIndex = 1
      ImageName = 'search'
    end
    object SiteBrowse: TAction
      Category = 'Sites'
      Caption = 'Browse for Site'
      ImageIndex = 18
      ImageName = 'open_in_browser'
    end
    object SiteGotoID: TAction
      Category = 'Sites'
      Caption = 'Goto Site ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object SiteNew: TAction
      Category = 'Sites'
      Caption = 'Create New Site'
      ImageIndex = 5
      ImageName = 'new'
    end
    object CustFind: TAction
      Category = 'Customer'
      Caption = 'Find Customer'
      ImageIndex = 1
      ImageName = 'search'
    end
    object CustBrowse: TAction
      Category = 'Customer'
      Caption = 'Browse for Customer'
      Hint = 'View Customers | View, edit, create, delete and find customers. '
      ImageIndex = 18
      ImageName = 'open_in_browser'
      OnExecute = CustBrowseExecute
      OnUpdate = GenericUpdate
    end
    object CustGotoID: TAction
      Category = 'Customer'
      Caption = 'Goto Customer ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object CustGotoCODE: TAction
      Category = 'Customer'
      Caption = 'Goto Customer CODE'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object CustNew: TAction
      Category = 'Customer'
      Caption = 'Create New Customer'
      ImageIndex = 5
      ImageName = 'new'
    end
    object HRFind: TAction
      Category = 'HR'
      Caption = 'Find HR'
      ImageIndex = 1
      ImageName = 'search'
    end
    object HRBrowse: TAction
      Category = 'HR'
      Caption = 'Browse for HR'
      ImageIndex = 18
      ImageName = 'open_in_browser'
    end
    object HRGotoID: TAction
      Category = 'HR'
      Caption = 'Goto HR ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object HRNew: TAction
      Category = 'HR'
      Caption = 'Create New HR'
      ImageIndex = 5
      ImageName = 'new'
    end
    object EquipFind: TAction
      Category = 'Equipment'
      Caption = 'Find Equipment'
      ImageIndex = 1
      ImageName = 'search'
    end
    object EquipBrowse: TAction
      Category = 'Equipment'
      Caption = 'Browse Equipment'
      ImageIndex = 18
      ImageName = 'open_in_browser'
    end
    object EquipGotoID: TAction
      Category = 'Equipment'
      Caption = 'Goto Equipment ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object EquipNew: TAction
      Category = 'Equipment'
      Caption = 'Create New Equipment'
      ImageIndex = 5
      ImageName = 'new'
    end
    object FileConnect: TAction
      Category = 'File'
      Caption = 'Connect to Database'
      ImageName = 'link_off'
    end
    object FileExit1: TFileExit
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit|Quits the application'
      ImageIndex = 6
    end
    object ToolsCompanySetup: TAction
      Category = 'Tools'
      Caption = 'Company Setup'
      ImageIndex = 8
      ImageName = 'settings'
    end
    object ToolsOptions: TAction
      Category = 'Tools'
      Caption = 'Options'
      ImageIndex = 10
      ImageName = 'settings_applications'
    end
    object ToolsSystemLog: TAction
      Category = 'Tools'
      Caption = 'System Log'
      ImageIndex = 9
      ImageName = 'description'
    end
    object LinkFind: TAction
      Category = 'Link'
      Caption = 'Find Link'
      ImageIndex = 1
      ImageName = 'search'
    end
    object LinkBrowse: TAction
      Category = 'Link'
      Caption = 'Browse Links'
      ImageIndex = 18
      ImageName = 'open_in_browser'
    end
    object LinkGotoID: TAction
      Category = 'Link'
      Caption = 'Goto Link ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object LinkNew: TAction
      Category = 'Link'
      Caption = 'Create New Link'
      ImageIndex = 5
      ImageName = 'new'
    end
    object HelpAbout: TAction
      Category = 'Help'
      Caption = 'About Fire Equipment Services'
      ImageIndex = 11
      ImageName = 'info'
    end
    object HelpWebSite: TAction
      Category = 'Help'
      Caption = 'FES Help'
      ImageIndex = 12
      ImageName = 'help'
    end
    object actnStationEditor: TAction
      Category = 'Sites'
      Caption = 'Edit Stations at Site'
      ImageIndex = 13
      ImageName = 'edit'
    end
    object actnCut: TAction
      Category = 'Edit'
      Caption = 'Cut'
    end
    object actnCopy: TAction
      Category = 'Edit'
      Caption = 'Copy'
    end
    object actnPaste: TAction
      Category = 'Edit'
      Caption = 'Paste'
    end
    object actnDelete: TAction
      Category = 'Edit'
      Caption = 'Delete'
    end
    object actnStatusPalette: TAction
      Category = 'Edit'
      Caption = 'Status Palette...'
      OnExecute = actnStatusPaletteExecute
      OnUpdate = GenericUpdate
    end
    object actnPrefernces: TAction
      Category = 'Edit'
      Caption = 'Preferences...'
    end
    object actnFilterToggle: TAction
      Category = 'Filter'
      Caption = 'Filter Toggle'
      ImageIndex = 25
      ImageName = 'filter_off'
      OnExecute = actnFilterToggleExecute
      OnUpdate = actnFilterToggleUpdate
    end
  end
  object BalloonHint1: TBalloonHint
    Left = 632
    Top = 128
  end
  object DAYSRC: TDBDaySource
    AutoIncKey = True
    DataSource = FES.dsPlannerItem
    ResourceMap = <>
    StartTimeField = 'BookIN'
    EndTimeField = 'BookOut'
    KeyField = 'InspectionOrderID'
    ReadOnly = False
    SubjectField = 'TMSCaption'
    NotesField = 'TMSNotes'
    UpdateByQuery = False
    OnFieldsToItem = DAYSRCFieldsToItem
    AutoHeaderUpdate = True
    DateFormat = 'dd mmm yyyy'
    Day = 44399.000000000000000000
    Mode = dmMultiDay
    Left = 609
    Top = 394
  end
end
