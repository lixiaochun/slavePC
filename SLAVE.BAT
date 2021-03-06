@echo off
if "%slavepath%" == "" set slavepath=f:\user\d012\3630\slave\
if "%1" == ""   goto Command
if "%1" == "?"  goto help
if "%1" == "/?" goto help
if exist %slavepath%%1.reg goto conflict
goto begin

:======== Command
call Commands.Bat
goto end

:======== Help
echo �
echo �      ��������������������������������������������������������������Ŀ
echo �      �              Slave.Bat �  Register Slave Name               �
echo �      ����������������������������������������������������������������
echo �      �                                                              �
echo �      �  Syntax :  Slave [Name] [Output] [Input]                     �
echo �      �                                                              �
echo �      �  Example:  Slave             � Help of SalvePC Commands     �
echo �      �            Slave ?           � Help of Slave.Bat            �
echo �      �            Slave tom         � Register a Slave named Tom   �
echo �      �            Slave tom tom.scr � Register, output to tom.scr  �
echo �      �                                                              �
echo �      �  Notes  :  This batch is used to register a SLAVE-PC.        �
echo �      �            After run [ Slave ], this PC will loop and wait   �
echo �      �            for a order from other PC.                        �
echo �      �            if [Output] is omitted, [Name.Scr] is the default �
echo �      �            if [Input] is omitted, [Con] is the default.      �
echo �      �                                                              �
echo �      �  About  :  Version 1.01  (Batch Version)                     �
echo �      �            Written by C.K.Hung. 19 Dec, 1994                 �
echo �      �                                                              �
echo �      ����������������������������������������������������������������
echo 
goto end

:======== Conflict
echo �
echo ����������������������������������������������������Ŀ
echo �                                                    �
echo �  Oh! No! You can't have two slaves in same name !  �
echo �                                                    �
echo ������������������������������������������������������
echo 
goto end

:======== Begin
 Echo Slave %1 > %slavepath%%1.reg
 set slave=%1
 if "%2" == "" set slaveout=%slavepath%%1.scr
 if "%3" == "" set slavein=con
 if not "%2" == "" set slaveout=%2
 if not "%3" == "" set slavein=%3

rem echo �         �      �       �  �   �   � �         �    �  �                  �
rem echo �             �  �    � �    �   ���  �         �       �                  �

:======== logo
cls
echo ��������������������������������������������������������������������������Ŀ
echo �                                                                          �
echo �         �����  �       ����   �   � �����     ������  ������             �
echo �         �����  �      ������  �� �� �����     ������  �                  �
echo �             �  �      �    �   � �  �         �       �                  �
echo �         �����  ������ �    �    �   �����     �       ������             �
echo �                                                                          �
echo �         Copyright 1994, S&M department of NYCB, All rights reserved      �
echo �         Version 1.01 (Batch Version), Last updated at 19 Dec 94.         �
echo �         Written by C.K.Hung based on an idea of Jeff                     �
echo �                                                                          �
echo ����������������������������������������������������������������������������
echo �  Rules for Slave  �                                                      �
echo �������������������ͼ                                                      �
echo �  (1) Slave [Slave Name] [Output] [Input]    � Register a slave          �
echo �  (2) Order [Slave Name] [dos Command]       � Send order to a slave     �
echo �  (3) Hi    [Slave Name] [Dos Command]       � Send order to a slave     �
echo �  (4) Run   [Dos Command]                    � Send order to somebody    �
echo �  (5) View  [Slave Name] [Dos Command]       � Send order & View output  �
echo �  (6) List                                   � List slaves               �
echo �  (7) Release [Slave Name]�[ALL]             � Release slave, thanks     �
echo �                                                                          �
echo ����������������������������������������������������������������������������
echo  Slave %1   is waiting for order ......'Q' to Exit

 :======= Loop
 if not exist %slavepath%%1.reg goto release
 if exist %slavepath%somebody.bat move %slavepath%somebody.bat %slavepath%%1.bat >nul
 if exist %slavepath%%1.bat goto done
 choice /c:qabcdefghijklmnoprstuvwxyz0123456789 /t:0,1 > nul
 if not errorlevel 2 goto quit
 goto loop

 :=======done
 call %slavepath%%1
 del %slavepath%%1.bat
 goto logo

 :======quit
 del %slavepath%%1.reg

 :======release
 cls

:======== end
set slave=
set slavein=
set slaveout=

