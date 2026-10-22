#!/bin/bash

# Creamos el fichero original
touch original.txt

# Creamos un enlace simbólico
ln -s original.txt enlace_blando

# Creamos un enlace duro
ln original.txt enlace_duro

# Comparamos los archivos y sus números de inodo
ls -li original.txt enlace_blando enlace_duro
