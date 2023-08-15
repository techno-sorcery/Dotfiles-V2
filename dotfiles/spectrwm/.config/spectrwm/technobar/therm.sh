#!/bin/bash

# Temp
temp="$(sensors | awk '/CPU:/ {print substr($2,2,2)}')"

if [[ $temp -lt 60 ]] ; then
    icon1="󱃃"
elif [[ $temp -ge 60 && $temp -lt 80 ]] ; then
    icon1="󰔏"
else
    icon1="󱃂"
fi

# Fan
fan="$(sensors | awk '/fan1/ {print $2}')"

if [ $fan == 0 ] ; then
    icon2="󰠝"
else
    icon2="󰈐"
fi

# Output
echo $icon1 $temp°C, $icon2 $fan RPM
