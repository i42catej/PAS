#!/bin/bash
#===================================================================================
#FILE: ejercicio2.sh
#
#DESCRIPTION: Acorta las lineas y las que tengan longuitud mayor de 50 sustituye lo siguiente por "...", Por otra parte elimina los () y [] #de la fecha y el pais
#
#AUTHOR: Juan Jesús Carmona Tejero i42catej
#===================================================================================


cat peliculas.txt | sed -r -e 's/\((.*)\)/\1,/' | sed -r -e 's/\[(.*)\]/\1/' | sed -r -e  's/(.{50,50}).*/\1.../'

# El ((.*)\) guarda solo lo que hay entre parentesis .* en el \1
# El [(.*)\] guarda solo lo que hay entre corchetes .* en el \1 

