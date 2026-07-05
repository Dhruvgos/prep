#!/bin/bash

set -euo pipefail
date1=$(date +"%Y-%m-%d_%H-%M-%S")
f_name="logs_""$date1"

cd "/home/test/linux-devops-lab/scripts"

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Put 2>&1 HERE, so it captures the output of logging.sh
logs=$(./logging.sh 2>&1)

echo "$logs">"$f_name"

mv "$f_name" "/home/test/linux-devops-lab/backups/logs_bkp/"
