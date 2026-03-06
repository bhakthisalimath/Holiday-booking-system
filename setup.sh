#!/usr/bin/env bash
# One-time setup: create venv and install dependencies.
# Run from project root: ./setup.sh

set -e
cd "$(dirname "$0")"

if [ ! -d "venv" ]; then
  echo "Creating virtual environment..."
  python3 -m venv venv
fi

echo "Installing dependencies..."
./venv/bin/pip install -q --upgrade pip
./venv/bin/pip install -q -r requirements.txt

echo "Setup complete. Run the app with: ./run.sh (or: venv/bin/python app.py)"
echo "In Cursor/VS Code you can also press F5 to start the app."
