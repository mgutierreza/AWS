#!/bin/bash

BUCKET_NAME="backups.epsgrau.pe"
FOLDER_NAME="Backup-eps/mesadepartes/"

aws s3api list-objects --bucket $BUCKET_NAME --prefix $FOLDER_NAME --query 'Contents[].{Key: Key}' --output text | while read -r line
do
    restore_status=$(aws s3api head-object --bucket $BUCKET_NAME --key "$line" --query 'Restore' --output text)
    if [[ $restore_status == "None" ]]; then
        echo "Restoring: $line"
        aws s3api restore-object --bucket $BUCKET_NAME --key "$line" --restore-request '{"Days": 1, "GlacierJobParameters": {"Tier": "Standard"}}'
    fi
done

