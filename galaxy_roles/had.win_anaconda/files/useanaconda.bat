@echo off
where conda.bat 2>NUL 1>&2
if errorlevel 1 (
	echo Couldn't find conda.bat. Do you have the Anaconda SCCM package properly installed?
	timeout /t 10
	exit /b 1
)
echo You might not have to call `useanaconda` for this version of the Anaconda
echo SCCM package. It provides the `conda` command without the need to 
echo call `useanaconda` first.
echo.
echo But if you want to run `python`, simply activate the `base` environment
echo by calling `conda activate base`.
echo.
echo I will do this now for you, but you can skip this message in the future
echo by calling `conda` or `conda activate base` directly.
echo (Please notice that you have to run them as `call conda ...` if you 
echo are using those commands in another batch script)
timeout /t 10

call conda activate base
