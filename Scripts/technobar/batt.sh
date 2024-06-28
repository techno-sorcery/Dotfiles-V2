#!/bin/bash

# Batt
batt="$(cat /sys/class/power_supply/BAT0/capacity)"
state="$(cat /sys/class/power_supply/BAT0/status)"
time_raw="$(upower --dump | grep -m1 'time to')"

time="$(echo $time_raw | awk '{print $4}')"
UNITS="$(echo $time_raw | awk '{print $5}')"
sym="%"


# Time
if [[ ${#time} -gt 1 ]] ; then
    time=", $time"
fi

# Units
if [ $UNITS == "hours" ]; then
    UNITS="hrs"
elif [ $UNITS == "hours" ]; then
    UNITS="hr"
else
    UNITS="mins"
fi

# Charge icon
if [[ !(-d "/sys/class/power_supply/BAT0") ]] ; then
    icon1="🚫"
    sym=""
    time=""
elif [[ $state == "Charging" ]] ; then
    icon1="🔌"
else
    if [[ $batt -le 25 ]] ; then
        icon1="🪫"
    else
        icon1="🔋"
    fi
fi

# Output
echo $icon1 $batt$sym$time $UNITS
