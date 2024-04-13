#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession

# compton --vsync opengl-swc --backend glx &
hsetroot -tile $BG
xss-lock -- i3lock -i /home/$USER/Photos/wallpapers/ibm.png -t &
xrdb -merge  ~/.Xresources
numlockx on
setxkbmap -option caps:swapescape
dwmblocks &
st &
# xcompmgr &
# sleep 0.2
exec dbus-run-session -- dwm

# xinput set-prop "Kensington ORBIT WIRELESS TB Mouse" "libinput Middle Emulation Enabled" 1 &
# xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" .4 &
# autorandr -c --skip-option crtc
# ./Scripts/technobar/technobar.sh &
