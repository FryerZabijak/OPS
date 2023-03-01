#!/bin/bash
z=$IFS
IFS=$'\n'


function Prazdny_Soubor {
    velikost=$(stat --format=%s $1)
    if [ $velikost -eq 0 ]
        then

        return 1

        fi

    return 0
}

function Spustitelny_soubor {
    # vypíšu si oprávnění ve formátu -rw-rw-r--
    opravneni=$(stat --format=%A $1)
    # zjistím si jestli oprávnění obsahují znak 'x'
    spustitelny=$(echo $opravneni | grep "x")
    if [ -z $spustitelny ]
    then
        # Není Spustitelný
        return 0
    else
        # Je spustitelný
        return 1
    fi
}

neprazdny=-1
read -p "Zadej cestu k adresáři: " cesta
ok=0
if [ -d $cesta ]
then
    echo "Prohledávání $cesta..."
else
    echo "Taková cesta neexistuje"
    read
    exit 1
fi

for soubor in $(find $cesta)
    do
    
    Spustitelny_soubor $soubor
    if [ $? -eq 0 ]
    then
        continue
    fi

    Prazdny_Soubor $soubor
    if [ $? -lt 1 ]
    then
        neprazdny=$(($neprazdny + 1))
    fi

    done

IFS=$z

echo "Počet spustitelných neprázdných souborů: $neprazdny"