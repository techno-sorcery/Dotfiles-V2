#!/bin/bash

# Mem
perc="$(df -h | awk '$NF=="/" {print $5}')"
# total="$(df -h | awk '$NF=="/" {print $3}')"
icon1="💾"

# Output
# echo $icon1 $perc, $total
echo $icon1 $perc
