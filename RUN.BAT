@echo off
if "%slavepath%" == "" set slavepath=f:\user\d012\3630\slave\
if "%1" == ""   goto command
if "%1" == "?"  goto help
if "%1" == "/?" goto help
goto begin

:========Command
call Commands.Bat
goto end

:=====Help
echo ÿ
echo ÿ      ðÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÜ
echo ÿ      ³                Run.Bat Í Send Order to Somebody             Û
echo ÿ      ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÛ
echo ÿ      ³                                                              Û
echo ÿ      ³  Syntax :  Run [Dos-Command]                                 Û
echo ÿ      ³                                                              Û
echo ÿ      ³  Example:  Run           Í Help of SlavePC Commands         Û
echo ÿ      ³            Run ?         Í Help of RUN.BAT                  Û
echo ÿ      ³            Run dir       Í Order somebody to run [ Dir ]    Û
echo ÿ      ³                                                              Û
echo ÿ      ³  Notes  :  One of SLAVE-PC will echo before run the command  Û
echo ÿ      ³            and send message back to MASTER-PC after done.    Û
echo ÿ      ³                                                              Û
echo ÿ      ³  About  :  Version 1.01  (batch version)                     Û
echo ÿ      ³            Written by C.K.Hung. 19,Dec, 1994                 Û
echo ÿ      ³                                                              Û
echo ÿ      øßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo 
goto end

:=====begin
echo @echo off                                      > %slavepath%somebody.tmp
echo send "[%%slave%%] Yes, Sir !" to station %sn% >> %slavepath%somebody.tmp
echo cls                                           >> %slavepath%somebody.tmp
echo call %slavepath%slaverun %1 %2 %3 %4 %5 %6 %7 %8 %9      >> %slavepath%somebody.tmp
echo if not errorlevel 1 goto OK                   >> %slavepath%somebody.tmp
echo send "[%%slave%%] Error!" to station %sn%     >> %slavepath%somebody.tmp
echo goto end                                      >> %slavepath%somebody.tmp
echo :========OK                                   >> %slavepath%somebody.tmp
echo send "[%%slave%%] Done !" to station %sn%     >> %slavepath%somebody.tmp
echo :========end                                  >> %slavepath%somebody.tmp
call %slavepath%sendord somebody

:======end

