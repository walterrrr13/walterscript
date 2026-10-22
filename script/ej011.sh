#!/bin/bash

# Pedimos el nombre del fichero
read -p "Introduce el nombre del fichero: " FICHERO

# Mostramos su tamaño en formato legible
ls -lh "$FICHERO"

# Mostramos el tipo de contenido
file "$FICHERO"
