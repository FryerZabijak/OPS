#!/bin/bash
z=$IFS
IFS=$'\n'

echo "Uživatelé a jejich naposledy změněné hesla"

file_passwd=$(cat /etc/passwd)
for line in $file_passwd
    do
    id=$(echo $line | cut -d":" -f3)
    
    if [ $id -gt 999 ] && [ $id -lt 65000 ]
    then

    name=$(echo $line | cut -d":" -f1)
    echo $name $(sudo chage -l $name | head -n1 | cut -d":" -f2)

    fi
    done

IFS=$z