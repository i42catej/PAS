#!/bin/bash
#===================================================================================
#FILE: ejercicio5.sh
#
#DESCRIPTION: Muestra el precio del gasoil o gasolina de forma ordenada junto con su ciudad,direccion...
#
#AUTHOR: Juan Jesús Carmona Tejero i42catej
#===================================================================================

	wget https://twitter.com/GeoPortalMityc 2> /dev/null #wget descarga el fichero html y lo cargamos en /dev/null para que no se muestre por terminal

	echo "Descargando la web https://twitter.com/GeoPortalMityc..."
	echo "Listado de precios de GeoPortalMityc ordenados por precio del Combustible:"

	cat GeoPortalMityc | grep -i -o 'EcoPrecio \([A-Z][a-z]*\) \([0-9]*[A-Z]*[a-z]*\) \(.*\) es \([0-9]\.[0-9]*\)€ en \(.*\)' | sed -n -e 's/EcoPrecio \([A-Z][a-z]*\) \([0-9]*[A-Z]*[a-z]*\) \([a-z]*[A-Z]*[0-9]*\) es \([0-9]\.[0-9]*\)€ en \(.*\)/ Precio: "\4" Ciudad: "\3" Combustible: "\1 \2" Dirección: "\5"/p' | sort -n -k 2 


	rm GeoPortalMityc
