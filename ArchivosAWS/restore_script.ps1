$BUCKET_NAME="backups.epsgrau.pe"
$FOLDER_NAME="Backup-eps/oficinaVirtual/solicitudFactibilidad/documentosAdjuntos/2023/"

$objects = aws s3api list-objects --bucket $BUCKET_NAME --prefix $FOLDER_NAME --query 'Contents[].{Key: Key}' --output text

foreach ($object in $objects)
{
    $restore_status = aws s3api head-object --bucket $BUCKET_NAME --key $object --query 'Restore' --output text
    if ($restore_status -eq "None")
    {
        Write-Host "Restoring: $object"
        aws s3api restore-object --bucket $BUCKET_NAME --key $object --restore-request '{\"Days\": 1, \"GlacierJobParameters\": {\"Tier\": \"Standard\"}}'
    }
}

/** Guardar archivo que cumplen condición **/

$BUCKET_NAME="backups.epsgrau.pe"
$FOLDER_NAME="Backup-eps/mesadepartes/"

$objects = aws s3api list-objects --bucket $BUCKET_NAME --prefix $FOLDER_NAME --query 'Contents[].{Key: Key}' --output text

$deepArchiveObjects = @()

foreach ($object in $objects)
{
    $storage_class = aws s3api head-object --bucket $BUCKET_NAME --key $object --query 'StorageClass' --output text
    if ($restore_status -eq "None" -and $storage_class -eq "DEEP_ARCHIVE")
    {
        $deepArchiveObjects += $object
    }
}

foreach ($object in $deepArchiveObjects)
{
    Write-Host "Restoring: $object"
    aws s3api restore-object --bucket $BUCKET_NAME --key $object --restore-request '{\"Days\": 1, \"GlacierJobParameters\": {\"Tier\": \"Standard\"}}'
}

Write-Host "Archivos en Glacier Deep Archive: $deepArchiveObjects"




$BUCKET_NAME="backups.epsgrau.pe"
$FOLDER_NAME="Backup-eps/mesadepartes/2023/"

$objects = aws s3api list-objects --bucket $BUCKET_NAME --prefix $FOLDER_NAME --query 'Contents[].{Key: Key}' --output text

foreach ($object in $objects)
{
    $restore_status = aws s3api head-object --bucket $BUCKET_NAME --key $object --query 'Restore' --output text
    $storage_class = aws s3api head-object --bucket $BUCKET_NAME --key $object --query 'StorageClass' --output text
    if ($restore_status -eq "None" -and $storage_class -eq "DEEP_ARCHIVE")
    {
        Write-Host "Restoring: $object"
        aws s3api restore-object --bucket $BUCKET_NAME --key $object --restore-request '{\"Days\": 1, \"GlacierJobParameters\": {\"Tier\": \"Standard\"}}'
    }
}
