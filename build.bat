@echo off
set PROFILE=%1
if "%PROFILE%" == "" (
    echo profile:local
    mvn clean package -Plocal -DskipTests
    echo profile:local
    pause
) else (
    echo profile:%PROFILE%
    mvn clean package -P%PROFILE% -DskipTests
    echo profile:%PROFILE%
    pause
)