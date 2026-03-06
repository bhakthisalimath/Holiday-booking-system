@echo off
REM Run the app (after setup.bat has been run once).
cd /d "%~dp0"
venv\Scripts\python app.py
