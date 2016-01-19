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
echo ÿ
echo ÿ      ğÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÜ
echo ÿ      ³                Release.Bat Í  Release a Slave Pc            Û
echo ÿ      ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÛ
echo ÿ      ³                                                              Û
echo ÿ      ³  Syntax :  Release [SlaveName]³[All]                         Û
echo ÿ      ³                                                              Û
echo ÿ      ³  Example:  Release           Í Help of SlavePC Commands     Û
echo ÿ      ³            Release ?         Í Help of this command         Û
echo ÿ      ³            Release tom       Í Release Tom                  Û
echo ÿ      ³            Release all       Í Release all slave            Û
echo ÿ      ³                                                              Û
echo ÿ      ³  Notes  :  Release is used to release slave PC from other PC Û
echo ÿ      ³                                                              Û
echo ÿ      ³  About  :  Version 1.01  (Batch Version)                     Û
echo ÿ      ³            Written by C.K.Hung. 19,Dec, 1994                 Û
echo ÿ      ³                                                              Û
echo ÿ      øßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo 
goto end


:=======begin
  if "%1" == "all" goto del_all
  if "%1" == "All" goto del_all
  if "%1" == "ALL" goto del_all

  del %slavepath%%1.reg
echo ÿ
echo ÿ   Slave %1 has been released !
echo 
  goto end

  :====del_all
echo ÿ
echo ÿ      ğÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÜ
echo ÿ      ³                                                              Û
echo ÿ      ³   Are you sure to release all slaves ?   [Y]/n               Û
echo ÿ      ³                                                              Û
echo ÿ      øßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
choice /n
if errorlevel 2 goto end
del %slavepath%*.reg
echo ÿ
echo ÿ      ğÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÜ
echo ÿ      ³                                                              Û
echo ÿ      ³   All slaves had been released ! You are a kind master !     Û
echo ÿ      ³                                                              Û
echo ÿ      øßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
echo 

:======end



