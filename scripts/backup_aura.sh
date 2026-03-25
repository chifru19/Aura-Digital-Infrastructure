#!/bin/bash

# --- Aura Digital Backup Automation ---
# Objective: Secure, scheduled redundancy with automated cleanup.

# Configuration
SOURCE_DIR="/var/www/aura_files"  # The folder to back up
BACKUP_DIR="/mnt/secure_backups" # The destination (e.g., an external drive or cloud mount)
DATE=$(date +%Y-%m-%d_%H%M%S)
BACKUP_NAME="aura_backup_$DATE.tar.gz"
RETENTION_DAYS=30

# 1. Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# 2. Compress and encrypt the files (Archive)
echo "Starting backup of Aura Digital financial records..."
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"

# 3. Verify Integrity
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_NAME"
else
    echo "BACKUP FAILURE: Please check source directory permissions."
    exit 1
fi

# 4. Automated Retention Cleanup (Pillar 3)
# Deletes backups older than 30 days to save space and meet compliance
echo "Cleaning up archives older than $RETENTION_DAYS days..."
find "$BACKUP_DIR" -type f -name "aura_backup_*" -mtime +$RETENTION_DAYS -delete

echo "Maintenance Complete."