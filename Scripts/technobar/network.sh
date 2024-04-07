#!/bin/bash

# Mem
ssid="$(nmcli con show | awk '/wlp4s0/ {print $1}')"

if [[ ${#ssid} == 0 ]] ; then
    icon1="🚫"
    ssid="d"
else
    icon1="🛜"
fi

# Output
echo $icon1 $ssid
