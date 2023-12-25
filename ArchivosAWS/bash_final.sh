#!/bin/bash
export LANG=C.UTF-8

# Detén el script si ocurre un error
set -e

# Detén el script si un comando en una tubería falla
set -o pipefail

# Función para manejar errores
manejar_error() {
    lineaerror="Ha ocurrido un error en la linea $1"
    # Registrar evento ERROR en CloudWatch
    timestamp=$(date +%s%3N)
    # Crear un mensaje JSON
    mensaje="nivel: ERROR, mensaje: $lineaerror"
    sudo aws logs put-log-events --region us-east-1 --log-group-name /ec2/bash --log-stream-name i-09d428e7805f93f2a --log-events timestamp=$timestamp,message="$mensaje"
    exit 1
}

# Llama a la función manejar_error si ocurre un error
trap 'manejar_error $LINENO' ERR

#datos generales
nivel="INFO"
usuario="root"
timestamp=$(date +%s%3N)

cuerpo_mensaje="Inicio de Ejecucion BASH"
mensaje="nivel: $nivel, mensaje: $cuerpo_mensaje, usuario: $usuario"

sudo aws logs put-log-events --region us-east-1 --log-group-name /ec2/bash --log-stream-name i-09d428e7805f93f2a --log-events timestamp=$timestamp,message="\"$mensaje\""

# Obtener la lista de archivos de carpeta que se han modificado hace 1 día atras (24 horas)
#archivos=$(find /install/PPR/Reportes/Poblacion_General -type f -newermt "$(date -d '7 hours ago' '+%Y-%m-%d %H:00:00')" ! -newermt "$(date -d '1 hour ago' '+%Y-%m-%d %H:59:59')")
archivos=$(find /install/PPR/Reportes/Poblacion_General -type f -newermt "$(date -d '5 hours ago' '+%Y-%m-%d %H:00:00')" ! -newermt "$(date -d '15 minutes ago' '+%Y-%m-%d %H:%M:%S')")

if [[ ! -z $archivos ]]; then

  timestamp=$(date +%s%3N)

  cuerpo_mensaje="Inicio de copia de archivo: $archivos"
  mensaje="nivel: $nivel, mensaje: $cuerpo_mensaje, usuario: $usuario"

  sudo aws logs put-log-events --region us-east-1 --log-group-name /ec2/bash --log-stream-name i-09d428e7805f93f2a --log-events timestamp=$timestamp,message="\"$mensaje\""

  fecha_inicio=$(date '+%Y-%m-%d %H:%M:%S')
  fecha_modificacion=$(stat -c %y "$archivos")
  tamanho=$(du -sm "$archivo" | cut -f1)

  #comando de copia con SYNC
  #sudo aws s3 sync /install/PPR/Reportes/Poblacion_General/ s3://auna-prd-integracion-s3/sap-insurance/Reportes/Poblacion_General/ --acl public-read --include "$archivo"
  #sudo aws s3 cp "$archivo" s3://auna-prd-integracion-s3/sap-insurance/Reportes/Poblacion_General/ --acl public-read

  fecha_fin=$(date '+%Y-%m-%d %H:%M:%S')

  #generando variables para mensaje
  inicio="Fin de copia de archivo: $archivos - $fecha_inicio - "
  fechamodiarchivo="Fecha de modificacion archivo: $fecha_modificacion - "
  tamanhoarchivo="Tamanho: $tamanho MB - "
  fin="Finalizó copia - $fecha_fin"

  # Variables para registro de evento
  cuerpo_mensaje="$inicio $fechamodiarchivo $tamanhoarchivo $fin"
  cuerpo_mensaje="$inicio $tamanhoarchivo $fin"
  mensaje="nivel: $nivel, mensaje: $cuerpo_mensaje, usuario: $usuario"

  # Registrar evento OK en CloudWatch
  sudo aws logs put-log-events --region us-east-1 --log-group-name /ec2/bash --log-stream-name i-09d428e7805f93f2a --log-events timestamp=$timestamp,message="\"$mensaje\""
else
  # Registrar evento en CloudWatch - busqueda sin archivos
  timestamp=$(date +%s%3N)

  cuerpo_mensaje="Sin copia de archivos debido a que ya estan sincronizados"
  mensaje="nivel: $nivel, mensaje: $cuerpo_mensaje, usuario: $usuario"

  sudo aws logs put-log-events --region us-east-1 --log-group-name /ec2/bash --log-stream-name i-09d428e7805f93f2a --log-events timestamp=$timestamp,message="\"$mensaje\""

fi

timestamp=$(date +%s%3N)

cuerpo_mensaje="Fin de Ejecucion BASH"
mensaje="nivel: $nivel, mensaje: $cuerpo_mensaje, usuario: $usuario"

sudo aws logs put-log-events --region us-east-1 --log-group-name /ec2/bash --log-stream-name i-09d428e7805f93f2a --log-events timestamp=$timestamp,message="\"$mensaje\""