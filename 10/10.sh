#!/bin/bash

if [ -z $(systemctl status ssh | grep "running") ]
then
    echo "SSH není spuštěný"
else
    echo "SSH je spuštěný"
fi