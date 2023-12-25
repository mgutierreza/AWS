#!/bin/bash

# Detén el script si ocurre un error
set -e

# Detén el script si un comando en una tubería falla
set -o pipefail

# Función para manejar errores
manejar_error() {
    echo "Ha ocurrido un error en la línea $1"
    exit 1
}

# Llama a la función manejar_error si ocurre un error
trap 'manejar_error $LINENO' ERR

# Ruta al archivo de log
archivo_log="/home/log_EC2_to_S3.txt"

# Obtener la lista de archivos
archivos=$(find /install/PPR/Reportes/Poblacion_General/ -mtime -1 -type f)

# Listar los archivos
for archivo in $archivos; do
  #datos generales
  fecha_actual=$(date '+%Y-%m-%d %H:%M:%S')
  fecha_modificacion=$(stat -c %y "$archivo")
  tamanho=$(du -sm "$archivo" | cut -f1)

  echo "Iniciando copia $archivo" >> $archivo_log
  echo "Fecha actual: $fecha_actual" >> $archivo_log 2>&1
  echo "Fecha de modificación: $fecha_modificacion" >> $archivo_log 2>&1
  echo "Tamaño: $tamanho MB" >> $archivo_log 2>&1
  echo $archivo
  fecha_actual=$(date '+%Y-%m-%d %H:%M:%S')
  echo "Fecha actual: $fecha_actual" >> $archivo_log 2>&1
  echo "Finalizando copia" >> $archivo_log
done