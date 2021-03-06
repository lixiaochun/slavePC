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
echo �
echo �      ����������������������������������������������������������������
echo �      �            View.Bat �  View slave output screen             �
echo �      ����������������������������������������������������������������
echo �      �                                                              �
echo �      �  Syntax :  View [Name] [Dos-Command]                         �
echo �      �                                                              �
echo �      �  Example:  View           � Help of SlacePC Commands        �
echo �      �            View  ?        � Help of VIEW.BAT                �
echo �      �            View tom       � View tom output of last command �
echo �      �            View tom dir   � Run dir and view the output     �
echo �      �                                                              �
echo �      �  Notes  :  View.Bat is used to monite the Slave PC .         �
echo �      �            If [Dos command] is ommited, [Name].Scr is the    �
echo �      �            default output to display.                        �
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
echo �  ����������������������������������������������������������������������
echo �  �                                                                    �
echo �  �                     Output File of Slave PC                        �
echo �  �                                                                    �
echo �  ����������������������������������������������������������������������
type %slavepath%%1.scr | more

:======end

