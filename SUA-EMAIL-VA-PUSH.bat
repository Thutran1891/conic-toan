@echo off
chcp 65001 >nul
cd /d "%~dp0"

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
