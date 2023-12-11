#!/bin/bash

fruits=("Яблуко" "Груша" "Вишня" "Слива" "Банан" "Манго" "Ківі" "Мандарин" "Апельсин" "Лимон")

echo "Список фруктів"

for fruit in  "${fruits[@]}"; do
	echo "$fruit"
	sleep 1
done
