rem === internal batch, run a dos command for slave. ====

if "%slavein%" == ""   set slavein=con
if "%slaveout%" == ""  set slaveout=con

echo [Slave:%slave%,in:%slavein%] %1 %2 %3 %4 %5 %6 %7 %8 %9 >> %slavepath%slave.log
call %1 %2 %3 %4 %5 %6 %7 %8 %9 < %slavein% > %slaveout%
