#!/bin/bash
autorandr -c --skip-option crtc
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" 0.4
setxkbmap -option caps:swapescape
pkill -RTMIN+9 dwmblocks
pkill -RTMIN+8 dwmblocks
pkill -RTMIN+5 dwmblocks
pkill -RTMIN+4 dwmblocks
slock

