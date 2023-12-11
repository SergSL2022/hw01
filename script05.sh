#!/bin/bash

if [ "$#" != 2 ]; then
	echo "ERROR! Веедена неправильна кількість аргументів."
	echo "Введіть: ./script05.sh шлях1 шлях2"
	exit 1
fi

pathFrom="$1"
pathTo="$2"

if [ ! -e "$pathFrom" ]; then
	echo "ERROR! Файл '$pathFrom' не знайдено"
	exit 1
fi


if  [ ! -d "$pathTo" ]; then
	mkdir -p "$pathTo"
fi

if [ ! -d "$pathTo" ]; then
    echo "Помилка: '$pathTo' не є каталогом."
    exit 1
fi

cp "$pathFrom" "$pathTo"

if [ "$?" == 0 ]; then
	echo "SUCCESS. Файл '$pathFrom' успішно скопійовано в '$pathTo'"
else
	echo "ERROR. Не вдалося скопіювати файл '$pathFrom' в '$pathTo'"
fi
