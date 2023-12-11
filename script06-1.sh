#!/bin/bash

echo "Введіть, будь-ласка, речення:"
read -r sentence

words=($sentence)

arrLength="${#words[@]}"


echo "Перевернуте речення:"

for (( i = arrLength - 1; i >= 0; i-- )); do
    echo -n "${words[i]} "
done
echo


