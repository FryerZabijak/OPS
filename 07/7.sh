#!/bin/bash

echo "Skript vypíše loginy všech uživatelů, jejichž domovský adresář neexistuje"

z=$IFS
IFS=$'\n'

file_passwd=$(cat /etc/passwd)

for line in $file_passwd; do
    path=$(echo $line | cut -d":" -f6)
    if [ ! -d $path ]; then
        login=$(echo $line | cut -d":" -f1)
        echo $login
    fi
done

IFS=$z
