@ECHO OFF
netstat -aon |find /i "listening"

SET killport=
SET /P killport=Enter port: 
IF "%killport%"=="" GOTO Kill

netstat -aon |find /i "listening" | find "%killport%"

:Kill
SET killpid=
SET /P killpid=Enter PID to kill: 
IF "%killpid%"=="" GOTO Error

ECHO Killing %killpid%!
taskkill /F /PID %killpid%

GOTO End
:Error
ECHO Nothing to kill! Bye bye!!
:End

pause
