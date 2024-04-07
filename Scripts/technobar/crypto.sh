#!/bin/bash

# Temp
btc="$(curl -m 10 "rate.sx/1btc")"
btc="$(printf "%0.2f" $btc)"
link="$(curl -m 10 "rate.sx/1link")"
link="$(printf "%0.2f" $link)"

# Output
echo "💰 BTC $btc, 🇨 LNK $link"

