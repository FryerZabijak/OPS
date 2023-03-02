#!/bin/bash

z=$IFS
IFS=$'\n'

read -r -p "Zadej název skupiny: " nazev
if [ -z $(cat /etc/group | grep -w $nazev) ]; then
    echo "Taková skupina neexistuje"
    exit 1
else
    uzivatele=$(cat /etc/group | grep -w $nazev | cut -d":" -f4)
    echo "Uživatelé ve skupině $nazev jsou:"
    if [ -z $uzivatele ]; then
        echo "Ve skupině se nikdo nenachází"
    else
        echo $uzivatele
    fi
fi

IFS=$z
