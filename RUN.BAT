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
echo �
echo �      ����������������������������������������������������������������
echo �      �                Run.Bat � Send Order to Somebody             �
echo �      ����������������������������������������������������������������
echo �      �                                                              �
echo �      �  Syntax :  Run [Dos-Command]                                 �
echo �      �                                                              �
echo �      �  Example:  Run           � Help of SlavePC Commands         �
echo �      �            Run ?         � Help of RUN.BAT                  �
echo �      �            Run dir       � Order somebody to run [ Dir ]    �
echo �      �                                                              �
echo �      �  Notes  :  One of SLAVE-PC will echo before run the command  �
echo �      �            and send message back to MASTER-PC after done.    �
echo �      �                                                              �
echo �      �  About  :  Version 1.01  (batch version)                     �
echo �      �            Written by C.K.Hung. 19,Dec, 1994                 �
echo �      �                                                              �
echo �      ����������������������������������������������������������������
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

