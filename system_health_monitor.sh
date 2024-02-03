#!/bin/bash

# Set your predefined thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

# Function to check CPU usage
check_cpu() {
    local cpu_usage=$(top -b -n1 | grep "%Cpu(s)" | awk '{print $2}' | cut -d. -f1)
    
    if [ "$cpu_usage" -gt "$CPU_THRESHOLD" ]; then
        echo "High CPU usage detected: $cpu_usage%." 
        # You can add additional actions here, such as sending an email or logging to a file.
    fi
}

# Function to check memory usage
check_memory() {
    local memory_usage=$(free | awk '/Mem/{printf("%.2f"), $3/$2*100}')
    
    if [ "$memory_usage" -gt "$MEMORY_THRESHOLD" ]; then
        echo "High memory usage detected: $memory_usage%." 
        # You can add additional actions here, such as sending an email or logging to a file.
    fi
}

# Function to check disk space
check_disk() {
    local disk_usage=$(df -h / | awk '/\//{print $(NF-1)}' | sed 's/%//')
    
    if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
        echo "High disk space usage detected: $disk_usage%." 
        # You can add additional actions here, such as sending an email or logging to a file.
    fi
}

# Function to check running processes
check_processes() {
    local num_processes=$(ps aux --no-heading | wc -l)
    
    if [ "$num_processes" -gt 100 ]; then
        echo "High number of processes detected: $num_processes." 
        # You can add additional actions here, such as sending an email or logging to a file.
    fi
}

# Main function to execute checks
main() {
    check_cpu
    check_memory
    check_disk
    check_processes
}

# Execute the main function
main
