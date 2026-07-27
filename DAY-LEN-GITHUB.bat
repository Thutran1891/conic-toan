@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ============================================
echo   Cap nhat kho conic-toan len GitHub
echo ============================================
echo.

echo [1/4] Don file khoa cua git (do sandbox de lai) ...
if exist ".git\index.lock" del /f /q ".git\index.lock"
if exist ".git\HEAD.lock" del /f /q ".git\HEAD.lock"
for /r ".git\objects" %%f in (tmp_obj_*) do del /f /q "%%f" 2>nul
if exist ".git\objects\maintenance.lock" del /f /q ".git\objects\maintenance.lock"
if exist "img" rmdir /s /q "img"

echo [2/4] Kiem tra remote ...
git remote set-url origin https://github.com/Thutran1891/conic-toan.git
git remote -v

echo [3/4] Commit ...
git add -A
git commit -m "Loi giai gan tung y cho #ds, co khoa hoan vi, limits(lim) trong khao sat"

echo [4/4] Push ...
git push
if errorlevel 1 (
  echo.
  echo Push that bai. Kiem tra ten kho tren GitHub da la conic-toan chua.
) else (
  echo.
  echo XONG: https://github.com/Thutran1891/conic-toan
)
echo.
pause
