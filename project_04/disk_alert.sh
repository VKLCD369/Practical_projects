#!/bin/bash

THERSHOLD=70
EMAIL="vamki0306@gmail.com"

USAGE=$(df / | tail -l | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THERSHOLD" ]; then
  echo "Disk usage is ${USAGE}% on $(hostname)" | mail -s "Disk alert" $EMAIL
fi


