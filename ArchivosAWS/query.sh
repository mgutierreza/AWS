#!/bin/bash

BUCKET_NAME="backups.epsgrau.pe"
FOLDER_NAME="Backup-eps/mesadepartes/"

aws s3api list-objects --bucket $BUCKET_NAME --prefix $FOLDER_NAME --query 'Contents[].{Key: Key}' --output text | while read -r line
do
    echo "Archivo : $line"
done
