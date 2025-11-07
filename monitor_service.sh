#!/bin/bash
# Multi-Service Uptime Monitor Script

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

while true; do
    echo "Checking services at $(date '+%H:%M:%S')" >> "$LOG_FILE"
    while IFS= read -r SERVICE || [ -n "$SERVICE" ]; do
        SERVICE=$(echo "$SERVICE" | tr -d '\r')
        [[ -z "$SERVICE" || "$SERVICE" =~ ^# ]] && continue
        check_service "$SERVICE"
    done < $SERVICES_FILE
    echo "Sleeping for $CHECK_INTERVAL seconds..."
    sleep "$CHECK_INTERVAL"
done

