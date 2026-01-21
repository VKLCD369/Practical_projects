#!/bin/bash

################################
# Author: vamshikiran
# Date: 21/1/2026
# Version: V1
# script: website monitoring with script
# ############################
#


WEBSITE="goosdfsadfgle.com"
EMAIL="vamshikiran369@gmail.com"
LOG_FILE="/var/log/website_monitor.log"

ping -c 2 $WEBSITE > /dev/null 2>&1

if [ $? -ne 0 ]; then
  MESSAGES="ALERT: website $WEBSITE is down at $(date)"
  echo "$MESSAGES" | mail -s "website down alert" $EMAIL
  echo "$MESSAGES" >> $LOG_FILE
else
  echo "website $WEBSITE is up at $(date)" >> $LOG_FILE
fi

