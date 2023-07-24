#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession

picom -b &
feh --bg-fill ~/.dotfiles/wallpapers/jesus1.jpg &
xrdb -merge  ~/.Xresources &
xrandr --output eDP-1 --gamma 1:0.96:1 &
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" .2 &

autorandr -c
exec dbus-run-session -- spectrwm
