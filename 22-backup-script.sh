#!/bin/bash

# Check if source and destination directories are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Assign source and destination directories
source_dir="$1"
destination_dir="$2"

# Check if source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Source directory '$source_dir' not found."
    exit 1
fi

# Check if destination directory exists, create it if not
if [ ! -d "$destination_dir" ]; then
    mkdir -p "$destination_dir"
fi

# Create a timestamp for the backup filename
timestamp=$(date +"%Y%m%d_%H%M%S")

# Create compressed archive of source directory in destination directory
backup_file="$destination_dir/backup_$timestamp.tar.gz"
tar -czf "$backup_file" -C "$source_dir" .

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successfully created: $backup_file"
else
    echo "Backup failed."
fi
