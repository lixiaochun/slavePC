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
echo ÿ
echo ÿ      ðÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ÿ      ³              Slave.Bat Í  Register Slave Name               Þ
echo ÿ      ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÞ
echo ÿ      ³                                                              Þ
echo ÿ      ³  Syntax :  Slave [Name] [Output] [Input]                     Þ
echo ÿ      ³                                                              Þ
echo ÿ      ³  Example:  Slave             Í Help of SalvePC Commands     Þ
echo ÿ      ³            Slave ?           Í Help of Slave.Bat            Þ
echo ÿ      ³            Slave tom         Í Register a Slave named Tom   Þ
echo ÿ      ³            Slave tom tom.scr Í Register, output to tom.scr  Þ
echo ÿ      ³                                                              Þ
echo ÿ      ³  Notes  :  This batch is used to register a SLAVE-PC.        Þ
echo ÿ      ³            After run [ Slave ], this PC will loop and wait   Þ
echo ÿ      ³            for a order from other PC.                        Þ
echo ÿ      ³            if [Output] is omitted, [Name.Scr] is the default Þ
echo ÿ      ³            if [Input] is omitted, [Con] is the default.      Þ
echo ÿ      ³                                                              Þ
echo ÿ      ³  About  :  Version 1.01  (Batch Version)                     Þ
echo ÿ      ³            Written by C.K.Hung. 19 Dec, 1994                 Þ
echo ÿ      ³                                                              Þ
echo ÿ      øßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo 
goto end

:======== Conflict
echo ÿ
echo ðÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³                                                    Þ
echo ³  Oh! No! You can't have two slaves in same name !  Þ
echo ³                                                    Þ
echo øßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo 
goto end

:======== Begin
 Echo Slave %1 > %slavepath%%1.reg
 set slave=%1
 if "%2" == "" set slaveout=%slavepath%%1.scr
 if "%3" == "" set slavein=con
 if not "%2" == "" set slaveout=%2
 if not "%3" == "" set slavein=%3

rem echo ³         Û      Û       Û  Û   Û   Û Û         Û    Û  Û                  Û
rem echo ³             Û  Û    Ü Û    Û   ÛÛÛ  Û         Û       Û                  Û

:======== logo
cls
echo ðÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³                                                                          Þ
echo ³         Ûßßßß  Û       ÛßßÛ   Û   Û Ûßßßß     ÛßßßßÛ  Ûßßßßß             Þ
echo ³         ÛÜÜÜÜ  Û      ÜÛÜÜÛÜ  ÛÜ ÜÛ ÛÜÜÜÜ     ÛÜÜÜÜÛ  Û                  Þ
echo ³             Û  Û      Û    Û   Û Û  Û         Û       Û                  Þ
echo ³         ßßßßß  ßßßßßß ß    ß    ß   ßßßßß     ß       ßßßßßß             Þ
echo ³                                                                          Þ
echo ³         Copyright 1994, S&M department of NYCB, All rights reserved      Þ
echo ³         Version 1.01 (Batch Version), Last updated at 19 Dec 94.         Þ
echo ³         Written by C.K.Hung based on an idea of Jeff                     Þ
echo ³                                                                          Þ
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÒÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÞ
echo ³  Rules for Slave  º                                                      Þ
echo ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼                                                      Þ
echo ³  (1) Slave [Slave Name] [Output] [Input]    Í Register a slave          Þ
echo ³  (2) Order [Slave Name] [dos Command]       Í Send order to a slave     Þ
echo ³  (3) Hi    [Slave Name] [Dos Command]       Í Send order to a slave     Þ
echo ³  (4) Run   [Dos Command]                    Í Send order to somebody    Þ
echo ³  (5) View  [Slave Name] [Dos Command]       Í Send order & View output  Þ
echo ³  (6) List                                   Í List slaves               Þ
echo ³  (7) Release [Slave Name]³[ALL]             Í Release slave, thanks     Þ
echo ³                                                                          Þ
echo øßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
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

