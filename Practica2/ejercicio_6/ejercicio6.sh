#!/bin/bash
#===================================================================================
#FILE: ejercicio6.sh
#
#DESCRIPTION: Muestra contenido de /etc/passwd por apartados: logname,UID,GID,gecos... Mostrando solo los usuarios que tengan como shell la 
#cadena introducida
#
#AUTHOR: Juan Jesús Carmona Tejero i42catej
#===================================================================================

if [ $# != 1 ] #Comprobamos que se haya introducido alguna cadena
then
	echo "Error, Formato: <ejecutable> <cadena>"
else 
	if [ -n $1 ] #Comprobamos la longitud de la cadena sea mayor de 0
	then
		cat /etc/passwd | while read x #Recorremos los usuarios y de cada usuario sacamos su informacion
		do
			 Shell=$(echo "$x" | sed -n  's/\(.*\):\(.*\):\(.*\):\(.*\):\(.*\):\(.*\):\(.*\)/\7/p')
			
			
			if [ $Shell == $1 ] #Si la cadena introducida esta en la shell mostramos el usuario.
			then
					echo "$x" | sed -n  's/\(.*\):\(.*\):\(.*\):\(.*\):\(.*\):\(.*\):\(.*\)/=========================\n Logname: \1\n ->UID: \3\n ->Grupo: \1\n ->GID: \4\n ->gecos: \5\n ->Home: \6\n->Shell por defecto: \7\n ->Logeado: 1/p'
				 
			fi
		   	
		done
	else 
		echo "La longitud de la cadena no es mayor de 0"
	fi
fi
