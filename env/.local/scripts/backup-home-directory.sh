#!/usr/bin/env bash

if [ "$#" -lt 2 ]; then
    echo "Usage: <source directory> <target directory>"
else
    rsync -avz --delete --exclude=".cache" "$1" "$2" && echo $(date +%s) > $HOME/last-backup-date

    echo "Inspect logs for any errors and verify epoch timestamp for the correct date/time."
fi
