#!/bin/bash
z=$IFS
IFS=$'\n'

nejdelsi_uzivatel=""
nejdelsi_uzivatel_length=0

file_passwd=$(cat /etc/passwd)
for line in $file_passwd
    do
    id=$(echo $line | cut -d":" -f3)
    
    if [ $id -gt 999 ] && [ $id -lt 65000 ]
    then

    jmeno_length=$(echo $line | cut -d":" -f1 | wc -c)
    if [ $jmeno_length -gt $nejdelsi_uzivatel_length ];
        then
        nejdelsi_uzivatel=$(echo $line | cut -d":" -f1)
        fi
    fi

    done

echo "Uživatel s nejdelším jménem:"
echo $nejdelsi_uzivatel

IFS=$z