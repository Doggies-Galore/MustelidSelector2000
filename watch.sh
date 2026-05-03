#!/bin/bash
# Mustelid Sorter - Live Dashboard Viewer
DASHBOARD_FILE="data/dashboard.txt"

# Ensure the file exists
touch "$DASHBOARD_FILE"

# Clear and print the dashboard every time it changes
while true; do
    clear
    cat "$DASHBOARD_FILE"
    # Use fswatch if available, otherwise just sleep
    if command -v fswatch >/dev/null 2>&1; then
        fswatch -1 "$DASHBOARD_FILE" >/dev/null 2>&1
    else
        sleep 1
    fi
done
