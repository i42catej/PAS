#!/bin/bash
#===================================================================================
#FILE: ejercicio4.sh
#
#DESCRIPTION: Muestra el tiempo que tarda en responder cada IP
#
#AUTHOR: Juan Jesús Carmona Tejero i42catej
#===================================================================================

if [ $# -eq 2 ] && [ -e $1 ] #Se comprueba si se pasan 2 argumentos y el argumento 1 es un fichero
then

	for x in $(cat $1) #Se recorre el fichero 
	do	
		
		ping -c 1 $x >> /dev/null #Se pone >> /dev/null para que no muestre las caracterisiticas de cada IP
		

			if [ $? -ne 0 ]
			then
				echo "La IP $x no respondió tras $2 segundos" 
			else
				echo $(ping -c 1 $x| sed -n 's/64 bytes from \([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\): icmp_seq=[0-9] ttl=[0-9]* time=\(.*\) ms/La IP \1 respondió en \2 segundos/p')	 
			fi

	done | sort -n -k 6 #Una vez tiene todas las IP las saca ordenadas por la columna 6 (tiempo)
	
else
	echo "Error, formato: ./a.out <fichero_texto> <segundos>"
fi
