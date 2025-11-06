#!/bin/bash
# Automated Backup Script

SOURCE_DIRS=("/home/user/Documents" "/home/user/Pictures")
BACKUP_DIR="/home/user/backups"
LOG_FILE="$BACKUP_DIR/backup.log"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

