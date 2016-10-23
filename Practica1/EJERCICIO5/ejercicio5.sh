#!/bin/bash
#===================================================================================
#FILE: ejercicio5.sh
#
#DESCRIPTION: Se mostraran los archivos junto con su ruta,tamaño... de una determinada
#	      carpeta que contenga o no dicho patron. Se mostraran en orden de menor a mayor      
#
#AUTHOR: Juan Jesús Carmona Tejero i42catej
#===================================================================================


if [ $# -ge 1 ] && [ -d $1 ]
then

	
	
	if [ $# -eq 2 ] #Si tiene carpeta y patron
	then
	   find "$1" -name "*$2*" -ls | sort -n -k 7 | awk -F ' ' '{print $11}' | while read f  #sort lo ordena por tamaño y awk -F te muestra solo la columna 11 que es la ruta para trabajar con ella				
		
		do
			if [ -f $f ]
			then
				var=0
				car=$(ls -l $f | cut -c 4) 
				
				if [ $car == "x" ]			
				then
					var=1
				fi
			
				  echo "$1;$(stat -c%s $f);$(ls -i $f | cut -d " " -f 1);$(ls -l $f | cut -d " " -f 1);$var"
			
			fi		
		done
		
	else  		
	   find $1 -ls | sort -n -k 7 | awk -F ' ' '{print $11}' | while read f
	   do
			if [ -f $f ]
			then
				var=0
				car=$(ls -l $f | cut -c 4) 
					if [ $car == "x" ]		
					then
						var=1
					fi
								
	      			  echo "$1;$(stat -c%s $f);$(ls -i $f | cut -d " " -f 1);$(ls -l $f | cut -d " " -f 1);$var"
				
			fi
		done
	fi

else
	echo "Error, ./a.out <directorio> <subcadena>"
fi
