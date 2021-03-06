@echo off
if "%slavepath%" == "" set slavepath=f:\user\d012\3630\slave\
if "%1" == ""    goto command
if "%1" == "?"   goto help
if "%1" == "/?"  goto help
goto begin

:========Command
call Commands.Bat
goto end

:========help
echo �
echo �      ����������������������������������������������������������������
echo �      �                Release.Bat �  Release a Slave Pc            �
echo �      ����������������������������������������������������������������
echo �      �                                                              �
echo �      �  Syntax :  Release [SlaveName]�[All]                         �
echo �      �                                                              �
echo �      �  Example:  Release           � Help of SlavePC Commands     �
echo �      �            Release ?         � Help of this command         �
echo �      �            Release tom       � Release Tom                  �
echo �      �            Release all       � Release all slave            �
echo �      �                                                              �
echo �      �  Notes  :  Release is used to release slave PC from other PC �
echo �      �                                                              �
echo �      �  About  :  Version 1.01  (Batch Version)                     �
echo �      �            Written by C.K.Hung. 19,Dec, 1994                 �
echo �      �                                                              �
echo �      ����������������������������������������������������������������
echo 
goto end


:=======begin
  if "%1" == "all" goto del_all
  if "%1" == "All" goto del_all
  if "%1" == "ALL" goto del_all

  del %slavepath%%1.reg
echo �
echo �   Slave %1 has been released !
echo 
  goto end

  :====del_all
echo �
echo �      ����������������������������������������������������������������
echo �      �                                                              �
echo �      �   Are you sure to release all slaves ?   [Y]/n               �
echo �      �                                                              �
echo �      ����������������������������������������������������������������
choice /n
if errorlevel 2 goto end
del %slavepath%*.reg
echo �
echo �      ����������������������������������������������������������������
echo �      �                                                              �
echo �      �   All slaves had been released ! You are a kind master !     �
echo �      �                                                              �
echo �      ����������������������������������������������������������������
echo 

:======end



