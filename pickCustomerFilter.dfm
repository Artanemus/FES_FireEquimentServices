object CustomerFilter: TCustomerFilter
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Pick Customer Filter'
  ClientHeight = 217
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 21
  object CheckListBox1: TCheckListBox
    Left = 0
    Top = 0
    Width = 323
    Height = 176
    Align = alClient
    ItemHeight = 21
    Items.Strings = (
      'Hide archived customers'
      'Hide customers not linked to any site'
      'Hide archived business addresses'
      'Hide archived email addresses'
      'Hide archived contacts'
      'Hide archived inspection orders')
    TabOrder = 0
    ExplicitWidth = 246
    ExplicitHeight = 352
  end
  object Panel1: TPanel
    Left = 0
    Top = 176
    Width = 323
    Height = 41
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 352
    ExplicitWidth = 246
    object btnOk: TButton
      Left = 124
      Top = 7
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
    end
  end
end
