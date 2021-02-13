# Fujitsu Cobol 3.0 Docker image
Copyright (C) Fujitsu Limited 1992, 1997.

## Includes

### PCOBOL32 
- Standards Compliant (Full ANSI  Standard COBOL X3.23 1985, 
  ISO-1989-1985) "COBOL 85" plus the 89 Addendum"
- Compatibility support with OS/VS COBOL, VS COBOL II and Micro Focus
- Embedded SQL Preprocessor with ODBC support 
- Embedded COBOL Report Writer, 
- Full function COBOL execution time debugger
- Programming Staff (Edit and Compile Environment)
- Micro Focus Conversion Utility (MFTO85)
- File Utility 
- Easy integration with Microsoft Visual Basic

# Usage
```
$ docker run -d --name cobol -v `pwd`/src:/root/prefix32/drive_c/src -p 8080:8080 olegkunitsyn/fujitsu-cobol:3.0
$ docker exec -i cobol wine regedit.exe /s cobol.reg
```

## Console
```
$ cd src
$ docker exec -i cobol ./run.sh hello.cbl HELLO
 Compiling hello.cbl 
STATISTICS: HIGHEST SEVERITY CODE=I, PROGRAM UNIT=1
 Linking HELLO 
 Executing HELLO 
Hello COBOL
$ docker rm --force cobol
```

## Wine GUI
Open http://localhost:8080 in the browser.
```
C:\FSC\PCOBOL32\pstaff.exe
```