#!/usr/bin/env bash

if [ "$#" -lt 4 ]; then
    echo "Usage: backup-home-directory.sh <exclude file> <log file> <source directory> <target directory> [--debug]"
elif [[ " $* " == *' --debug '* ]]; then
    rsync -anq --copy-links --delete --exclude-from="$1" --log-file="$2" "$3" "$4"

    echo -e "\n[backup-home-directory.sh]: Debug run complete. Inspect output or logs for any errors."
else
    rsync -av --copy-links --delete --exclude-from="$1" --log-file="$2" "$3" "$4" && echo $(date +%s) > $HOME/last-backup-date

    echo -e "\n[backup-home-directory.sh]: Inspect output for any errors. If none, then verify written epoch timestamp for the correct date and time."
fi
