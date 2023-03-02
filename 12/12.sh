#!/bin/bash

z=$IFS
IFS=$'\n'

folder_to_delete="$HOME/Plocha/temporary02"
deleted_files=0
echo "Tento program smaže prázdné soubory ve složce $folder_to_delete."
read -r -p "Přejete si pokračovat [a/n]: " odpoved

if [ $odpoved == "a" ]
then
files=$(find $folder_to_delete)
for file in $files
do

size=$(stat --format=%s $file)
if [ $size -lt 1 ] && [ -f $file ]
then
    deleted_files=$(($deleted_files+1))
    rm $file
fi

done

fi

IFS=$z

echo "Počet smazaných prázdných souborů: $deleted_files"