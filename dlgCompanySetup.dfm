object CompanySetup: TCompanySetup
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FES Company Setup'
  ClientHeight = 721
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 57
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    Color = clWheat
    ParentBackground = False
    TabOrder = 0
    StyleElements = [seFont, seBorder]
    object Label1: TLabel
      Left = 70
      Top = 4
      Width = 114
      Height = 21
      Caption = 'Company Setup.'
    end
    object VirtualImage1: TVirtualImage
      Left = 16
      Top = 4
      Width = 48
      Height = 48
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = -1
    end
    object Label2: TLabel
      Left = 70
      Top = 31
      Width = 113
      Height = 21
      Caption = 'Company Name'
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 57
    Width = 696
    Height = 612
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 1
    OnChanging = PageControl1Changing
    object TabSheet1: TTabSheet
      Caption = 'Details'
      object Bevel1: TBevel
        Left = 131
        Top = 194
        Width = 534
        Height = 159
      end
      object Label3: TLabel
        Left = 12
        Top = 16
        Width = 113
        Height = 21
        Alignment = taRightJustify
        Caption = 'Company Name'
      end
      object Label4: TLabel
        Left = 94
        Top = 51
        Width = 31
        Height = 21
        Alignment = taRightJustify
        Caption = 'ABN'
      end
      object Label5: TLabel
        Left = 69
        Top = 86
        Width = 56
        Height = 21
        Alignment = taRightJustify
        Caption = 'Address'
      end
      object Label6: TLabel
        Left = 205
        Top = 254
        Width = 51
        Height = 21
        Alignment = taRightJustify
        Caption = 'Suburb'
      end
      object Label7: TLabel
        Left = 194
        Top = 281
        Width = 62
        Height = 21
        Alignment = taRightJustify
        Caption = 'Postcode'
      end
      object Label8: TLabel
        Left = 398
        Top = 281
        Width = 34
        Height = 21
        Alignment = taRightJustify
        Caption = 'State'
      end
      object Label9: TLabel
        Left = 221
        Top = 308
        Width = 35
        Height = 21
        Alignment = taRightJustify
        Caption = 'Zone'
      end
      object SpeedButton1: TSpeedButton
        Left = 185
        Top = 217
        Width = 135
        Height = 31
        Caption = 'Postcode'
      end
      object SpeedButton2: TSpeedButton
        Left = 326
        Top = 217
        Width = 135
        Height = 31
        Caption = 'Suburb'
      end
      object SpeedButton3: TSpeedButton
        Left = 467
        Top = 217
        Width = 135
        Height = 31
        Caption = 'Clear'
      end
      object Label10: TLabel
        Left = 22
        Top = 396
        Width = 103
        Height = 21
        Alignment = taRightJustify
        Caption = 'Office Number'
      end
      object Label11: TLabel
        Left = 15
        Top = 431
        Width = 110
        Height = 21
        Alignment = taRightJustify
        Caption = 'Mobile Number'
      end
      object Label12: TLabel
        Left = 16
        Top = 466
        Width = 109
        Height = 21
        Alignment = taRightJustify
        Caption = 'Company Email'
      end
      object DBText1: TDBText
        Left = 275
        Top = 254
        Width = 54
        Height = 21
        AutoSize = True
        Enabled = False
      end
      object DBText2: TDBText
        Left = 275
        Top = 281
        Width = 54
        Height = 21
        AutoSize = True
        Enabled = False
      end
      object DBText3: TDBText
        Left = 275
        Top = 308
        Width = 54
        Height = 21
        AutoSize = True
        Enabled = False
      end
      object DBText4: TDBText
        Left = 438
        Top = 281
        Width = 54
        Height = 21
        AutoSize = True
        Enabled = False
      end
      object DBEdit1: TDBEdit
        Left = 131
        Top = 13
        Width = 534
        Height = 29
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 131
        Top = 48
        Width = 170
        Height = 29
        TabOrder = 1
      end
      object DBMemo1: TDBMemo
        Left = 131
        Top = 83
        Width = 534
        Height = 89
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 131
        Top = 393
        Width = 230
        Height = 29
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 131
        Top = 428
        Width = 230
        Height = 29
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 131
        Top = 463
        Width = 534
        Height = 29
        TabOrder = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Postal Address'
      ImageIndex = 1
      object Label13: TLabel
        Left = 4
        Top = 30
        Width = 56
        Height = 21
        Alignment = taRightJustify
        Caption = 'Address'
      end
      object Label14: TLabel
        Left = 92
        Top = 190
        Width = 51
        Height = 21
        Alignment = taRightJustify
        Caption = 'Suburb'
      end
      object Label15: TLabel
        Left = 81
        Top = 217
        Width = 62
        Height = 21
        Alignment = taRightJustify
        Caption = 'Postcode'
      end
      object Label16: TLabel
        Left = 285
        Top = 217
        Width = 34
        Height = 21
        Alignment = taRightJustify
        Caption = 'State'
      end
      object Label17: TLabel
        Left = 108
        Top = 244
        Width = 35
        Height = 21
        Alignment = taRightJustify
        Caption = 'Zone'
      end
      object SpeedButton4: TSpeedButton
        Left = 120
        Top = 145
        Width = 135
        Height = 31
        Caption = 'Postcode'
      end
      object SpeedButton5: TSpeedButton
        Left = 261
        Top = 145
        Width = 135
        Height = 31
        Caption = 'Suburb'
      end
      object SpeedButton6: TSpeedButton
        Left = 402
        Top = 145
        Width = 135
        Height = 31
        Caption = 'Clear'
      end
      object DBText5: TDBText
        Left = 162
        Top = 190
        Width = 54
        Height = 21
        AutoSize = True
        Enabled = False
      end
      object DBText6: TDBText
        Left = 162
        Top = 217
        Width = 54
        Height = 21
        AutoSize = True
        Enabled = False
      end
      object DBText7: TDBText
        Left = 162
        Top = 244
        Width = 54
        Height = 21
        AutoSize = True
        Enabled = False
      end
      object DBText8: TDBText
        Left = 325
        Top = 217
        Width = 54
        Height = 21
        AutoSize = True
        Enabled = False
      end
      object Bevel2: TBevel
        Left = 66
        Top = 130
        Width = 534
        Height = 159
      end
      object DBMemo2: TDBMemo
        Left = 66
        Top = 27
        Width = 534
        Height = 89
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Licenses'
      ImageIndex = 2
      object Label18: TLabel
        Left = 26
        Top = 43
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Caption = 'License 1'
      end
      object Label19: TLabel
        Left = 26
        Top = 105
        Width = 64
        Height = 21
        Alignment = taRightJustify
        Caption = 'License 2'
      end
      object Label20: TLabel
        Left = 96
        Top = 13
        Width = 275
        Height = 21
        Caption = 'Building and Construction Commission '
      end
      object Label21: TLabel
        Left = 96
        Top = 75
        Width = 286
        Height = 21
        Caption = 'Fire Protection Association (Membership)'
      end
      object DBEdit6: TDBEdit
        Left = 96
        Top = 40
        Width = 353
        Height = 29
        TabOrder = 0
      end
      object DBEdit7: TDBEdit
        Left = 96
        Top = 102
        Width = 353
        Height = 29
        TabOrder = 1
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Logo'
      ImageIndex = 3
      object Bevel3: TBevel
        Left = 26
        Top = 18
        Width = 318
        Height = 319
        Shape = bsFrame
        Style = bsRaised
      end
      object Label22: TLabel
        Left = 32
        Top = 424
        Width = 306
        Height = 21
        Alignment = taCenter
        AutoSize = False
        Caption = '(PNG, BMP, JPG - min 400x400 pixels,)'
      end
      object btnLoadClubLogo: TButton
        Left = 396
        Top = 18
        Width = 101
        Height = 33
        Caption = 'Load'
        TabOrder = 0
        OnClick = btnLoadClubLogoClick
      end
      object btnClearClubLogo: TButton
        Left = 396
        Top = 96
        Width = 101
        Height = 33
        Caption = 'Clear'
        TabOrder = 1
        OnClick = btnClearClubLogoClick
      end
      object btnSaveClubLogo: TButton
        Left = 396
        Top = 57
        Width = 101
        Height = 33
        Caption = 'Save'
        TabOrder = 2
        OnClick = btnSaveClubLogoClick
      end
      object DBImage1: TDBImage
        Left = 32
        Top = 24
        Width = 306
        Height = 306
        Proportional = True
        Stretch = True
        TabOrder = 3
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 669
    Width = 696
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      696
      52)
    object btnClose: TButton
      Left = 582
      Top = 6
      Width = 97
      Height = 35
      Anchors = [akTop, akRight]
      Caption = 'btnClose'
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 48
    Top = 648
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Load SCM Club Logo'
    Left = 160
    Top = 648
  end
  object qryCompanyInfo: TFDQuery
    Left = 264
    Top = 648
  end
  object dsCompanyInfo: TDataSource
    DataSet = qryCompanyInfo
    Left = 360
    Top = 648
  end
end
