#!/bin/bash 
#===================================================================================
#FILE: ejercicio3.sh
#
#DESCRIPTION: Muestra el total de ficheros en el directorio actual, muestra la lista de usuarios
#             conectados y muestra las veces que aparece el carácter introducido.
#
#AUTHOR: Juan Jesús Carmona Tejero i42catej
#===================================================================================

#----------
#Apartado 1
#----------

contador=$(ls *.* | wc -l)
echo " "
echo "El total de ficheros es $contador"
echo " " 

#----------
#Apartado 2
#----------

listado=$(who -u | cut -d " " -f1)
echo "Lista de usuarios conectados"
echo "$listado"

#----------
#Apartado 3
#----------

echo -n "¿Qué  carácter quieres contar?"; read -t5 car
	if [ -z $car ]
	then
		car='a';
	fi

#---------------------------------------------------------------------------------------------
#grep -o $car lista en filas todas las veces que aparece el caracter y wc -l cuenta las lineas 
#---------------------------------------------------------------------------------------------
cont=$((find . -name "*$car*") | grep -o $car | wc -l) 
echo "El caracter $car aparece $cont veces en nombres de ficheros o carpetas contenidos en la carpeta actual"
