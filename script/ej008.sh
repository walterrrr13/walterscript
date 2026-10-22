#!/bin/bash

# Creamos notas.txt con la primera línea
echo "Primera nota: estudiar Bash" > notas.txt

# Añadimos la segunda y tercera línea
echo "Segunda nota: practicar comandos" >> notas.txt
echo "Tercera nota: completar los ejercicios" >> notas.txt

# Mostramos el contenido numerando las líneas
cat -n notas.txt
