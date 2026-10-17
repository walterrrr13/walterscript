#!/bin/bash

# ==============================================================================
# Script: walterlogs.sh
# Descripción: Cuenta y exporta logs del mes actual según el nivel de severidad.
# Niveles admitidos por journalctl: emerg, alert, crit, err, warning, notice, info, debug
# ==============================================================================

# Comprobar si se ha introducido exactamente un parámetro
if [ "$#" -ne 1 ]; then
    echo "Error: Debes introducir un nivel de severidad."
    echo "Uso: $0 [emerg|alert|crit|err|warning|notice|info|debug]"
    exit 1
fi

SEVERIDAD="$1"

# Validar que el parámetro sea uno de los niveles permitidos por journalctl
case "$SEVERIDAD" in
    emerg|alert|crit|err|warning|notice|info|debug)
        # Nivel válido, continuamos
        ;;
    *)
        echo "Error: Nivel de severidad '$SEVERIDAD' no válido."
        echo "Niveles permitidos: emerg, alert, crit, err, warning, notice, info, debug"
        exit 1
        ;;
esac

# Definir el archivo de salida en el directorio personal del usuario actual
ARCHIVO_SALIDA="$HOME/logs_${SEVERIDAD}_$(date +%Y%m).txt"

echo "Buscando registros del mes actual para el nivel: $SEVERIDAD..."

# Contar la cantidad de registros de este mes para esa severidad (desde el día 1 del mes actual)
CANTIDAD=$(journalctl --since "$(date +%Y-%m-01)" -p "$SEVERIDAD" --no-pager | wc -l)

echo "Cantidad de registros encontrados este mes: $CANTIDAD"

# Generar el archivo con el listado completo de dichos registros
journalctl --since "$(date +%Y-%m-01)" -p "$SEVERIDAD" --no-pager > "$ARCHIVO_SALIDA"

echo "Archivo generado con éxito en: $ARCHIVO_SALIDA"
