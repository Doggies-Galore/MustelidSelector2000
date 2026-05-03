#!/bin/bash

# Mustelid Sorter 2000 - Archive and Reset Tool
DATA_DIR="data"
ARCHIVE_DIR="$DATA_DIR/archives"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
SESSION_ARCHIVE="$ARCHIVE_DIR/session_$TIMESTAMP"

echo "Starting Archive and Reset process..."

# 1. Create Archive Directory
mkdir -p "$SESSION_ARCHIVE"

# 2. Identify and Move Files
echo "Archiving current session data to $SESSION_ARCHIVE..."

# Final rankings
if ls $DATA_DIR/final_*.json >/dev/null 2>&1; then
    mv $DATA_DIR/final_*.json "$SESSION_ARCHIVE/"
fi

# Core data files
[ -f "$DATA_DIR/users.json" ] && cp "$DATA_DIR/users.json" "$SESSION_ARCHIVE/"
[ -f "$DATA_DIR/comparisons_log.txt" ] && mv "$DATA_DIR/comparisons_log.txt" "$SESSION_ARCHIVE/"
[ -f "$DATA_DIR/problems.json" ] && mv "$DATA_DIR/problems.json" "$SESSION_ARCHIVE/"
[ -f "$DATA_DIR/dashboard.txt" ] && cp "$DATA_DIR/dashboard.txt" "$SESSION_ARCHIVE/"

# 3. Reset Data Files
echo "Resetting server progress..."
echo "{}" > "$DATA_DIR/users.json"
echo "[]" > "$DATA_DIR/problems.json"
> "$DATA_DIR/dashboard.txt"

echo "Archive complete. Server has been reset to a clean state."
echo "You may want to run ./manage.sh restart to ensure everything is fresh."
