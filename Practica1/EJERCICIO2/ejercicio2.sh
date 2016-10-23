#!/bin/bash
#===================================================================================
#FILE: ejercicio2.sh
#
#DESCRIPTION: Guarda en un archivo .html la ruta de las carpetas, subcarpertas, ficheros...
#
#AUTHOR: Juan Jesús Carmona Tejero i42catej
#===================================================================================



#-----------------------------------------------------------
#Funcion que recorre un directorio para mostrar sus ficheros
#-----------------------------------------------------------
recorrer(){

	cd ./$1
	
	for var in *
	do
		if [ -d "$var" ]
		then
			echo "Entrando en el directorio..."
			echo "<ul><li><strong>./carpetaprueba/$var</strong></li>" >>~/Escritorio/fichero.html
			recorrer $var
			cd .. 
		else
			echo "Volcando fichero..."
			echo "<li>$var</li>">>~/Escritorio/fichero.html

		fi
	
	done
   echo "</ul>">>~/Escritorio/fichero.html
}





if [ $# -eq 0 ]
then
	echo "Error. Formato del tipo <ejecutable> <directorio>\n"
	exit -1
else 

        touch ~/Escritorio/fichero.html #Creamos el fichero en el Escritorio
  
        echo "<html> <head> <title>Listado del directorio ./$1/ </title> </head>" >> ~/Escritorio/fichero.html
	
	echo "<body>">> ~/Escritorio/fichero.html
 	echo "<style type=\"text/css\">">> ~/Escritorio/fichero.html
    	echo "body { font-family: sans-serif;}">> ~/Escritorio/fichero.html
 	echo "</style>">> ~/Escritorio/fichero.html

        echo "<h1>Listado del directorio ./$1/</h1>" >> ~/Escritorio/fichero.html
        recorrer $1
	
fi
	echo "</html>">>~/Escritorio/fichero.html

