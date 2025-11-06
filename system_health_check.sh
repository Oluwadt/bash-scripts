#!/bin/bash
# System Health Check Script

# Get CPU usage
check_cpu() {
    echo "CPU Load:"
    uptime | awk -F'load average:' '{ print $2 }'
    echo
}

# Get Memory Usage
check_memory () {
    echo "Menory Usage"
    free -h | awk '/Mem:/ {print "Used: "$3" | Free: "$4" | Total: "$2}'
    echo
}

check_cpu
check_memory
