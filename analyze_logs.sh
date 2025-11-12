#!/bin/bash

LOG_DIR="./logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")
REPORT_FILE="$LOG_DIR/log_analysis_report.txt"

echo "Analyzing log files" > "$REPORT_FILE"
echo "====================" >> "$REPORT_FILE"

echo -e "\nList of log files updated in last 24 hours" >> "$REPORT_FILE"
LOG_FILES=$(find "$LOG_DIR" -name "*.log" -mtime -1)
echo "$LOG_FILES" >> "$REPORT_FILE"

IFS=$'\n'
for LOG_FILE in $LOG_FILES; do
    echo -e "\n" >> "$REPORT_FILE"
    echo "==============================================================" >> "$REPORT_FILE"
    echo "$LOG_FILE" >> "$REPORT_FILE"
    echo "==============================================================" >> "$REPORT_FILE"
    for ERROR_PATTERN in "${ERROR_PATTERNS[@]}"; do
        echo -e "\nSearching for ${ERROR_PATTERN} logs in \"$LOG_FILE\" file" >> "$REPORT_FILE"
        grep "${ERROR_PATTERN}" "$LOG_FILE" >> "$REPORT_FILE"

        echo -e "\nNumber of ${ERROR_PATTERN} logs in \"$LOG_FILE\" file" >> "$REPORT_FILE"
        ERROR_COUNT=$(grep -c "$ERROR_PATTERN" "$LOG_FILE")
        echo $ERROR_COUNT >> "$REPORT_FILE"

        if [ "$ERROR_COUNT" -gt 5 ]; then
            echo "⚠ Action required: Too many ${ERROR_PATTERN} issues in log file"
        fi
    done
done
unset IFS

echo -e "\nLog analysis complete and report saved in: $REPORT_FILE"
