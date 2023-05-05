VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsUpdateStats"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private fTotal As Long
Private fDisabled As Long
Private fEnabled As Long
Private fReadyToProcess As Long
Private fNewCustomers As Long
Private fOrdersBuilt As Long
Private fErrors As Long
Private fWarnings As Long
Private fSkipped As Long
Private fSkippedSI As Long

Public Property Get Total() As Long
    Total = fTotal
End Property
Public Property Let Total(ByVal RHS As Long)
    fTotal = RHS
End Property

Public Property Get Disabled() As Long
    Disabled = fDisabled
End Property
Public Property Let Disabled(ByVal RHS As Long)
    fDisabled = RHS
End Property

Public Property Get Enabled() As Long
    Enabled = fEnabled
End Property
Public Property Let Enabled(ByVal RHS As Long)
    fEnabled = RHS
End Property

Public Property Get ReadyToProcess() As Long
    ReadyToProcess = fReadyToProcess
End Property
Public Property Let ReadyToProcess(ByVal RHS As Long)
    fReadyToProcess = RHS
End Property

Public Property Get NewCustomers() As Long
    NewCustomers = fNewCustomers
End Property
Public Property Let NewCustomers(ByVal RHS As Long)
    fNewCustomers = RHS
End Property

Public Property Get OrdersBuilt() As Long
    OrdersBuilt = fOrdersBuilt
End Property
Public Property Let OrdersBuilt(ByVal RHS As Long)
    fOrdersBuilt = RHS
End Property

Public Property Get Errors() As Long
    Errors = fErrors
End Property
Public Property Let Errors(ByVal RHS As Long)
    fErrors = RHS
End Property

Public Property Get Warnings() As Long
    Warnings = fWarnings
End Property
Public Property Let Warnings(ByVal RHS As Long)
    fWarnings = RHS
End Property

Public Property Get Skipped() As Long
    Skipped = fSkipped
End Property
Public Property Let Skipped(ByVal RHS As Long)
    fSkipped = RHS
End Property


Public Property Get SkippedServiceInterval() As Long
    SkippedServiceInterval = fSkippedSI
End Property
Public Property Let SkippedServiceInterval(ByVal RHS As Long)
    fSkippedSI = RHS
End Property

Private Sub Class_Initialize()
    ' Default Initialization
    fTotal = 0
    fDisabled = 0
    fEnabled = 0
    fReadyToProcess = 0
    fNewCustomers = 0
    fOrdersBuilt = 0
    fErrors = 0
    fWarnings = 0
    fSkipped = 0
    fSkippedSI = 0
End Sub

Private Sub Class_Terminate()
    ' Default termination
End Sub

