#!/bin/bash

# Guardamos el listado detallado de /etc en listado.txt
ls -l /etc > listado.txt

# Guardamos los errores al intentar listar /root
ls -l /root 2> errores.txt

# Mostramos el número de líneas de cada fichero
echo "Líneas de listado.txt:"
wc -l listado.txt

echo "Líneas de errores.txt:"
wc -l errores.txt
