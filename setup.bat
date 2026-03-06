@echo off
REM One-time setup: create venv and install dependencies.
REM Run from project root: setup.bat

cd /d "%~dp0"

if not exist "venv" (
  echo Creating virtual environment...
  python -m venv venv
)

echo Installing dependencies...
call venv\Scripts\pip install -q --upgrade pip
call venv\Scripts\pip install -q -r requirements.txt

echo Setup complete. Run the app with: run.bat (or: venv\Scripts\python app.py)
echo In Cursor/VS Code you can also press F5 to start the app.
