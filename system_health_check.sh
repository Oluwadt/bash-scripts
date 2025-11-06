#!/bin/bash
# System Health Check Script

# Get CPU usage
check_cpu() {
    echo "CPU Load:"
    uptime | awk -F'load average:' '{ print $2 }'
    echo
}

check_cpu
