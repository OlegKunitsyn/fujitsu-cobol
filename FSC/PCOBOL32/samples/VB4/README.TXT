***************************************************************************************************
*                     Visual Basic VB4 Sample Readme                                              *
***************************************************************************************************


Note: Path information is hard coded in the Visual Basic application. If Fujitsu COBOL is installed
in a drive or directory other than C:\FSC the sample Visual Basic application must be updated.
Then the following Visual Basic statements need to be updated with the new path information:

Private Declare Sub COBDLL Lib "C:\FSC\PCOBOL32\SAMPLES\VB4\COBDLL.DLL" (PassNum As Long)
Private Declare Sub JMPCINT2 Lib "C:\FSC\PCOBOL32\F3BIPRCT.DLL" ()
Private Declare Sub JMPCINT3 Lib "C:\FSC\PCOBOL32\F3BIPRCT.DLL" ()
