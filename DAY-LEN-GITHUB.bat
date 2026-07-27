@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ============================================
echo   Cap nhat kho conic-toan len GitHub
echo ============================================
echo.

echo [1/5] Don file khoa cua git (do sandbox de lai) ...
if exist ".git\index.lock" del /f /q ".git\index.lock"
if exist ".git\HEAD.lock" del /f /q ".git\HEAD.lock"
for /r ".git\objects" %%f in (tmp_obj_*) do del /f /q "%%f" 2>nul
if exist ".git\objects\maintenance.lock" del /f /q ".git\objects\maintenance.lock"

echo [2/5] Xoa thu muc anh nhap img\ ...
if exist "img" rmdir /s /q "img"

echo [3/5] Doi remote sang conic-toan ...
git remote set-url origin https://github.com/Thutran1891/conic-toan.git
git remote -v

echo.
echo ============================================
echo  TRUOC KHI TIEP TUC: doi ten kho tren GitHub
echo    https://github.com/Thutran1891/baigiang
echo    Settings -^> Repository name -^> conic-toan -^> Rename
echo ============================================
pause

echo [4/5] Commit ...
git add -A
git commit -m "Doi ten goi thanh conic-toan, them anh minh hoa va gioi thieu tieng Anh"

echo [5/5] Push ...
git push
if errorlevel 1 (
  echo.
  echo Push that bai. Kiem tra da doi ten kho tren GitHub chua.
) else (
  git tag -f v0.2.0
  git push -f origin v0.2.0
  echo.
  echo XONG: https://github.com/Thutran1891/conic-toan
)
echo.
pause
