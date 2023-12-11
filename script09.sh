#!/bin/bash

if [ "$#" != 1 ]; then
	echo "ERROR! Веедена неправильна кількість аргументів."
	echo "Введіть: ./script05.sh шлях_до_файлу"
	exit 1
fi

filePath="$1"

if [ -e "$filePath" ]; then
	echo "=========================================== BEGIN ==========================="
	cat $filePath
	echo "=========================================== END ============================="
else
	echo "ERROR! Файл '$filePath' не знайдено"
	exit 1
fi
