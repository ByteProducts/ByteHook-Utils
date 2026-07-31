@echo off

echo =========================
echo Running Selene...
echo =========================
echo.

selene src
if errorlevel 1 (
    echo.
    echo Selene found issues.

    exit /b 1
)

echo.
echo =========================
echo Finished successfully.
echo =========================
