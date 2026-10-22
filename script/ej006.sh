#!/bin/bash

# Pedimos los dos números al usuario
read -p "Introduce el primer número: " NUM1
read -p "Introduce el segundo número: " NUM2

# Mostramos las operaciones aritméticas
echo "Suma: $((NUM1 + NUM2))"
echo "Resta: $((NUM1 - NUM2))"
echo "Multiplicación: $((NUM1 * NUM2))"

# Comprobamos que el divisor no sea cero
if [ "$NUM2" -ne 0 ]; then
    echo "División entera: $((NUM1 / NUM2))"
else
    echo "No se puede dividir entre cero"
fi
