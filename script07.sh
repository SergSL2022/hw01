#!/bin/bash

if [ "$#" != 1 ]; then
	echo "ERROR! Веедена неправильна кількість аргументів."
	echo "Введіть: ./script07.sh шлях_до_файлу"
	exit 1
fi

file=$1

if [ ! -e "$file" ]; then
	echo "ERROR! Файл '$file' не знайдено"
	exit 1
fi

awk 'END { print "Кількість рядків у файлі '$file': " NR }' $file

exit 1
