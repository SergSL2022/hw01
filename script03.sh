#!/bin/bash

echo "Веедіть ім'я файлу, включаючи його розширення (наприклад file123.txt)"
read fileName

if [ -e "$PWD/$fileName" ]; then
	echo "Файл з таким ім'ям присутній у поточному каталозі"
else
	echo "Нажаль файлу з таким ім'ям не знайдено в поточному каталозі"
fi
