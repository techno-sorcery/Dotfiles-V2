#!/bin/bash

# Temp
price="$(curl -m 5 "rate.sx/link?qFT@1s" | awk '/^avg/ { print $2 } ')"

# Output
echo 🇨  $price

