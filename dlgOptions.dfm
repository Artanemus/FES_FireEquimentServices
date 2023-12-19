object Options: TOptions
  Left = 0
  Top = 0
  Caption = 'Options'
  ClientHeight = 593
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 21
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 746
    Height = 65
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 544
    Width = 746
    Height = 49
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 395
    ExplicitWidth = 626
    object Button1: TButton
      Left = 323
      Top = 10
      Width = 75
      Height = 28
      Caption = 'OK'
      TabOrder = 0
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 65
    Width = 746
    Height = 479
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Inspection Globals'
      object Label1: TLabel
        Left = 63
        Top = 32
        Width = 119
        Height = 21
        Alignment = taRightJustify
        Caption = 'Number of levels'
      end
      object Label2: TLabel
        Left = 114
        Top = 67
        Width = 68
        Height = 21
        Alignment = taRightJustify
        Caption = 'Start level'
      end
      object Label3: TLabel
        Left = 18
        Top = 102
        Width = 164
        Height = 21
        Alignment = taRightJustify
        Caption = 'Folder for batch reports'
      end
      object Label4: TLabel
        Left = 38
        Top = 139
        Width = 144
        Height = 21
        Alignment = taRightJustify
        Caption = 'Pay on site threshold'
      end
      object Edit1: TEdit
        Left = 208
        Top = 29
        Width = 65
        Height = 29
        TabOrder = 0
        Text = 'Edit1'
      end
      object Edit2: TEdit
        Left = 208
        Top = 64
        Width = 65
        Height = 29
        TabOrder = 1
        Text = 'Edit1'
      end
      object Edit3: TEdit
        Left = 208
        Top = 99
        Width = 505
        Height = 29
        TabOrder = 2
        Text = 'Edit1'
      end
      object Button4: TButton
        Left = 592
        Top = 134
        Width = 121
        Height = 34
        Caption = 'Browse'
        ImageIndex = 0
        ImageName = 'open_in_browser'
        Images = VirtualImageList1
        TabOrder = 3
      end
      object Edit4: TEdit
        Left = 208
        Top = 134
        Width = 65
        Height = 29
        TabOrder = 4
        Text = 'Edit1'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Equipment Configuration'
      ImageIndex = 1
      object Label5: TLabel
        Left = 16
        Top = 16
        Width = 668
        Height = 21
        Caption = 
          'If the equipment doesn'#39't have a minor or major life cycle - ente' +
          'r zero. All fields must have values.'
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 56
        Width = 689
        Height = 369
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Email Setup'
      ImageIndex = 2
      object Label6: TLabel
        Left = 64
        Top = 16
        Width = 126
        Height = 21
        Alignment = taRightJustify
        Caption = 'SMTP Host Name '
      end
      object Label7: TLabel
        Left = 118
        Top = 43
        Width = 72
        Height = 21
        Alignment = taRightJustify
        Caption = 'SMTP Port'
      end
      object Label8: TLabel
        Left = 81
        Top = 70
        Width = 109
        Height = 21
        Alignment = taRightJustify
        Caption = 'SMTP AuthType'
      end
      object Label9: TLabel
        Left = 71
        Top = 97
        Width = 119
        Height = 21
        Alignment = taRightJustify
        Caption = 'SMTP AuthName'
      end
      object Label10: TLabel
        Left = 47
        Top = 124
        Width = 143
        Height = 21
        Alignment = taRightJustify
        Caption = 'SMTP AuthPassword'
      end
      object Label11: TLabel
        Left = 81
        Top = 151
        Width = 109
        Height = 21
        Alignment = taRightJustify
        Caption = 'SMTP AuthUser'
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
      end>
    Left = 368
    Top = 304
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
    Left = 368
    Top = 360
  end
end
