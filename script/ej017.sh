#!/bin/bash

# Comprobamos que se reciben dos parámetros
if [ "$#" -eq 2 ]; then

    # Mostramos las palabras en orden inverso
    echo "$2 $1"

else
    # Informamos de cómo utilizar el script
    echo "Uso: ./ej017.sh palabra1 palabra2"
fi
