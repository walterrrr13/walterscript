#!/bin/bash

# Creamos el fichero borrador.txt
touch borrador.txt

# Renombramos el fichero
mv borrador.txt definitivo.txt

# Creamos la carpeta de entrega
mkdir -p entregado

# Movemos el fichero a la carpeta entregado
mv definitivo.txt entregado/

# Mostramos el contenido de la carpeta
ls -l entregado
