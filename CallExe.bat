@echo off
setlocal
set DEMO1=2.0.0.0
set DEMO12=1.0.0.4
set DEMO13=4.0.0.0

echo =================================================
echo A Test Demo!!!
echo   DEMO1: %DEMO1%
echo   DEMO2: %DEMO2%
echo   DEMO3: %DEMO3%
echo =================================================
echo.

set /P CONFIRM="input[y] go on or exit"
if not "%CONFIRM%" == "y" (
  goto abort
)

set DEFAULT_INFO=localhost

set /P INFO="input INFO value(Default: %DEFAULT_INFO%): "



pushd %~dp0

call test.exe -info=%INFO%
if %errorlevel% == -1 (
  goto error
)
if %Errorlevel% == 0 (
  goto success
)
popd

:error
echo.
echo error
echo.
goto end

:abort
echo.
echo abort
echo.
goto end

:success
echo.
echo success
echo.
goto end

:end
endlocal

pause
