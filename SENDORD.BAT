rem =========== internal batch : send order to a slave ===========
@echo off
if "%1" == "" goto end
:=======detect
 if not exist %slavepath%%1.bat goto send
 echo ÿ
 echo ÿ      ğÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÜ
 echo ÿ      ³                                                 Û
 echo ÿ      ³   Slave is busy ..... Send Again ?   [Y]/n      Û
 echo ÿ      ³                                                 Û
 echo ÿ      øßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
 choice /n /ty,2
 if errorlevel 2 goto end
 goto detect

:=========send
 copy %slavepath%%1.tmp %slavepath%%1.bat >nul
:========= end

