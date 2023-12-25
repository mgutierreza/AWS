#!/bin/bash
export LANG=C.UTF-8

# Obtener la lista de archivos de carpeta que se han modificado hace 1 día atras (24 horas)
archivos=$(find /install/PPR/Reportes/Poblacion_General/ -mmin -6000 -type f)

# Comprobamos si la variable está vacía
if [[ ! -z $archivos ]]; then
  # La variable tiene un valor, por lo que ejecutamos el comando
  echo "La variable tiene datos $archivos"
fi