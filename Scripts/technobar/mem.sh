#!/bin/bash

# Mem
mem="$(free --si -h | awk '/Mem/ {print substr($3, 1, length($3))}')"
icon1="🗒️"

# Output
echo $icon1 $mem
