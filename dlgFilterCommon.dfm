object FilterCommon: TFilterCommon
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Filter Members'
  ClientHeight = 242
  ClientWidth = 243
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  TextHeight = 21
  object RelativePanel1: TRelativePanel
    Left = 0
    Top = 0
    Width = 241
    Height = 241
    ControlCollection = <
      item
        Control = dtpStart
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWith = spbDateFrom
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = dtpEnd
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWith = spbDateTo
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = btnToday1
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWith = spbDateFrom
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = btnToday2
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = False
        AlignRightWithPanel = False
        AlignTopWithPanel = False
        AlignVerticalCenterWith = spbDateTo
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = spbDateFrom
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = True
        AlignRightWithPanel = True
        AlignTopWithPanel = True
        AlignVerticalCenterWithPanel = False
      end
      item
        Control = spbDateTo
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = True
        AlignRightWithPanel = True
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
        Below = spbDateFrom
      end
      item
        Control = spbCurrentMonth
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = True
        AlignRightWithPanel = True
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
        Below = spbDateTo
      end
      item
        Control = spbHideLocked
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = True
        AlignRightWithPanel = True
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
        Below = spbCurrentMonth
      end
      item
        Control = spdHideLinked
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = True
        AlignRightWithPanel = True
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
        Below = spbHideLocked
      end
      item
        Control = spdShowArchived
        AlignBottomWithPanel = False
        AlignHorizontalCenterWithPanel = False
        AlignLeftWithPanel = True
        AlignRightWithPanel = True
        AlignTopWithPanel = False
        AlignVerticalCenterWithPanel = False
        Below = spdHideLinked
      end>
    BevelKind = bkFlat
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 0
    DesignSize = (
      237
      237)
    object dtpStart: TDateTimePicker
      Left = 88
      Top = 6
      Width = 108
      Height = 29
      Anchors = []
      Date = 45381.000000000000000000
      Time = 0.593101122685766300
      TabOrder = 0
    end
    object dtpEnd: TDateTimePicker
      Left = 88
      Top = 44
      Width = 108
      Height = 29
      Anchors = []
      Date = 45381.000000000000000000
      Time = 0.593101122685766300
      TabOrder = 1
    end
    object btnToday1: TButton
      Left = 202
      Top = 6
      Width = 28
      Height = 28
      Anchors = []
      ImageAlignment = iaCenter
      ImageIndex = 30
      ImageName = 'Date\today'
      Images = FES.imgList32x32
      TabOrder = 2
      OnClick = btnToday1Click
    end
    object btnToday2: TButton
      Left = 202
      Top = 44
      Width = 28
      Height = 28
      Anchors = []
      ImageAlignment = iaCenter
      ImageIndex = 30
      ImageName = 'Date\today'
      Images = FES.imgList32x32
      TabOrder = 3
      OnClick = btnToday2Click
    end
    object spbDateFrom: TSpeedButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 229
      Height = 32
      Action = actnDateFrom
      Anchors = []
      Flat = True
      Margin = 0
    end
    object spbDateTo: TSpeedButton
      AlignWithMargins = True
      Left = 4
      Top = 42
      Width = 229
      Height = 32
      Action = actnDateTo
      Anchors = []
      Flat = True
      Margin = 0
    end
    object spbCurrentMonth: TSpeedButton
      AlignWithMargins = True
      Left = 4
      Top = 80
      Width = 229
      Height = 32
      Anchors = []
      Caption = 'Current Month'
      ImageIndex = 29
      ImageName = 'Date\calendar_month'
      Images = FES.imgList32x32
      Flat = True
      Margin = 0
      OnClick = spbCurrentMonthClick
    end
    object spbHideLocked: TSpeedButton
      AlignWithMargins = True
      Left = 4
      Top = 118
      Width = 229
      Height = 32
      Action = actnHideLocked
      Anchors = []
      Flat = True
      Margin = 0
      Visible = False
    end
    object spdHideLinked: TSpeedButton
      AlignWithMargins = True
      Left = 4
      Top = 156
      Width = 229
      Height = 32
      Action = actnHideLinked
      Anchors = []
      Flat = True
      Margin = 0
      Visible = False
    end
    object spdShowArchived: TSpeedButton
      AlignWithMargins = True
      Left = 4
      Top = 194
      Width = 229
      Height = 32
      Action = actnShowArchived
      Anchors = []
      Flat = True
      Margin = 0
    end
  end
  object actnList: TActionList
    Images = FES.imgList32x32
    Left = 160
    Top = 88
    object actnShowArchived: TAction
      Caption = 'Show Archived'
      ImageIndex = 23
      ImageName = 'checked_boxNIL'
      OnExecute = actnGenericExecute
      OnUpdate = actnGenericUpdate
    end
    object actnHideLocked: TAction
      Caption = 'Hide Locked'
      ImageIndex = 23
      ImageName = 'checked_boxNIL'
      OnExecute = actnGenericExecute
      OnUpdate = actnGenericUpdate
    end
    object actnHideLinked: TAction
      Caption = 'Hide Linked'
      ImageIndex = 23
      ImageName = 'checked_boxNIL'
      OnExecute = actnGenericExecute
      OnUpdate = actnGenericUpdate
    end
    object actnDateFrom: TAction
      Caption = 'FROM'
      ImageIndex = 23
      ImageName = 'checked_boxNIL'
      OnExecute = actnGenericExecute
      OnUpdate = actnGenericUpdate
    end
    object actnDateTo: TAction
      Caption = 'TO'
      ImageIndex = 23
      ImageName = 'checked_boxNIL'
      OnExecute = actnGenericExecute
      OnUpdate = actnGenericUpdate
    end
  end
end
