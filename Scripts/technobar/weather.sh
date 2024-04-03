#!/bin/bash

# Temp
sense="$(curl -m 5 wttr.in/\?format="%c%t\n%w\n%p\n" > ~/.cache/techno_weather)"
temp="$(sed -n 1p ~/.cache/techno_weather)"
# wind="$(sed -n 2p ~/.cache/techno_weather)"
# rain="$(sed -n 3p ~/.cache/techno_weather)"

# Output
# echo $temp, 🍃$wind, 🌧️ $rain
echo $temp

