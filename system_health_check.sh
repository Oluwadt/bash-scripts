#!/bin/bash
# System Health Check Script

# Get CPU Usage
check_cpu() {
    echo "CPU Load:"
    uptime | awk -F'load average:' '{ print $2 }'
    echo
}

# Get Memory Usage
check_memory () {
    echo "Memory Usage"
    free -h | awk '/Mem:/ {print "Used: "$3" | Free: "$4" | Total: "$2}'
    echo
}

# Get Disk Usage
check_disk () {
    echo "Disk Usage:"
    df -h --total | awk '/total/ { print "Used: "$3" | Free: "$4" | Usage: "$5 }'
    echo
}

# Get Network Info
check_network () {
    echo "Network Information:"
    ip -br address | awk '{ print $1": "$3 }'
    echo
}

echo "====================================================="
echo " SYSTEM HEALTH REPORT - $(date)"
echo "====================================================="

check_cpu
check_memory
check_disk
check_network

echo "============================================"
echo " Report Generated Successfully."
echo "============================================"
