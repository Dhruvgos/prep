#!/bin/bash

name=$1
date1=$(date +%d%m%Y)
f_name="bkp_""$date1"


if [ -z "$name" ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

zip -r $f_name.zip $name

mv $f_name.zip /home/test/linux-devops-lab/backups

echo "Successfully created backup"
