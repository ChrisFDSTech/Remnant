SET WorkingDir=%cd%
SET PSPath='%WorkingDir%\BPInstall.ps1'
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& %PSPath%"
