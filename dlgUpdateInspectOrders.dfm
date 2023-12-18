object UpdateInspectOrders: TUpdateInspectOrders
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FES Update Inspect Orders'
  ClientHeight = 167
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  DesignSize = (
    316
    167)
  TextHeight = 21
  object Label1: TLabel
    Left = 8
    Top = 128
    Width = 305
    Height = 21
    Alignment = taCenter
    Anchors = [akLeft]
    AutoSize = False
    Caption = 'Last Updated : dd/mm/yyyy'
  end
  object btnUpdate: TButton
    Left = 39
    Top = 22
    Width = 242
    Height = 30
    Caption = 'UPDATE INSPECTION ORDERS'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnClose: TButton
    Left = 39
    Top = 58
    Width = 242
    Height = 30
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
end
