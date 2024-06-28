#!/bin/bash

icon1="💻"

# Percentage
perc="$(command top -bn 2 -d 0.1 | awk '/Cpu/ {print $2}' | tail -n 1)"

if [[ ${#perc} -lt 4 ]] ; then
    perc=" $perc"
fi

# Clk
# clk="$(awk '/MHz/{ temp+=$4; n++ } END{ printf("%f\n", temp/n) }' /proc/cpuinfo | cut -d "." -f 1)"
# fclk="$(echo "scale=1; $clk/1000" | bc)"

# if [[ ${#fclk} -lt 3 ]] ; then
#     fclk="0$fclk"
# fi

# echo "$icon1 $perc%, $fclk GHz"
echo "$icon1 $perc%"
