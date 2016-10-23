#!/bin/bash
echo -n "Introduzca el nombre de usuario: "; read usu

if [ "$usu" == "$USER" ]
then
	echo "Bienvenido $usu"
else
	echo "No es ese el usuario"
fi
