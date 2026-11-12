@echo off
chcp 65001 >nul
title MoneyMap - Testar app no PC
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo [ERRO] Instale o Node.js (LTS) em https://nodejs.org
  pause
  exit /b 1
)
call npm install
call npm run app
