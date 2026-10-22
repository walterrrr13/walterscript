#!/bin/bash

# Mostramos el nombre de la máquina
echo "Nombre de la máquina:"
hostname

# Mostramos el número de usuarios conectados
echo "Número de usuarios conectados:"
who | wc -l

# Mostramos la versión del kernel
echo "Versión del kernel:"
uname -r
