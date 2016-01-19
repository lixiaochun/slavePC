@echo off
if "%slavepath%" == "" set slavepath=f:\user\d012\3630\slave\
if "%1" == ""    goto Command
if "%1" == "?"   goto help
if "%1" == "/?"  goto help
if  not exist %slavepath%%1.reg goto error
goto begin

:========Command
call Commands.Bat
goto end

:========help
echo ÿ
echo ÿ      ğÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÜ
echo ÿ      ³            View.Bat Í  View slave output screen             Û
echo ÿ      ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÛ
echo ÿ      ³                                                              Û
echo ÿ      ³  Syntax :  View [Name] [Dos-Command]                         Û
echo ÿ      ³                                                              Û
echo ÿ      ³  Example:  View           Í Help of SlacePC Commands        Û
echo ÿ      ³            View  ?        Í Help of VIEW.BAT                Û
echo ÿ      ³            View tom       Í View tom output of last command Û
echo ÿ      ³            View tom dir   Í Run dir and view the output     Û
echo ÿ      ³                                                              Û
echo ÿ      ³  Notes  :  View.Bat is used to monite the Slave PC .         Û
echo ÿ      ³            If [Dos command] is ommited, [Name].Scr is the    Û
echo ÿ      ³            default output to display.                        Û
echo ÿ      ³                                                              Û
echo ÿ      ³  About  :  Version 1.01  (Batch Version)                     Û
echo ÿ      ³            Written by C.K.Hung. 19,Dec, 1994                 Û
echo ÿ      ³                                                              Û
echo ÿ      øßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo 
goto end

:========error
echo ÿ
echo 
echo    Who is %1 ?  Do you need a slave ?
echo 
echo 
echo 
goto end

:=====begin
if "%2" == "" goto viewout
if exist %slavepath%%1.flg del %slavepath%%1.flg
echo @echo off                                > %slavepath%%1.tmp
echo cls                                     >> %slavepath%%1.tmp
echo set slavetmp=%%slaveout%%               >> %slavepath%%1.tmp
echo set slaveout=%slavepath%%1.scr>> %slavepath%%1.tmp
echo call %slavepath%slaverun %2 %3 %4 %5 %6 %7 %8 %9   >> %slavepath%%1.tmp
echo set slaveout=%%slavetmp%%>> %slavepath%%1.tmp
echo copy %slavepath%%1.reg %slavepath%%1.flg           >> %slavepath%%1.tmp
call %slavepath%sendord %1

 :======loop
 choice /t:y,1 /n Testing ouput file..... 'N'to exit ....
 if errorlevel 2 goto end
 if not exist %slavepath%%1.flg goto loop

:======viewout
 if not exist %slavepath%%1.scr echo  Output file [%1.scr] not found ! 
 if not exist %slavepath%%1.scr goto end
cls
echo ÿ  ğÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÜ
echo ÿ  ³                                                                    Û
echo ÿ  ³                     Output File of Slave PC                        Û
echo ÿ  ³                                                                    Û
echo ÿ  øßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
type %slavepath%%1.scr | more

:======end

