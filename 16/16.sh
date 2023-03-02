#!/bin/bash
z=$IFS
IFS=$'\n'

login=$(whoami)

for _ in $(ls -1 $HOME/Plocha)
do
    echo $login
done

IFS=$z