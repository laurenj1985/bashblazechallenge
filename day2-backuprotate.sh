#!/bin/bash

#exit if fails
set -e

#check for input argument
if [[ -z "$1" ]];then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

#input and backup base directory
SOURCE_DIR="$1"
BACKUP_BASE="/mnt/c/Users/admin/Documents/backup-practice"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="$BACKUP_BASE/backup_$TIMESTAMP"

#create backup base directory if not created
mkdir -p "BACKUP_BASE"

# Check if source directory exists
if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Perform backup
cp -r "$SOURCE_DIR" "$BACKUP_DIR"
echo "Backup created at: $BACKUP_DIR"

# Rotate: keep only the 3 most recent backups
cd "$BACKUP_BASE"
BACKUP_COUNT=$(ls -d backup_* 2>/dev/null | wc -l)

if [[ $BACKUP_COUNT -gt 3 ]]; then
    TO_DELETE=$(ls -dt backup_* | tail -n +4)
    echo "Deleting old backups:"
    echo "$TO_DELETE"
    rm -rf $TO_DELETE
fi