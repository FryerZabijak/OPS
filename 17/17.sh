#!/bin/bash
read -r -p "Zadej uživatele: " uzivatel

if [ -z "$(users | grep -w $uzivatel)" ]; then
    echo "Zadaný uživatel není přihlášený"
else
    echo "Zadaný uživatel je přihlášený"
fi
