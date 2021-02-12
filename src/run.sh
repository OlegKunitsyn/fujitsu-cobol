#!/bin/bash
# Fujitsu Cobol CLI runner
# Usage: ./run.sh <program> <entry point> [args]

COLOR='\033[0;32m'
NOCOLOR='\033[0m'
MODULES=$1
ENTRY=$2
ENTRY=${ENTRY^^}
export INPUT=.input
export OUTPUT=.output

# Compiling
echo -e "${COLOR} Compiling $MODULES ${NOCOLOR}"
rm -f *.OBJ
wine cobol32.exe -WC,"NAME,SSIN(INPUT),SSOUT(OUTPUT)" $MODULES
if [ "$?" -ne "0" ]; then
  exit 1
fi

# Linking
echo -e "${COLOR} Linking $ENTRY ${NOCOLOR}"
rm -f *.EXE
wine link.exe /NOLOGO /ENTRY:$ENTRY /OUT:$ENTRY.EXE *.OBJ F3BICIMP.LIB LIBC.LIB KERNEL32.LIB USER32.LIB
if [ "$?" -ne "0" ]; then
  exit 1
fi

# Executing
echo -e "${COLOR} Executing $ENTRY ${NOCOLOR}"
echo $3 > $INPUT
echo '' > $OUTPUT
echo "[$ENTRY]" > COBOL85.CBR
echo "@EnvSetWindow=UNUSE" >> COBOL85.CBR
wine $ENTRY.EXE && cat $OUTPUT
