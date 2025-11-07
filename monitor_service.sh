#!/bin/bash
# Service Uptime Monitor Script

SERVICES_FILE="services.txt"
LOG_FILE="service_check.log"
EMAIL="admin@company.com"
CHECK_INTERVAL=60

log_message () {
    echo "[$(date '+%Y-%m-%d %H:%M:%S') - $1]" >> "$LOG_FILE"
}

check_service () {
    local SERVICE=$1
    curl -Is --max-time 10 "$SERVICE" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        log_message "$SERVICE is UP"
    else
        log_message "$SERVICE is DOWN"
    fi
}
