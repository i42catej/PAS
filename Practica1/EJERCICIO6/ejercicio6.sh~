#!/bin/bash
#===================================================================================
#FILE: ejercicio6.sh
#
#DESCRIPTION: Copia los ficheros ejecutables, librerias, codigo y cabecera de una determinada carpeta
#	      a directorios por defecto o introducidos por teclado y crea un .log donde se guardan todas las copias,
#	      modificaciones...
#
#AUTHOR: Juan Jesús Carmona Tejero i42catej
#===================================================================================

#-------------------------------------------------------------------
#Funcion que devuelve la extencion del fichero para luego utilizarlo en copia()
#-------------------------------------------------------------------
extension(){ 
	
	var=$1 
	
	if [ ${var##*.} = "exe" ] || [ ${var##*.} = "out" ] || [ ${var##*.} = "sh" ] #Ejecutable
	then
		echo exe
	fi

	if [[ $(basename $var) = lib* ]]; #Libreria
	then
		echo lib
	fi

	if [ ${var##*.} = "c" ] || [ ${var##*.} = "cpp" ] #Codigo
	then
		echo codigo
	fi
	
	if [[ ${var##*.} = "h" ]]; #Cabecera
	then
		echo cabecera
	fi	
}



#----------------------------------
#Funcion que comprueba si el directorio existe
#----------------------------------
existe(){ 

archivo_log="ejercicio6.log"

if [ -e $1 ]
then
	echo "El directorio $1 existe"
else
	mkdir  $1
	echo -e "$(date +"%d/%m/%y %H:%M:%S")\tDirectorio $1 creado correctamente" >> $archivo_log #Se mete en archivo_log la fecha de creacion
fi
}



#-----------------------------------
#Funcion que copia origen en destino
#-----------------------------------
copia(){ 

	origen=$1
	destino=$2
	
	cp -i $origen $destino
	echo -e "$(date +"%d/%m/%y %H:%M:%S")\tFichero $origen se ha copiado a $destino" >> $archivo_log #Mete en archivo la fecha y fichero copiado
}



#-------------------------------------------------------------
#Funcion que copia los ficheros en /bin, /src, /lib o /include
#-------------------------------------------------------------
copiafichero(){ 
echo -e "$(date +"%d/%m/%y %H:%M:%S")\tIniciando script..." >> $archivo_log



cont_eje=0 #Contador ejecutables
cont_codigo=0 #Contador codigo
cont_cabecera=0 #Contador cabeceras
cont_libreria=0 #Contador librerias



tiempo_inicio=$(date +%s) 

for recorrido_ficheros in $(find $* -depth -type d) #ciclo que itera por los argumentos de la linea de ordenes en caso de que se le pase algo.
do
	
	
	for f in $(find $recorrido_ficheros -maxdepth 1 -type f) #Encuentra solo directorios con profundidad 1
	do
	
		
	
		if [[ $(extension $f) == "exe" ]];
		then
			copia $f $carpeta_eje
			cont_eje=$((cont_eje+1))
		
		elif [[ $(extension $f) == "lib" ]];
		then
			copia $f $carpeta_librerias
			cont_libreria=$((cont_libreria+1))

		elif [[ $(extension $f) == "codigo" ]];
		then
			copia $f $carpeta_codigo
			cont_codigo=$((cont_codigo+1))
		
		elif [[ $(extension $f) == "cabecera" ]];
		then
			copia $f $carpeta_cabecera
			cont_cabecera=$((cont_cabecera+1))
		
		
		fi
	done
done
	

echo "Total de directorios procesados: $(find $* -type d | wc -l)"
echo "Total de ejecutables: $cont_eje"
echo "Total de codigos: $cont_codigo"
echo "Total de cabeceras: $cont_cabecera"
echo "Total de librerías: $cont_libreria"	
echo "Tiempo necesitado: $(($(date +%s) - tiempo_inicio)) segundos"
}






if [ $# -eq 0 ] #si el argumento de la linea de ordenes es 0
then
	echo "Introduzca el directorio donde copiar los ejecutables: "
	read -t 5 carpeta_eje
		if [ -z $carpeta_eje ]
		then
			carpeta_eje="$HOME/bin"
		fi


	echo "Introduzca el directorio donde copiar las librerias: " 
	read -t 5 carpeta_librerias
		if [ -z $carpeta_librerias ]
		then	
			carpeta_librerias="$HOME/lib"
		fi

	echo "Introduzca el directorio donde copiar los codigos: "
	read -t 5 carpeta_codigo
		if [ -z $carpeta_codigo ]
		then
			carpeta_codigo="$HOME/src"
		fi

	echo "Introduzca el directorio donde copiar los cabeceras: "
	read -t 5 carpeta_cabecera
		if [ -z $carpeta_cabecera ]
		then
			carpeta_cabecera="$HOME/include"
		fi
	
	echo "Utilizando los ficheros: "
	echo " $carpeta_eje para almacenar los ficheros ejecutables"
	echo " $carpeta_librerias para almacenar las librerias"
	echo " $carpeta_codigo para almacenar los codigos"
	echo " $carpeta_cabecera para almacenar los ficheros cabecera "
	

	for d in $carpeta_eje $carpeta_librerias $carpeta_codigo $carpeta_cabecera
	do
		existe $d
	done

	copiafichero $(pwd) 


else #si el numero de argumentos es distinto de 0
	for dir in $*
	do
		if [ -d $dir ]
		then
			echo "Introduzca el directorio donde copiar los ejecutables: "
			read -t 5 carpeta_eje
				if [ -z $carpeta_eje ]
				then
					carpeta_eje="$HOME/bin"
				fi


			echo "Introduzca el directorio donde copiar las librerias: " 
			read -t 5 carpeta_librerias
				if [ -z $carpeta_librerias ]
				then
					carpeta_librerias="$HOME/lib"
				fi

			echo "Introduzca el directorio donde copiar los codigos: "
			read -t 5 carpeta_codigo
				if [ -z $carpeta_codigo ]
				then
					carpeta_codigo="$HOME/src"
				fi

			echo "Introduzca el directorio donde copiar los cabeceras: "
			read -t 5 carpeta_cabecera
				if [ -z $carpeta_cabecera ]
				then
					carpeta_cabecera="$HOME/include"
				fi
			

			echo "Utilizando los ficheros: "
			echo " $carpeta_eje para almacenar los ficheros ejecutables"
			echo " $carpeta_librerias para almacenar las librerias"
			echo " $carpeta_codigo para almacenar los codigos"
			echo " $carpeta_cabecera para almacenar los ficheros cabecera "
			

			for d in $carpeta_eje $carpeta_librerias $carpeta_codigo $carpeta_cabecera
			do
				existe $d
			done
		

		        copiafichero $dir
		else
			echo "El directorio $dir no existe"
		fi
	done	
fi


	
	
