@echo off
if "%slavepath%" == "" set slavepath=f:\user\d012\3630\slave\
if "%1" == ""    goto command
if "%1" == "?"   goto help
if "%1" == "/?"  goto help
if  not exist %slavepath%%1.reg goto error
goto begin

:========Command
call Commands.Bat
goto end

:========help
echo ÿ
echo ÿ      ðÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÜ
echo ÿ      ³            Order.Bat Í  Send Order to a Slave               Û
echo ÿ      ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÛ
echo ÿ      ³                                                              Û
echo ÿ      ³  Syntax :  Order [Name] [Dos-Command]                        Û
echo ÿ      ³                                                              Û
echo ÿ      ³  Example:  Order             Í Help of SlavePC Command      Û
echo ÿ      ³            Order ?           Í Help of This Command         Û
echo ÿ      ³            Order tom dir     Í Order Tome to Run [ Dir ]    Û
echo ÿ      ³                                                              Û
echo ÿ      ³  Notes  :  Slave Pc will run the command and send a message  Û
echo ÿ      ³            back to master pc after done.                     Û
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
echo @echo off                                > %slavepath%%1.tmp
echo cls                                     >> %slavepath%%1.tmp
echo call %slavepath%slaverun %2 %3 %4 %5 %6 %7 %8 %9   >> %slavepath%%1.tmp
echo if not errorlevel 1 goto OK             >> %slavepath%%1.tmp
echo send "[%1] Error!" to station %sn%      >> %slavepath%%1.tmp
echo goto end                                >> %slavepath%%1.tmp
echo :========OK                             >> %slavepath%%1.tmp
echo send "[%1] Done !" to station %sn%      >> %slavepath%%1.tmp
echo :========end                            >> %slavepath%%1.tmp
call %slavepath%sendord %1

:======end
