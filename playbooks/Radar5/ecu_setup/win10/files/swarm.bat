@echo off
:: Jenkins Swarm Client runner

:: source home.txt
copy /y /b home.txt home.bat
call home.bat
del home.bat

:: (mandatory) Home Jenkins
if "%SWHOME%"=="" call :missing_param "Mandatory parameter 'SWHOME' missing."

:: (mandatory) actual address of the Jenkins master (not the proxy)
if "%SWTARGET%"=="" call :missing_param "Mandatory parameter 'SWTARGET' missing."

:: (mandatory) the target Jenkins' swarm user's name
if "%SWUSER%"=="" call :missing_param "Mandatory parameter 'SWUSER' missing."

:: (mandatory) the target Jenkins' swarm user's api key
if "%SWKEY%"=="" call :missing_param "Mandatory parameter 'SWKEY' missing."

:: (mandatory) labels string (may contain blanks)
if "%SWLABELS%"=="" call :missing_param "Mandatory parameter 'SWLABELS' missing."

:: (mandatory) how many executors
if "%SWEXEC%"=="" call :missing_param "Mandatory parameter 'SWEXEC' missing."

:: (optional) swarm name
if "%SWNAME%"=="" (set "SWNAMEOPTION=") else (set "SWNAMEOPTION=-name %SWNAME%")

:: (optional) node description
if "%SWDESCR%"=="" set "SWDESCR=Jenkins node from %SWHOME%"

:: (optional) relative path to the client jarfile
if "%SWCLIENT%"=="" set "SWCLIENT=.\swarm-client-3.28.jar"

:: (optional) Java parameters
if "%SWJPARS%"=="" set "SWJPARS=org.apache.commons.logging.Log=org.apache.commons.logging.impl.Jdk14Logger"

if "%MISSING_MANDATORY_PARAM%"=="1" (
  exit /b 1
)

:: start swarm client
java^
 -Dhudson.remoting.RemoteClassLoader.force=com.sun.jna.Native^
 -Djna.nosys=true^
 -D%SWJPARS%^
 -jar %SWCLIENT% %SWNAMEOPTION%^
 -master %SWTARGET%^
 -description "%SWDESCR%"^
 -labels "%SWLABELS%"^
 -username %SWUSER%^
 -password %SWKEY%^
 -executors %SWEXEC%^
 %SWOPTIONS%
goto :eof

:missing_param
set MISSING_MANDATORY_PARAM=1
echo %1
goto :eof
