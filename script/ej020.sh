#!/bin/bash

# Pedimos el año de nacimiento
read -p "Introduce tu año de nacimiento: " NACIMIENTO

# Obtenemos el año actual
ACTUAL=$(date +%Y)

# Calculamos la edad aproximada
EDAD=$((ACTUAL - NACIMIENTO))

# Mostramos el resultado
echo "Tu edad aproximada es $EDAD años."
