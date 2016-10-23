#!/bin/bash
#===================================================================================
#FILE: ejercicio4.sh
#
#DESCRIPTION: Busca en un fichero el patron introducido y muestra la linea anterior a la ocurrencia,
#	      la linea del patron y la linea posterior.             
#
#AUTHOR: Juan Jesús Carmona Tejero i42catej
#===================================================================================

#---------------------------------------------------------------------------------------------
#Comprobamos si el numero de argumentos pasados es igual a 2 y si el argumento 1 es un fichero
#---------------------------------------------------------------------------------------------
if [ $# -eq 2 ] && [ -e $1 ] 
then	

cont=1; #Inicializacion de la variable contador


 #------------------------------------------------------------------------------------------------------------------------------
 #Nos muestra las lineas del fichero que contiene el patron y cut corta cuando ve un : para que solo devuelva el numero de linea
 #------------------------------------------------------------------------------------------------------------------------------
 for x in $(grep -n $2 < $1 | cut -d ':' -f1) 
 do
	num=0;
	echo " "
	echo "-------------------------------"
	echo "Emparejamiento número:$cont"
	cont=$((cont+1)) #Aumentamos el contador para el proximo emparejamiento

	while read linea 
	do
		num=$((num+1))
		if [ $x -eq $num ] || [ $x -eq $((num-1)) ] || [ $x -eq $((num+1)) ] #Si x es igual a la linea o a la linea anterior o posterior la imprime
		then
			echo "$linea"
		fi

	done < $1

 done

else
	echo "Error. Formato: ./a.out <fichero> <patron>"
fi
