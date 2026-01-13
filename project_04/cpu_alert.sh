#!/bin/bash

LOAD=$(uptime | awk -F'load average:' '{print $2}' | cut -d',' -f1)
THERSHOLD=1.5

if (( $(echo "$LOAD > $THERSHOLD" | bc -l) )); then
  echo "Hight cpu usage: $LOAD" | mail -s "CPU ALERT" vamki0306@gmail.com
fi


