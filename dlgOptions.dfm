object Options: TOptions
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FES Options'
  ClientHeight = 575
  ClientWidth = 849
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 526
    Width = 849
    Height = 49
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 523
    ExplicitWidth = 847
    DesignSize = (
      849
      47)
    object Button1: TButton
      Left = 749
      Top = 9
      Width = 75
      Height = 28
      Anchors = [akTop, akRight]
      Caption = 'Close'
      TabOrder = 0
      ExplicitLeft = 747
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 849
    Height = 526
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 847
    ExplicitHeight = 523
    object TabSheet1: TTabSheet
      Caption = 'Inspection Globals'
      object Label3: TLabel
        Left = 18
        Top = 52
        Width = 164
        Height = 21
        Alignment = taRightJustify
        Caption = 'Folder for batch reports'
      end
      object Label4: TLabel
        Left = 28
        Top = 19
        Width = 154
        Height = 21
        Alignment = taRightJustify
        Caption = #39'Pay on Site'#39' threshold'
      end
      object SpeedButton1: TSpeedButton
        Left = 295
        Top = 14
        Width = 26
        Height = 26
        ImageIndex = 0
        ImageName = 'info'
        Images = VirtualImageList2
        Flat = True
      end
      object Edit3: TEdit
        Left = 208
        Top = 49
        Width = 505
        Height = 29
        TabOrder = 0
        Text = 'Edit1'
      end
      object Button4: TButton
        Left = 592
        Top = 84
        Width = 121
        Height = 34
        Caption = 'Browse'
        ImageIndex = 0
        ImageName = 'open_in_browser'
        Images = VirtualImageList1
        TabOrder = 1
      end
      object Edit4: TEdit
        Left = 208
        Top = 14
        Width = 81
        Height = 29
        TabOrder = 2
        Text = 'Edit1'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Equipment Types'
      ImageIndex = 1
      object RelativePanel1: TRelativePanel
        Left = 0
        Top = 0
        Width = 841
        Height = 490
        ControlCollection = <
          item
            Control = DBGrid1
            AlignBottomWithPanel = True
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
            Below = Panel2
          end
          item
            Control = DBNavigator1
            AlignBottomWithPanel = True
            AlignHorizontalCenterWithPanel = True
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = Panel2
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end>
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 839
        ExplicitHeight = 487
        DesignSize = (
          841
          490)
        object DBGrid1: TDBGrid
          AlignWithMargins = True
          Left = 10
          Top = 47
          Width = 821
          Height = 387
          Margins.Left = 10
          Margins.Right = 10
          Margins.Bottom = 100
          DataSource = dsEquipmentType
          Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -16
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'EquipTypeID'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Caption'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ShortCaption'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MinorLifeCycle'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MajorLifeCycle'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NumOfLevels'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ServiceInterval'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CoreGroupID'
              Visible = True
            end>
        end
        object DBNavigator1: TDBNavigator
          AlignWithMargins = True
          Left = 225
          Top = 443
          Width = 390
          Height = 44
          Anchors = []
          TabOrder = 1
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 841
          Height = 44
          BevelOuter = bvNone
          TabOrder = 2
          object Label5: TLabel
            Left = 40
            Top = 18
            Width = 15
            Height = 21
            Caption = 'ID'
          end
          object Label12: TLabel
            Left = 85
            Top = 18
            Width = 115
            Height = 21
            Caption = 'Equipment  Type'
          end
          object Label13: TLabel
            Left = 248
            Top = 18
            Width = 47
            Height = 21
            Caption = 'ABREV'
          end
          object Label14: TLabel
            Left = 328
            Top = 2
            Width = 71
            Height = 42
            Alignment = taCenter
            Caption = 'Minor Life Cycle'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object Label15: TLabel
            Left = 424
            Top = 2
            Width = 74
            Height = 42
            Alignment = taCenter
            Caption = 'Major Life Cycle'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object Label16: TLabel
            Left = 520
            Top = 2
            Width = 62
            Height = 42
            Alignment = taCenter
            Caption = 'Number of Levels'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object Label17: TLabel
            Left = 625
            Top = 2
            Width = 52
            Height = 42
            Alignment = taCenter
            Caption = 'Service Interval'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object Label18: TLabel
            Left = 713
            Top = -1
            Width = 63
            Height = 42
            Alignment = taCenter
            Caption = 'Core Group ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object SpeedButton2: TSpeedButton
            Left = 775
            Top = -1
            Width = 26
            Height = 26
            ImageIndex = 0
            ImageName = 'info'
            Images = VirtualImageList2
            Flat = True
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Email Setup'
      ImageIndex = 2
      object Label6: TLabel
        Left = 88
        Top = 24
        Width = 126
        Height = 21
        Alignment = taRightJustify
        Caption = 'SMTP Host Name '
      end
      object Label7: TLabel
        Left = 142
        Top = 65
        Width = 72
        Height = 21
        Alignment = taRightJustify
        Caption = 'SMTP Port'
      end
      object Label8: TLabel
        Left = 105
        Top = 106
        Width = 109
        Height = 21
        Alignment = taRightJustify
        Caption = 'SMTP AuthType'
      end
      object Label9: TLabel
        Left = 95
        Top = 147
        Width = 119
        Height = 21
        Alignment = taRightJustify
        Caption = 'SMTP AuthName'
      end
      object Label10: TLabel
        Left = 71
        Top = 188
        Width = 143
        Height = 21
        Alignment = taRightJustify
        Caption = 'SMTP AuthPassword'
      end
      object Label11: TLabel
        Left = 105
        Top = 230
        Width = 109
        Height = 21
        Alignment = taRightJustify
        Caption = 'SMTP AuthUser'
      end
      object Edit5: TEdit
        Left = 220
        Top = 21
        Width = 493
        Height = 29
        TabOrder = 0
        Text = 'Edit5'
      end
      object Edit6: TEdit
        Left = 220
        Top = 62
        Width = 125
        Height = 29
        TabOrder = 1
        Text = 'Edit5'
      end
      object ComboBox1: TComboBox
        Left = 220
        Top = 103
        Width = 189
        Height = 29
        TabOrder = 2
        Text = 'ComboBox1'
      end
      object Edit7: TEdit
        Left = 220
        Top = 144
        Width = 397
        Height = 29
        TabOrder = 3
        Text = 'Edit7'
      end
      object Edit8: TEdit
        Left = 220
        Top = 185
        Width = 397
        Height = 29
        TabOrder = 4
        Text = 'Edit8'
      end
      object Edit9: TEdit
        Left = 220
        Top = 227
        Width = 397
        Height = 29
        TabOrder = 5
        Text = 'Edit9'
      end
    end
  end
  object ImageCollection1: TImageCollection
    Images = <
      item
        Name = 'open_in_browser'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000019E494441546843ED99414E03310C45
              7F4F4325B8011B7A04167004903801ACA02B3801121C01161C0136DC0024380D
              6075228D527B12878E3D05CFA6522799FCE7EFC69D78862DBF665BAE1F01E0ED
              E09F77E00EC03E805DA748BF037805702AAD3FE4C0979368955609E01AC0F9C4
              006E005CE49A24800F003B1303F80430AF05985AFA24DD6B01971C088091D2EF
              FF3AB0FC89E8D54851951E4BEB5D66379B1D088006F7C2817ED0228522855611
              885D489B090FDD8463EDC4AEEEB8D601127FD4097F04A08570DD46FBE253F0B5
              106E009CF81608178021F15A0873801AF11A0853008DF85A08338016F1351026
              009278DA71D216DA179B7F47F7A4DDC90D8004DD0278CE8AD702C09900C6D508
              1300D2C815AC0301E04518CF156A338004419F29924300DC7877805C4009A0E6
              AF91A90301C058120EFCE69D7892BF810444E7A6D2996A3AFC2A01D41E9235BF
              D0BC357665125809808A1C8DD15CD4ADD9CB274891A4D6D289E6E9DDD83101EE
              B956D3A65B4C6302B05A4B5D4A6A351D2ABA359B06A0AECC13D75A4AD9510268
              C822DB2901601BEFF5D5C2016F07BE014ADB9D31739892E60000000049454E44
              AE426082}
          end>
      end
      item
        Name = 'info'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000042D494441546843ED9949C84F5118C6
              7FDF0A1B36A6CC45C40211628385B9C8B86161DCA00C8594858512CA50D81817
              6C8C51E6053684080B22CA9C69C3062BEEA37B75BED339F79E73EFFDD357DE3A
              FDFBBE7BCE7BCF7386F77DDEE736D1C2ADA985CF9FFF00D21D6C0F8C056603BD
              80764653972F467B011C07AE029FAB9E80AA3BB008989AB63273390BA81D2833
              5863CA029890ACE82A40BF75D8A564C77600FA8DB258001D80CD8056BE11A69D
              580F7C0A751E03600CB00FE853E0FC4D02F035A05F3559B7B4754F7FF35C3C03
              9600D742408402580AECC971F82E017604380A3C2C78F140602E300FE892D377
              19B0B708440880E9C0298F234DF6603AF1D888A2C825200B13FF02E5B219C0E9
              3C104500FA038F3C0E140A97031F8B56A9E0794760771A825D5D07008F7D3EF2
              00B4052E00A31C835702BB2A4EDC1EBE02D8E9F0790398047C75BD2F0FC07E4F
              B429DAB5AAB87E3A1C283A2D8E01A0F87ED131603C70A5EA0C0BC68F4B76FDB2
              A3CF44579EF0ADA6266F27A96DC0DA88C9F7362EA72EFBF388B15B8135567F25
              398168662E004A523A3EA6DD4FB8CB68DF39F44CEC810560500400DDBFEBC060
              6B8C8E5133DAE102703EBD34E6D8D84B3B04B86BBD7C68C299EE4580705D6A05
              95C9A60F1B8042DA07EB254A525ABD9838AF151403354D0CD519493CA09427B4
              8B76B2EB64866E1BC0823431993E751ED745AC5CD6D58C62DE2852E0778BE3DE
              29F11DCAC6D9004E00332DA75AFD227AE09B47ABF4C18F120BA021CAD0DA05D3
              4E02B37C006E03C38CDE6F03C857C9B9050F1321EC6AF4BE030CF7017802F435
              3A0BD088E05735A6E32D73C2C053A09F0FC07B40972433112911AA32A6925114
              DCF7AE509F229222949929C874F639FD06B4363A8B9BA8F22A63750150A5A630
              9ED977A04D28000D5E5D66F669D15EC70E6CB7163117807D844499E7FC6300C7
              2CAA9D7B84EC4B7CD343A74330D5758444A7471A2FCCBDC476185508531D5BC6
              EA02A0FA5A357566B961D4DE2E0D2A9BC8EA00E04A64CD8EB59D89A5AC098469
              65A9441D005C54427752207E9B0D4004CAD664CA9039F9AE0AC047E6A44DFD21
              962E3A7DC62115C6D2E93A00B8E8B464C869E6F1082D6844E654EAC528105576
              40B45EA5AB2DB704153402E82A296373421500AE60125C520A80AFA88F394A1B
              AD6060FFED0BCD3E7925AAA897F3162DAB08806EBBB2A04BCC6D84BCE2935324
              F64A5C732AD6452295C898CEB2CB24B36C8AAC735D7E543F6F70C828595F7DF9
              F12AD54500E4244F9996DC72B8A2B83BDF219F64932F54A84300C8599E42ADE7
              8D90D70B95695726F64506FD5F4AB52EB64BEC35C7A98ECEDACBF441CFB4AE55
              6D6BD6B7AEF7E9DE29DE7B15E9A244960742E7550546233F31A9800AD68F428F
              900DAAC57EE4B3816827A42349BF2F63920AA5F3FCF5CFACF664C55DA6A4AD47
              C187EE5789F6742E6D31DCCAB940658F5099D56EC898FF001AB2AC114E7F01F4
              CCD431E8E585640000000049454E44AE426082}
          end>
      end>
    Left = 240
    Top = 472
  end
  object VirtualImageList1: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'open_in_browser'
        Name = 'open_in_browser'
      end>
    ImageCollection = ImageCollection1
    Width = 32
    Height = 32
    Left = 240
    Top = 416
  end
  object qryEquipmentType: TFDQuery
    IndexFieldNames = 'EquipTypeID'
    Connection = FES.fesConnection
    UpdateOptions.UpdateTableName = 'IDFES..EquipType'
    UpdateOptions.KeyFields = 'EquipTypeID'
    SQL.Strings = (
      'SELECT [EquipTypeID]'
      '      ,[Caption]'
      '      ,[MinorInterval]'
      '      ,[MajorInterval]'
      '      ,[EnableRules]'
      '      ,[RuleMinorLevel]'
      '      ,[RuleMajorLevel]'
      '  FROM [dbo].[EquipType]')
    Left = 80
    Top = 416
    object qryEquipmentTypeEquipTypeID: TFDAutoIncField
      DisplayLabel = 'ID'
      DisplayWidth = 6
      FieldName = 'EquipTypeID'
      Origin = 'EquipTypeID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryEquipmentTypeCaption: TWideStringField
      DisplayLabel = 'Equipment Type'
      DisplayWidth = 16
      FieldName = 'Caption'
      Origin = 'Caption'
      Size = 50
    end
    object qryEquipmentTypeShortCaption: TWideStringField
      DisplayLabel = 'ABREV'
      DisplayWidth = 9
      FieldName = 'ShortCaption'
      Origin = 'ShortCaption'
      Size = 50
    end
    object qryEquipmentTypeMinorLifeCycle: TFloatField
      FieldName = 'MinorLifeCycle'
      Origin = 'MinorLifeCycle'
    end
    object qryEquipmentTypeMajorLifeCycle: TFloatField
      FieldName = 'MajorLifeCycle'
      Origin = 'MajorLifeCycle'
    end
    object qryEquipmentTypeNumOfLevels: TIntegerField
      FieldName = 'NumOfLevels'
      Origin = 'NumOfLevels'
    end
    object qryEquipmentTypeServiceInterval: TFloatField
      FieldName = 'ServiceInterval'
      Origin = 'ServiceInterval'
    end
    object qryEquipmentTypeCoreGroupID: TIntegerField
      FieldName = 'CoreGroupID'
      Origin = 'CoreGroupID'
    end
  end
  object dsEquipmentType: TDataSource
    DataSet = qryEquipmentType
    Left = 80
    Top = 472
  end
  object VirtualImageList2: TVirtualImageList
    Images = <
      item
        CollectionIndex = 1
        CollectionName = 'info'
        Name = 'info'
      end>
    ImageCollection = ImageCollection1
    Width = 24
    Height = 24
    Left = 240
    Top = 360
  end
  object BalloonHint1: TBalloonHint
    Left = 660
    Top = 304
  end
end
