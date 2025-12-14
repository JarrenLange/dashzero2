#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="/home/jarren/Documents/DashZeroVibe/dashzero2"
cd "$PROJECT_DIR"

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
