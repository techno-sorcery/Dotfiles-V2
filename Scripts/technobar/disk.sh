#!/bin/bash

# Mem
perc1="$(df -h | awk '$NF=="/" {print $5}')"
perc2="$(df -h | awk '$NF=="/home" {print $5}')"
# total="$(df -h | awk '$NF=="/" {print $3}')"
icon1="💾"

# Output
# echo $icon1 $perc1, $total
#           Root       Home
echo $icon1 $perc1, 🏠 $perc2
