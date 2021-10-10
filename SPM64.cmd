@echo off
:: ********************************************
::  Start file "SPM64.cmd" for "COMSET.EXE"
:: ********************************************
if (%1)==() goto NoPars
set ProgDrv=%~d0
set ProgDir=%~dp0
set ProgDirShort=%~dps0
set ProgPars="%~dpnx1"
set ProgParsShort="%~dpnxs1"
set TempFileName=DBOX$$$$.TXT
:: Change to program directory
%ProgDrv%
cd %ProgDir%
:: Create temp file in program directory
echo %ProgParsShort%>%TempFileName%
echo %ProgPars%>>%TempFileName%
echo %ProgDir%>>%TempFileName%
echo %ProgDirShort%>>%TempFileName%
echo %ProgDrv%>>%TempFileName%
set ProgDrv=
set ProgDir=
set ProgDirShort=
set ProgPars=
set ProgParsShort=
set TempFileName=
:NoPars
:: Load DOS emulator and program file defined in DosRunSPM.conf 
start dosbox.exe -conf DosRunSPM.conf -noconsole
