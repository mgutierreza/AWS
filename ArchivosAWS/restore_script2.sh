#!/bin/bash

BUCKET_NAME="backups.epsgrau.pe"
FOLDER_NAME="Backup-eps/oficinaVirtual/solicitudProblemas/pruebas/2023/"

objects=$(aws s3api list-objects --bucket $BUCKET_NAME --prefix $FOLDER_NAME --query 'Contents[].{Key: Key}' --output text)

for object in $objects
do
    restore_status=$(aws s3api head-object --bucket $BUCKET_NAME --key $object --query 'Restore' --output text)
    storage_class=$(aws s3api head-object --bucket $BUCKET_NAME --key $object --query 'StorageClass' --output text)
    if [ "$restore_status" == "None" ] && [ "$storage_class" == "DEEP_ARCHIVE" ]
    then
        echo "Restoring: $object"
        aws s3api restore-object --bucket $BUCKET_NAME --key $object --restore-request '{"Days": 1, "GlacierJobParameters": {"Tier": "Standard"}}'
    fi
done
