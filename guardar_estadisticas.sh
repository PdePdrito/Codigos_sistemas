#!/bin/bash

# Intervalo en segundos
intervalo=5
# Nombre del archivo CSV donde se guardarán las estadísticas
archivo="estadisticas.csv"

# Escribe la cabecera del archivo CSV
echo "Fecha,Hora,CPU_uso(%),Memoria_usada(%),Memoria_libre(%)" > $archivo

# Bucle infinito
while true; do
    # Obtén la fecha y hora actual
    fecha=$(date '+%Y-%m-%d')
    hora=$(date '+%H:%M:%S')

    # Obtén las estadísticas de CPU y memoria usando `top`
    top -b -n1 | awk -v fecha="$fecha" -v hora="$hora" '
    /%Cpu/ {cpu=$2}
    /KiB Mem/ {mem_usada=$6; mem_libre=$8; total=$4+mem_usada+mem_libre; mem_usada_pct=(mem_usada/total)*100; mem_libre_pct=(mem_libre/total)*100}
    END {print fecha","hora","cpu","mem_usada_pct","mem_libre_pct}
    ' >> $archivo

    # Espera el intervalo especificado antes de repetir
    sleep $intervalo
done
