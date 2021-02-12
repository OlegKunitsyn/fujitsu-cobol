# Fujitsu Cobol
Fujitsu Cobol 3.0 Docker image

# Usage
```
$ docker run -d --name cobol -v `pwd`/src:/root/prefix32/drive_c/src -p 8080:8080 olegkunitsyn/fujitsu-cobol:3.0
$ cd src
$ docker exec -i cobol wine regedit.exe /s cobol.reg
$ docker exec -i cobol ./run.sh hello.cbl HELLO
 Compiling hello.cbl 
STATISTICS: HIGHEST SEVERITY CODE=I, PROGRAM UNIT=1
 Linking HELLO 
 Executing HELLO 
Hello COBOL
$ docker rm --force cobol
```
