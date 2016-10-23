#!/bin/bash
#===================================================================================
#FILE: ejercicio1.sh
#
#DESCRIPTION: Ejecuta comandos grep con diferentes salidas
#
#AUTHOR: Juan Jesús Carmona Tejero i42catej
#===================================================================================

echo "*******"
echo "1) Lineas con la duracion de las peliculas: "
cat peliculas.txt | grep min.$ #Mostramos las lineas que acaban en "min."

echo "*******"
echo "2) Lineas con el pais de las peliculas: "
cat peliculas.txt | grep ]$ #Mostramos las lineas que acaban en "]"

echo "*******"
echo "3) Solo el pais de las peliculas: "
cat peliculas.txt | grep  "\[.*\]" -o #Mostramos solo lo encontrado entre "[" y "]"

echo "*******"
contador1=$(cat peliculas.txt | grep "\(2014\)" -o | wc -l) #Contamos las peliculas cuya fecha es 2014
contador2=$(cat peliculas.txt | grep "\(2015\)" -o | wc -l) #Contamos las peliculas cuya fecha es 2015
echo "4) Hay $contador1 peliculas del 2014 y $contador2 peliculas del 2015"

echo "*******"
echo "5) Eliminar lineas vacias: "
cat peliculas.txt | grep "." #Mostramos las lineas donde hay cualquier caracter

echo "*******"
echo "6) Lineas que empiezan la letra C (con o sin espacios antes): "
cat peliculas.txt | grep -E '^(C| )' #Mostramos las lineas que comienzan por C o por " "

echo "*******"
echo "7) Lineas que contienen d, l o t, una vocal y la misma letra: "
cat peliculas.txt | grep "d[aeiou]d" #Se muestran las lineas que contienen "d" y cualquiera de las vocales y "d"
cat peliculas.txt | grep "l[aeiou]l" #Se muestran las lineas que contienen "l" y cualquiera de las vocales y "l"
cat peliculas.txt | grep "t[aeiou]t" #Se muestran las lineas que contienen "t" y cualquiera de las vocales y "t"
echo "*******"
echo "8) Lineas que contienen ocho aes o mas: "
cat peliculas.txt | grep '\(a.*\)\{8,\}' #Se busca que el caracter "a" se repita 8 o mas veces

echo "*******"
echo "9) Lineas que terminan con tres puntos y no empiezan por espacio: "
cat peliculas.txt | grep  '\(\...$\)' | grep -v '^ ' #Se muestran aquellas lineas que cumplen las dos condiciones, acabar en ... y no empiezan por " "

echo "*******"
echo "10) Mostrar entre comillas las vocales con tilde: "
cat peliculas.txt | sed -r  -e 's/([áéíóúÁÉÍÓÚ])/"\1"/' #Mediante "\1" se muestra la vocal con tilde

