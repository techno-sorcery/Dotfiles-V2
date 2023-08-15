#!/bin/bash

# Perc
# mpstat 1 --dec=0 | awk '/all/ {print $4}' > ~/cpu.txt &

perc="$(command top -bn 2 -d 0.2 | awk '/Cpu/ {print $2}' | tail -n 1)"
icon1="󰘚"

# Clk
clk="$(awk '/MHz/{ temp+=$4; n++ } END{ printf("%f\n", temp/n) }' /proc/cpuinfo | cut -d "." -f 1)"
# Output
echo $icon1 $perc%, $clk MHz
