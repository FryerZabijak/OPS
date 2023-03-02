#!/bin/bash
z=$IFS
IFS=$'\n'

soubory=0
adresare=0

for file in $(find $HOME/Plocha); do

    if [ -d $file ]; then
        adresare=$(($adresare + 1))
    else
        soubory=$(($soubory + 1))
    fi

done
IFS=$z

echo "$adresare Adresářů"
echo "$soubory Souborů"