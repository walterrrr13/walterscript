#!/bin/bash

# Mostramos las primeras diez líneas de /etc/passwd
echo "=== Primeras diez líneas ==="
head -n 10 /etc/passwd

# Mostramos un separador
echo "=== Final del fichero ==="

# Mostramos las últimas diez líneas
tail -n 10 /etc/passwd
