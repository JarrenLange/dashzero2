#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="/home/jarren/Documents/DashZeroVibe/dashzero2"
cd "$PROJECT_DIR"

# Guard: helpful error when the project directory is missing
if [ ! -d "$PROJECT_DIR" ]; then
  echo "ERROR: Project directory '$PROJECT_DIR' not found." >&2
  echo "Please clone the repo to that path or edit this script to point to the correct location." >&2
  exit 2
fi

# Ensure virtualenv exists and activate it
if [ -d venv ]; then
  # shellcheck source=/dev/null
  source venv/bin/activate
else
  python3 -m venv venv
  # shellcheck source=/dev/null
  source venv/bin/activate
  pip install -U pip setuptools wheel
  pip install -r requirements.txt
fi

# Run the app (replace python with full path if necessary)
exec python main.py
