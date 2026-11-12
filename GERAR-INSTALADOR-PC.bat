@echo off
chcp 65001 >nul
title MoneyMap - Gerar instalador para PC
cd /d "%~dp0"
echo ==================================================
echo   MoneyMap - GERAR INSTALADOR PARA PC (Windows)
echo   by ZoxCode
echo ==================================================
echo.
where node >nul 2>nul
if errorlevel 1 (
  echo [ERRO] Node.js nao encontrado.
  echo Instale a versao LTS em https://nodejs.org e rode este arquivo de novo.
  start https://nodejs.org
  pause
  exit /b 1
)
set CSC_IDENTITY_AUTO_DISCOVERY=false
echo [1/2] Instalando dependencias (so demora na primeira vez)...
call npm install
if errorlevel 1 goto erro
echo.
echo [2/2] Gerando o instalador...
call npm run dist
if errorlevel 1 goto erro
echo.
echo ==================================================
echo   PRONTO! O instalador esta na pasta "instalador":
echo   MoneyMap-Instalador-1.0.0.exe
echo ==================================================
start "" "%~dp0instalador"
pause
exit /b 0
:erro
echo.
echo [ERRO] Nao foi possivel gerar o instalador.
echo Dicas: confira a internet; se aparecer erro de "symbolic link",
echo clique com o botao direito neste arquivo e use "Executar como administrador".
pause
exit /b 1
