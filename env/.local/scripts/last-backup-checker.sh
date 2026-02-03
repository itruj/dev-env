#!/usr/bin/env bash

EPOCH_FORMAT_FILE="$HOME/last-backup-date"

last_backup_date=$(< "$EPOCH_FORMAT_FILE")
now=$(date +%s)
today=$(date -d "@$now" +%A)

seconds_diff=$((now - last_backup_date))
days_between_backups=$((seconds_diff / 86400))
days_between_backups_formatted=$(printf "%02d" "$days_between_backups")

if [[ $days_between_backups -ge 6 ]]; then
    read -r -d '' backup_notice << EOF
*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+**+*+*+*+**+*+*+*+*
*      You need to backup your home directory and Gitea.      *
*          It's been $days_between_backups_formatted days since the last backup.           *
*++**+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*
EOF

    echo "$backup_notice"

    if [[ "$today" != "Saturday" ]]; then
        echo -e "\nP.S. The backup process takes a long time and we recommend\nwaiting until Saturday to run it."
    fi
fi
