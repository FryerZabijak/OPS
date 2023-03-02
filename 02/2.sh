#!/bin/bash
read -r -p "Napiš název procesu: " nazev_procesu
pocet_procesu=$(ps aux | grep "$nazev_procesu" | wc -l)
if [ $pocet_procesu -gt 1 ]
then
echo "Proces je spuštěný"
else
echo "Proces není spuštený"
fi