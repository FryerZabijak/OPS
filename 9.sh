#!/bin/bash
z=$IFS
IFS=$'\n'

soubor="9-users.txt"
obsah_souboru=$(cat $soubor)
for line in $obsah_souboru
do

login=$(echo "$line" | cut -d";" -f1)
jmeno=$(echo "$line" | cut -d";" -f2 | cut -d" " -f2)
heslo=$(echo "$line" | cut -d";" -f3 | cut -d" " -f2)

sudo useradd -m -c "$jmeno" -s /bin/bash "$login"
echo "$login:$heslo" | sudo chpasswd

done

echo "Uživatelé ze souboru '$soubor' byli vytvořeni"

IFS=$z