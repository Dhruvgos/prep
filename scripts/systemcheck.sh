#!/bin/bash

echo "System Health Check"

df -h / | awk '
NR > 1 {

    DISK_USAGE=$5

    gsub(/%/, "", DISK_USAGE)

    if (DISK_USAGE > 80) {
        print "Warning"
    }

    print "Disk Usage:", DISK_USAGE "%"
}'

 free | awk '
NR==2 {
    save=$3/$2
    printf "RAM usage is: %.1f%%\n", save*100
}
'

uptime | awk '{gsub(",","",$9); print "Uptime is : " $9}'
