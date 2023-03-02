#!/bin/bash

read -r -p "Zadej své datum narození (DD.MM.YYYY): " datum_narozeni

# 1.6.2003
den=$(echo $datum_narozeni | cut -d"." -f1)
mesic=$(echo $datum_narozeni | cut -d"." -f2)
rok=$(echo $datum_narozeni | cut -d"." -f3)

if [ $den -gt 31 ] || [ $mesic -gt 12 ] || [ $rok -gt $(date +%Y) ]; then
    echo "Neplatné datum"
    exit 1
fi

# 2.6.2023
den_now=$(date +%d)
mesic_now=$(date +%m)
rok_now=$(date +%Y)

vek=$(($rok_now - $rok))

if [ $mesic -gt $mesic_now ]; then
    vek=$(($vek - 1))
fi

if [ $mesic -eq $mesic_now ] && [ $den -gt $den_now ]; then
    vek=$(($vek - 1))
fi

if [ $vek -gt -1 ]; then
    echo "Je ti $vek let"
else
    echo "Ješte si se nenarodil"
fi
