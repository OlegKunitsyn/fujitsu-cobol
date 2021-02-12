VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Call COBOL program"
      Height          =   735
      Left            =   720
      TabIndex        =   1
      Top             =   1200
      Width           =   2415
   End
   Begin VB.Label Label1 
      Caption         =   "Value returned"
      Height          =   375
      Left            =   480
      TabIndex        =   0
      Top             =   360
      Width           =   1815
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Sub COBDLL Lib "C:\FSC\PCOBOL32\SAMPLES\VB5\COBDLL.DLL" (PassNum As Long)
Private Declare Sub JMPCINT2 Lib "C:\FSC\PCOBOL32\F3BIPRCT.DLL" ()
Private Declare Sub JMPCINT3 Lib "C:\FSC\PCOBOL32\F3BIPRCT.DLL" ()

Private Sub Command1_Click()
Dim ReturnNumber As Long
Call JMPCINT2 'Start COBOL Runtime - typically do once at start of VB application
Call COBDLL(ReturnNumber)
Call JMPCINT3 'Stop COBOL Runtime - typically do once at end of VB application
Label1.Caption = ReturnNumber
'NOTE:
'      To suppress the dialog display showing the "COBOL Runtime Environment Setup"
'         1. Set the COBOL Runtime Environment variable
'            "EnvSetWindow=UNUSE"
'         2. Save the modification
'      Result will be to suppress the display for all further execution of the COBOL
'      Runtime

End Sub

