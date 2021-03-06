#!/bin/bash
#===================================================================================
#FILE: ejercicio1.sh
#
#DESCRIPTION: Comprime los archivos de la carpeta que cumpla la condicion de antigüedad mayor a 20 segundos
#
#AUTHOR: Juan Jesús Carmona Tejero i42catej
#===================================================================================


if [ $# -eq 0 ] #Comprobamos si el numero de argumentos es igual a 0
then 
	echo "Error. El numero de argumentos debe ser 1 ó 2"
else
	if [ $# -eq 2 ]
	then
		 echo "Comprimiendo la carpeta $1..."
		 sleep 2
		 #-------------------------------------------------------
		 #Buscamos en la carpeta y devuelve los ficheros que tienen mas de 20 segundos que se pasa al tar por la tuberia. el %p\0    			  es para que se pase la ruta correctamente.
		 #-------------------------------------------------------
		 find $1 -not -newermt '-20 seconds' -type f -printf '%p\0' | tar --null -uf $2.tar.gz -T - 
		 echo "$2.tar.gz creado con exito"
	else
		 echo "Comprimiendo la carpeta $1..."
		 sleep 2
		 #-------------------------------------------------------
		 #El -uf sirve para que no muestre por pantalla el archivo comprimido
		 #-------------------------------------------------------
		 find $1 -not -newermt '-20 seconds' -type f -printf '%p\0' | tar --null -uf dir.tar.gz -T - 
		 echo "dir.tar.gz creado con exito"
	fi
fi

