#!/bin/bash
echo -n "numero 1: "; read num1
echo -n "numero 2: "; read num2

let "suma=$num1+$num2"
let "resta=$num1-$num2"
let "multiplicacion=$num1*$num2"
let "division=$num1/$num2"
let "modulo=$num1%$num2"

echo "Suma: $suma"
echo "Resta: $resta"
echo "Multiplicacion: $multiplicacion"
echo "Division: $division"
echo "Modulo: $modulo"

