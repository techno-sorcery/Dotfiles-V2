#!/bin/bash

# Bright
bright="$(light -G | cut -d "." -f 1)"

if [[ $bright -lt 25 ]] ; then
    icon1="󰃞"
elif [[ $bright -ge 25 && $bright -lt 50 ]] ; then
    icon1="󰃟"
elif [[ $bright -ge 50 && $bright -lt 75 ]] ; then
    icon1="󰃝"
else
    icon1="󰃠"
fi

# Vol
vol="$(amixer get Master | awk '/Left:/ {print substr($5, 2, length($5)-3)}' )"
power="$(amixer get Master | awk '/Left:/ {print $6}')"

if [ $power == [off] ] ; then
    icon2="󰸈"
    vol="0%"
elif [[ $vol -lt 33 ]] ; then
    icon2="󰕿"
elif [[ $vol -ge 33 && $vol -lt 66 ]] ; then
    icon2="󰖀"
else
    icon2="󰕾"
fi

# Output
echo $icon1 $bright%, $icon2 $vol%
