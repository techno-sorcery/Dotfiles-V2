#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession

picom -b &
feh --bg-fill $BG & 
xrdb -merge  ~/.Xresources &
numlockx on &
setxkbmap -option caps:swapescape &
dwmblocks &
xscreensaver --no-splash &
st -t st -e sh -c 'fortune ~/Documents/biblefortune/bible | cowsay; $SHELL' &
exec dbus-run-session -- dwm

# xinput set-prop "Kensington ORBIT WIRELESS TB Mouse" "libinput Middle Emulation Enabled" 1 &
# xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" .4 &
# autorandr -c --skip-option crtc
# ./Scripts/technobar/technobar.sh &
