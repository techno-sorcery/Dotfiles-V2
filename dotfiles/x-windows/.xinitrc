#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession

picom -b --experimental-backends &
feh --bg-fill ~/Photos/wallpapers/space2.jpg &
xrdb -merge  ~/.Xresources &
xrandr --output eDP-1 --gamma 1:0.95:1 &
xinput set-prop "Kensington ORBIT WIRELESS TB Mouse" "libinput Middle Emulation Enabled" 1 &
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" .4 &
numlockx on &
./Scripts/technobar/technobar.sh &
# ./Scripts/wakeup.sh &
# xscreensaver --no-splash &
autorandr -c
st &
exec dbus-run-session -- dwm
