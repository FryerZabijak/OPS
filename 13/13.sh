#!/bin/bash
z=$IFS
IFS=$'\n'

echo "Program ze zadaného adresáře smaže prázdné adresáře"
read -r -p "Zadej adresář: " adresar

if [ ! -d $adresar ]; then
    echo "Adresář neexistuje"
    exit 1
fi

for file in $(find $adresar); do
    if [ -d $file ] && [ -z "$(ls -A $file)" ]; then
        rm -d $file
    fi
done

IFS=$z
