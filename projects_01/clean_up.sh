#!/bin/bash

########################
# Author: vamshikiran
# Date: 11th jan
# Version: v1
# Script: Devops project for cleaning logs
#######################


LOG_DIR="/var/log/myapp"
DAYS=7
LOG_FILE="/var/log/log_cleanup.log"

echo "_____________________________" >> $LOG_FILE
echo "Cleanup started at $(date)" >> $LOG_FILE

if [ ! -d "$LOG_DIR" ]; then
  echo "Directory $LOG_DIR does not exit" >> $LOG_FILE
  exit 1
fi

find "$LOG_DIR" -type f -mtime +$DAYS -exec rm -f {} \;

echo "Cleanup completed at $(date)" >> $LOG_FILE
