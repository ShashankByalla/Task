#!/bin/bash

# Script to automate backup to a remote server or cloud storage

# Configuration
source_directory="/path/to/source_directory"  # Replace with your source directory
remote_server="user@remote_server:/path/to/backup_directory"  # Replace with your remote server details
log_file="/path/to/backup.log"  # Replace with the desired log file path

# Timestamp for log entries
timestamp() {
  date +"%Y-%m-%d %T"
}

# Start of the backup process
echo "Starting backup at $(timestamp)" >> "$log_file"

# Check if the source directory exists
if [ ! -d "$source_directory" ]; then
  echo "Error: Source directory does not exist." >> "$log_file"
  echo "Backup failed. Source directory does not exist."
  exit 1
fi

# Execute the backup using rsync
rsync -avz --delete "$source_directory" "$remote_server" >> "$log_file" 2>&1

# Check the exit status of rsync
if [ $? -eq 0 ]; then
  echo "Backup completed successfully at $(timestamp)" >> "$log_file"
  echo "Backup completed successfully."
else
  echo "Error: Backup failed at $(timestamp)" >> "$log_file"
  echo "Backup failed. Check the log file for details: $log_file"
fi
