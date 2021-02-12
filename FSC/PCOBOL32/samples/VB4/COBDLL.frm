VERSION 4.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3630
   ClientLeft      =   1095
   ClientTop       =   1515
   ClientWidth     =   4935
   Height          =   4035
   Left            =   1035
   LinkTopic       =   "Form1"
   ScaleHeight     =   3630
   ScaleWidth      =   4935
   Top             =   1170
   Width           =   5055
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   735
      Left            =   960
      TabIndex        =   0
      Top             =   1920
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   495
      Left            =   960
      TabIndex        =   1
      Top             =   600
      Width           =   2175
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Declare Sub COBDLL Lib "C:\FSC\PCOBOL32\SAMPLES\VB4\COBDLL.DLL" (PassNum As Long)
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


