#!/usr/bin/env bash
# Run the app (after setup.sh has been run once).
set -e
cd "$(dirname "$0")"
./venv/bin/python app.py
