#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession

picom -b &
feh --bg-fill ~/Photos/Wallpapers/space2.jpg &
xrdb -merge  ~/.Xresources &
xrandr --output eDP-1 --gamma 1:0.96:1 &
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" .4 &
numlockx &
xinput set-prop "Kensington ORBIT WIRELESS TB Mouse" "libinput Middle Emulation Enabled" 1 &
./Scripts/technobar/technobar.sh &
# watch -p -n 1 ./Scripts/technobar/technobar.sh &
autorandr -c

exec dbus-run-session -- dwm
