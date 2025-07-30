#!/bin/bash

# This script creates a compressed backup of a specified directory
# without preserving the full absolute path in the archive.

SOURCE_PATH=$1
DEST_DIR=$2

# Get the parent directory and the final directory name from the source path
PARENT_DIR=$(dirname "$SOURCE_PATH")
DIR_TO_BACKUP=$(basename "$SOURCE_PATH")

# Create a timestamp
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE_FILE="backup_$TIMESTAMP.tar.gz"

# The -C flag tells tar to change to the PARENT_DIR before archiving the DIR_TO_BACKUP.
# This ensures only the target directory is at the root of the archive.
tar -czvf "$DEST_DIR/$ARCHIVE_FILE" -C "$PARENT_DIR" "$DIR_TO_BACKUP"

echo "Backup of '$SOURCE_PATH' created at '$DEST_DIR/$ARCHIVE_FILE'"