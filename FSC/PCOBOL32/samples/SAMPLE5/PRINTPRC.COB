IDENTIFICATION DIVISION.
 PROGRAM-ID. PRINTPRC.
*>  THIS SAMPLE PROGRAM IS IN FREE FORMAT. THE PROGRAM MUST BE
*>  COMPILED WITH THE SRF COMPILER OPTION. THE SRF COMPILER OPTION
*>  SPECIFIES THE SOURCE FORMAT TYPE. SRF(FREE,FREE) TELLS THE
*>  COMPILER THAT THE SOURCE PROGRAM AND COPYBOOKS ARE IN FREE FORMAT.
ENVIRONMENT DIVISION.
 CONFIGURATION SECTION.
  SPECIAL-NAMES.
    PRINTING MODE PMODE1 IS FOR MOCS
      IN   SIZE   7 POINT
      AT   PITCH  10 CPI
      WITH FONT   GOTHIC
      AT   ANGLE  0 DEGREES
      BY   FORM   F.
*>
 INPUT-OUTPUT SECTION.
  FILE-CONTROL.
    SELECT PRINT-FILE
        ASSIGN       TO  PRINTER.
    SELECT WORK-FILE
        ASSIGN       TO  WORK-FILE-NAME
        ORGANIZATION IS  LINE SEQUENTIAL.
*>
DATA DIVISION.
 FILE SECTION.
 FD  PRINT-FILE.
 01  PRINT-RECORD PIC X(60).
 FD  WORK-FILE.
 01  WORK-RECORD.
     COPY "S_REC.CBL".
*>
 WORKING-STORAGE SECTION.
 01  WORK1-RECORD CHARACTER TYPE IS PMODE1.
     COPY "S_REC.CBL".
*>
 LINKAGE SECTION.
 01  WORK-FILE-NAME      PIC X(12).
*>
PROCEDURE DIVISION USING WORK-FILE-NAME.
*>  (1) OPEN THE DATA FILE.
     OPEN OUTPUT PRINT-FILE.
     OPEN INPUT  WORK-FILE.
*>
 LOOP-POINT.
*>  (2) PRINT THE DATA FILE.
     READ WORK-FILE INTO WORK1-RECORD
          AT END GO TO TERM-PROC.
     WRITE PRINT-RECORD FROM WORK1-RECORD AFTER ADVANCING 1 LINE.
     GO TO LOOP-POINT.
*>
 TERM-PROC.
*>  (3) CLOSE DOWN THE PRINT FILE (DATA FILE) AFTER PRINTING.
     CLOSE  PRINT-FILE WORK-FILE.
END PROGRAM PRINTPRC.
