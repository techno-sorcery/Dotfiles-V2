#!/bin/bash

# Batt
batt="$(cat /sys/class/power_supply/BAT0/capacity)"
state="$(cat /sys/class/power_supply/BAT0/status)"
time_raw="$(upower --dump | grep -m1 'time to')"

time=", $(echo $time_raw | awk '{print $4}') $(echo $time_raw | awk '{print $5}')"

sym="%"

# Charge icon
if [[ !(-d "/sys/class/power_supply/BAT0") ]] ; then
    icon1="󱉞"
    sym=""
    time=""
elif [[ $state == "Charging" ]] ; then
    if [[ $batt -le 10 ]] ; then
        icon1="󰢟"
    elif [[ $batt -le 25 ]] ; then
        icon1="󰂆"
    elif [[ $batt -le 50 ]] ; then
        icon1="󰢝"
    elif [[ $batt -le 75 ]] ; then
        icon1="󰢞"
    elif [[ $batt -le 95 ]] ; then
        icon1="󰂋"
    else
        icon1="󰂄"
    fi
else
    if [[ $batt -le 10 ]] ; then
        icon1="󰂎"
    elif [[ $batt -le 25 ]] ; then
        icon1="󰁻"
    elif [[ $batt -le 50 ]] ; then
        icon1="󰁾"
    elif [[ $batt -le 75 ]] ; then
        icon1="󰂀"
    elif [[ $batt -le 95 ]] ; then
        icon1="󰂂"
    else
        icon1="󰁹"
    fi
fi

# Output
echo $icon1 $batt$sym$time
