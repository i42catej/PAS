#!/bin/bash
#===================================================================================
#FILE: ejercicio3.sh
#
#DESCRIPTION: Muestra el tiempo que llevan logeados los usuarios
#
#AUTHOR: Juan Jesús Carmona Tejero i42catej
#===================================================================================

#----------------------
#Creacion de ficheros
#----------------------
> fichero1.txt 
> fichero2.txt
> fichero3.txt


who | sed -r 's/([^.]) .*/\1/' >> fichero2.txt #Metemos en el fichero2.txt el nombre de los usuarios 

who | tr -s ' ' ' ' | cut -d ' ' -f 3-4 >> fichero3.txt #tr -s ' ' ' ' elimina los espacios y cut -d ' ' -f 3-4 coje la 3 y 4 columna(fecha y hora) y lo metemos en el fichero3.txt

while read x
do
	tiempo=$(($(date +%s)-$(date -d "$x" +%s))) #Calculamos el tiempo de cada usuario 

	echo $tiempo | awk '{printf "El usuario ename lleva %d horas, %d minutos y %d segundos conectado\n",$tiempo/3600,$tiempo%3600/60,$tiempo%60}' >> fichero1.txt

done < fichero3.txt 

numero=1



for x in $(cat fichero2.txt)
do
	sed -n "$numero"s/ename/$x/p fichero1.txt
	
numero=$(($numero+1))
done


#-----------------------
#Eliminacion de ficheros
#-----------------------
rm fichero1.txt
rm fichero2.txt
rm fichero3.txt
