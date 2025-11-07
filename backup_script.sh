#!/bin/bash
# Automated Backup Script

SOURCE_DIRS=("/home/user/Documents" "/home/user/Pictures")
BACKUP_DIR="/home/user/backups"
LOG_FILE="$BACKUP_DIR/backup.log"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
RETENTION_DAYS=7

mkdir -p "$BACKUP_DIR"

echo "[$(date +%Y-%m-%d_%H-%M-%S)] Starting backup..." >> "$LOG_fILE"

tar -czf "$BACKUP_FILE" "${SOURCE_DIRS[@]}" 2>> "$LOG_FILE"

if [ $? -eq 0 ]; then
    echo "[$(date)] Backup successful: $BACKUP_FILE" >> "$LOG_FILE"    
else
    echo "[$(date)] Backup FAILED!" >> "$LOG_FILE"
fi

echo "$(date) Cleaning backups older than $RETENTION_DAYS days..." >> "$LOG_FILE"
OLD_BACKUPS=$(find "$BACKUP_DIR" -name "backup_*.tar.gz" -type f -mtime +$RETENTION_DAYS)

if [ -n $OLD_BACKUPS ]; then
    echo "Deleting the following old backups..." >> "$LOG_FILE"
    echo $OLD_BACKUPS >> "$LOG_FILE"
    find "$BACKUP_DIR" -name "backup_*.tar.gz" -type f -mtime +$RETENTION_DAYS -exec rm -f {} +

    if find "$BACKUP_DIR" -type f -mtime +$DAYS_TO_KEEP | grep -q .; then
        echo "Some old backups could not be deleted."
    else
        echo "All old backups deleted successfully."
    fi
else
    echo "[$(date)] No old backups for cleanup." >> "$LOG_FILE"
fi

echo "[$(date)] Backup process completed." >> "$LOG_FILE"
echo "--------------------------------------------------" >> "$LOG_FILE"
