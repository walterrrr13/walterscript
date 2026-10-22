#!/bin/bash

# Pide al usuario que introduzca su nombre y lo guarda en una variable
read -p "¿Introduce tu nombre:  " NOMBRE

# Muestra un saludo utilizando la variable NOMBRE
echo "Hola $NOMBRE."