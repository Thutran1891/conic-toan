@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"

rem =====================================================================
rem  FILE CU (07/2026) - dung MOT LAN de tao kho lan dau, hoi ten tai
rem  khoan roi tro remote sang https://github.com/<user>/baigiang.git.
rem  Kho that nay TEN LA conic-toan, nen chay bay gio se `git remote
rem  remove origin` roi gan remote SAI -> push hong, phai go tay lai.
rem  Kho da tao roi: chi can DONG-BO-CONIC-TOAN.bat de commit + push.
rem =====================================================================
echo ============================================
echo   *** FILE CU - TAO KHO LAN DAU, DOI REMOTE ***
echo ============================================
echo.
echo  Kho conic-toan da tao tu 07/2026 va dang chay tot.
echo  File nay se GO remote hien tai va tro sang .../baigiang.git (SAI TEN).
echo.
set "DONGY="
set /p DONGY=Van muon chay file cu nay? Go: TOI HIEU  (Enter = thoat):
if /i not "%DONGY%"=="TOI HIEU" (
  echo.
  echo Da thoat, khong lam gi ca.
  echo.
  pause
  exit /b 0
)

echo ============================================
echo   Dua goi baigiang 0.2.0 len GitHub
echo ============================================
echo.

where git >nul 2>&1
if errorlevel 1 (
  echo [LOI] Chua cai Git. Chay: winget install --id Git.Git
  pause & exit /b 1
)

set /p GHUSER=Nhap ten tai khoan GitHub cua co: 
if "%GHUSER%"=="" (echo Chua nhap ten. & pause & exit /b 1)

echo.
echo [1/5] Thay YOUR-GITHUB-USERNAME bang %GHUSER% ...
powershell -NoProfile -Command "foreach($f in @(typst.toml,README.md,HUONG-DAN-PUSH.md)){$p=Join-Path $PWD $f; if(Test-Path $p){$c=Get-Content -Raw -Encoding UTF8 $p; $c=$c -replace YOUR-GITHUB-USERNAME,%GHUSER%; Set-Content -NoNewline -Encoding UTF8 $p $c}}"

echo [2/5] Khoi tao kho git ...
if not exist ".git" (
  git init -b main
  git config user.name "Kim Thu"
  git config user.email "kimthitran9410@gmail.com"
)

echo [3/5] Commit ...
git add -A
git commit -m "baigiang 0.2.0 - thu vien Typst cho bai giang va de thi Toan THPT"

echo [4/5] Gan remote ...
git remote remove origin 2>nul
git remote add origin https://github.com/%GHUSER%/baigiang.git

echo.
echo ============================================
echo  TRUOC KHI PUSH: tao kho rong tren GitHub
echo  https://github.com/new
echo    - Repository name : baigiang
echo    - Public
echo    - KHONG tich Add README / gitignore / license
echo ============================================
echo.
pause

echo [5/5] Push ...
git push -u origin main
if errorlevel 1 (
  echo.
  echo Push that bai. Kiem tra da tao kho tren GitHub chua,
  echo va da dang nhap GitHub trong cua so hien ra chua.
) else (
  git tag v0.2.0
  git push origin v0.2.0
  echo.
  echo XONG. Xem tai: https://github.com/%GHUSER%/baigiang
)
echo.
pause
