#!/bin/bash

# Mustelid Sorter 2000 - Server Management Tool
# Usage: ./manage.sh [start|stop|restart|logs]

VENV_PATH="venv"
SERVER_SCRIPT="mustelid-sort.py"
LOG_FILE="server.log"

case "$1" in
    start)
        echo "Starting Mustelid Sorter Server..."
        if pgrep -f "$SERVER_SCRIPT" > /dev/null; then
            echo "Server is already running."
        else
            source "$VENV_PATH/bin/activate"
            nohup python3 "$SERVER_SCRIPT" > "$LOG_FILE" 2>&1 &
            echo "Server started in background. Logs available at $LOG_FILE"
        fi
        ;;
    stop)
        echo "Stopping Mustelid Sorter Server..."
        pkill -f "$SERVER_SCRIPT"
        echo "Server stopped."
        ;;
    restart)
        echo "Restarting Mustelid Sorter Server..."
        pkill -f "$SERVER_SCRIPT"
        sleep 1
        source "$VENV_PATH/bin/activate"
        nohup python3 "$SERVER_SCRIPT" > "$LOG_FILE" 2>&1 &
        echo "Server restarted."
        ;;
    logs)
        echo "Tailing server logs..."
        tail -f "$LOG_FILE"
        ;;
    *)
        echo "Usage: ./manage.sh {start|stop|restart|logs}"
        exit 1
        ;;
esac
