object Postcode: TPostcode
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pick Postcode'
  ClientHeight = 827
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 786
    Width = 633
    Height = 41
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 143
    ExplicitWidth = 215
    object btnOk: TButton
      Left = 275
      Top = 7
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 10
    Top = 59
    Width = 613
    Height = 717
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsPostcode
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PostcodeID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Postcode'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Suburb'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Zone'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 633
    Height = 49
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 14
      Width = 138
      Height = 21
      Caption = 'Search for postcode'
    end
    object SpeedButton3: TSpeedButton
      Left = 275
      Top = 8
      Width = 32
      Height = 32
      ImageIndex = 0
      ImageName = 'backspace'
      Images = VirtualImageList1
      Flat = True
    end
    object Edit1: TEdit
      Left = 168
      Top = 10
      Width = 101
      Height = 29
      TabOrder = 0
      Text = 'Edit1'
    end
  end
  object qryPostcode: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Active = True
    Connection = FES.fesConnection
    SQL.Strings = (
      
        'SELECT dbo.Postcode.PostcodeID, dbo.Postcode.Postcode, dbo.Postc' +
        'ode.Suburb, dbo.Postcode.Zone'
      'FROM dbo.Postcode;'
      '')
    Left = 376
    Top = 256
    object qryPostcodePostcodeID: TFDAutoIncField
      FieldName = 'PostcodeID'
      Origin = 'PostcodeID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryPostcodePostcode: TIntegerField
      Alignment = taCenter
      DisplayWidth = 8
      FieldName = 'Postcode'
      Origin = 'Postcode'
    end
    object qryPostcodeSuburb: TWideStringField
      DisplayWidth = 26
      FieldName = 'Suburb'
      Origin = 'Suburb'
      Size = 50
    end
    object qryPostcodeZone: TWideStringField
      DisplayWidth = 30
      FieldName = 'Zone'
      Origin = 'Zone'
      Size = 50
    end
  end
  object dsPostcode: TDataSource
    DataSet = qryPostcode
    Left = 464
    Top = 256
  end
  object ImageCollection1: TImageCollection
    Images = <
      item
        Name = 'backspace'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000259494441546843ED983D6856311486
              9F8A9B74111D954EB520B5631D95769082204A5DDA599D1D04271D050747954E
              15275BE8E2AAB8087670D34117E72222B8D441D0BE90C025CDBDF7BBC909127A
              B37C1F2427F77DCE3939F999A2F23655B97E4680FF1DC131026304323D30A650
              C38197329D19337FD737676E04568175600938D1F7B184FEEFC00E70BBCD3607
              40E25F25884A35896A4D05B8E63C932A26C5EE11703F344C013805BC05E65354
              64D87C01E62C009E02778289F6806703C4FD7563E540FDF78EF4FFFDEF8360CE
              430E1F1A8135E06544E8F50229F5F000CE146006F8089C0C001E03F706787FD2
              A1E600F2BC22D06CBBC0C50E45AA545B3D8ADBC69802DC029E478468217F6A11
              A8122B71373B207C2916A4C6359B19C0F9169182DAE811EFBB6310E13E124298
              017C001603A1DBCEBB31FD37DC06772CE86C42B46D82CD312600B149F6DD42FE
              DD91DB2B0E223C5EF83489EDE06194B201E475793F6CCBC09B094AC96507A18D
              AFAFC5522C1BE047A4643E01EEF6A969F4AB42C9DB673A6CDA16791640AC647E
              05CE0D10EF872E3888D9886D57853ADA007256D5292480528BF80F70BCA3C4FA
              AEAC14EA9A24B78C0A601398EE813001D0374A6C64578017C0E90E0833805247
              093D022812671DC46B771E5284D5CC003459A9C39CD69922F1F3E0A87E15D025
              DE740D34235CEA38AD7DE217F02D4827D30868EEEA2F3482A8FA4AE9236C71A9
              9FF444627A27F61FADFE594520553F6CF94854FDB4D88450FD5629BC3069620F
              18F719785FEA7177808E724387BECC95539238F30890E83833B3310266AE4C9C
              688C40A2E3CCCCAA8FC03F65EE8C31198766BA0000000049454E44AE426082}
          end>
      end>
    Left = 304
    Top = 416
  end
  object VirtualImageList1: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'backspace'
        Name = 'backspace'
      end>
    ImageCollection = ImageCollection1
    Width = 32
    Height = 32
    Left = 424
    Top = 416
  end
end
