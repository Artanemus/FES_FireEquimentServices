VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsMonth"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'@Folder("CLASS")
Option Compare Database
'@PredeclaredId
Option Explicit
Private m_data() As String

Private Sub Class_Initialize()
    ReDim m_data(0 To 11)
    m_data(0) = "1;January"
    m_data(1) = "2;Febuary"
    m_data(2) = "3;March"
    m_data(3) = "4;April"
    m_data(4) = "5;May"
    m_data(5) = "6;June"
    m_data(6) = "7;July"
    m_data(7) = "8;August"
    m_data(8) = "9;September"
    m_data(9) = "10;October"
    m_data(10) = "11;November"
    m_data(11) = "12;December"
End Sub
Private Sub Class_Terminate()
    Erase m_data
End Sub

Public Property Get Count() As Integer
    Count = UBound(m_data) - LBound(m_data) + 1
End Property

Public Property Get Data(index As Integer) As String
    Data = m_data(index)
End Property

'Public Property Let Data(index As Integer, value As String)
'    m_data(index) = value
'End Property

'Public Function Store(rng As Range) As Boolean
'    Store = (rng.value = m_data(0))
'End Function
