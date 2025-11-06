#!/bin/bash
# Automated Backup Script

SOURCE_DIRS=("/home/user/Documents" "/home/user/Pictures")
BACKUP_DIR="/home/user/backups"
LOG_FILE="$BACKUP_DIR/backup.log"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

echo "[$(date +%Y-%m-%d_%H-%M-%S)] Starting backup..." >> "$LOG_fILE"

tar -czf "$BACKUP_FILE" "${SOURCE_DIRS[@]}" 2>> "$LOG_FILE"

if [ $? -eq 0 ]; then
    echo "[$(date)] Backup successful: $BACKUP_FILE" >> "$LOG_FILE"    
else
    echo "[$(date)] Backup FAILED!" >> "$LOG_FILE"
fi

echo "[$(date)] Backup process completed." >> "$LOG_FILE"

