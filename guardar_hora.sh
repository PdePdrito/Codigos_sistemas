#!/bin/bash

# Nombre del archivo donde se guardará la hora
archivo="tiempo.txt"

# Bucle infinito
while true; do
    # Obtén la hora actual y guárdala en el archivo
    echo $(date '+%Y-%m-%d %H:%M:%S') >> $archivo
    # Espera 5 segundos antes de repetir
    sleep 5
done
