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
echo �
echo �      ����������������������������������������������������������������
echo �      �            Order.Bat �  Send Order to a Slave               �
echo �      ����������������������������������������������������������������
echo �      �                                                              �
echo �      �  Syntax :  Order [Name] [Dos-Command]                        �
echo �      �                                                              �
echo �      �  Example:  Order             � Help of SlavePC Command      �
echo �      �            Order ?           � Help of This Command         �
echo �      �            Order tom dir     � Order Tome to Run [ Dir ]    �
echo �      �                                                              �
echo �      �  Notes  :  Slave Pc will run the command and send a message  �
echo �      �            back to master pc after done.                     �
echo �      �                                                              �
echo �      �  About  :  Version 1.01  (Batch Version)                     �
echo �      �            Written by C.K.Hung. 19,Dec, 1994                 �
echo �      �                                                              �
echo �      ����������������������������������������������������������������
echo 
goto end

:========error
echo �
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
