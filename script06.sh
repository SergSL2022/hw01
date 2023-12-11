#!/bin/bash

echo "Введіть, будь-ласка, речення:"
read -r sentence

reversed_sentence=$(echo "$sentence" | awk '{ for(i=NF;i>0;i--) printf("%s ",$i); }')

echo "Перевернуте речення: $reversed_sentence"
