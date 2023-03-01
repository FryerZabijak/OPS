#!/bin/bash
proces=$(ps aux --sort -pmem | head -n2 | tail -n1)
echo "Název procesu, který bere nejvíc paměti je:"
nazev=$(echo $proces | cut -d" " -f11)
echo $nazev
