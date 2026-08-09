@echo off
chcp 65001 >nul
cd /d "%~dp0"

rem =====================================================================
rem  FILE CU (07/2026) - NGUY HIEM NHAT trong bo .bat. Viet mot lan duy
rem  nhat de sua email tac gia cua commit DAU TIEN. Chay bay gio se:
rem    - `git commit --amend --reset-author` GHI DE commit moi nhat va
rem      dat lai loi commit thanh "baigiang 0.2.0 - thu vien Typst...";
rem    - `git tag -f v0.2.0` + `git push -f` -> DAY EP len GitHub, mat
rem      commit that (lich su viet lai khong lay lai duoc de dang).
rem  Cong viec hang ngay: DONG-BO-CONIC-TOAN.bat (tu commit + push).
rem =====================================================================
echo ============================================
echo   *** FILE CU - GHI DE COMMIT VA PUSH EP (-f) ***
echo ============================================
echo.
echo  File nay AMEND commit moi nhat roi force-push. Chi dung neu co
echo  THAT SU muon viet lai lich su kho conic-toan.
echo  Muon day thay doi binh thuong: dong cua so nay,
echo  nhay D:\TYPST BEAMER\DONG-BO-CONIC-TOAN.bat.
echo.
set "DONGY="
set /p DONGY=Van muon ghi de commit va push ep? Go: TOI HIEU  (Enter = thoat):
if /i not "%DONGY%"=="TOI HIEU" (
  echo.
  echo Da thoat, khong lam gi ca.
  echo.
  pause
  exit /b 0
)

echo ============================================
echo   Sua email tac gia va push len GitHub
echo ============================================
echo.

git config user.name "Kim Thu"
git config user.email "kimthitran9410@gmail.com"

echo [1/3] Ghi lai commit voi email dung ...
git add -A
git commit --amend --reset-author -m "baigiang 0.2.0 - thu vien Typst cho bai giang va de thi Toan THPT"

echo.
echo [2/3] Kiem tra tac gia commit:
git log -1 --pretty=format:"  %%an ^<%%ae^>"
echo.
echo.
echo ============================================
echo  Neu chua tao kho tren GitHub thi tao ngay:
echo  https://github.com/new
echo    - Repository name : baigiang
echo    - Public
echo    - KHONG tich Add README / gitignore / license
echo ============================================
pause

echo [3/3] Push ...
git push -u origin main
if errorlevel 1 (
  echo.
  echo Push that bai. Kiem tra da tao kho tren GitHub va da dang nhap chua.
) else (
  git tag -f v0.2.0
  git push -f origin v0.2.0
  echo.
  echo XONG: https://github.com/Thutran1891/baigiang
)
echo.
pause
