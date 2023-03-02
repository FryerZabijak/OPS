#!/bin/bash
z=$IFS
IFS=$'\n'

nejvetsi_cas=0
nazev_souboru=""

for file in $(ls -1 ~/Plocha)
    do

    cas=$(stat --format=%Z ~/Plocha/$file)
    if [ $cas -gt $nejvetsi_cas ]
        then
        nejvetsi_cas=$cas
        nazev_souboru=$file
        fi

    done

echo "Naposledy upravený soubor/složka na Ploše je: "
echo "$nazev_souboru"

IFS=$z