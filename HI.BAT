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
echo �      �               Hi.Bat �  Send Order to a Slave               �
echo �      ����������������������������������������������������������������
echo �      �                                                              �
echo �      �  Syntax :  Hi [Name] [Dos-Command]                           �
echo �      �                                                              �
echo �      �  Example:  Hi                � Help of SlavePc Commands     �
echo �      �            Hi ?              � Help of HI.BAT               �
echo �      �            Hi tom dir        � Order Tome to Run [ Dir ]    �
echo �      �                                                              �
echo �      �  Notes  :  SLAVE-PC will echo before run the command and     �
echo �      �            send message back to MASTER-PC after done.        �
echo �      �                                                              �
echo �      �  About  :  Version 1.01  (Batch Version),                    �
echo �      �            Written by C.K.Hung. 19,Dec, 1994                 �
echo �      �                                                              �
echo �      ����������������������������������������������������������������
echo 
goto end

:========error
echo �
echo 
echo     Who is %1 ? Do you need a slave ?
echo 
echo 
echo 
goto end

:=======begin
echo @echo off                                > %slavepath%%1.tmp
echo send "[%1] Yes, Sir !" to station %sn%  >> %slavepath%%1.tmp
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

