#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession

compton --vsync opengl-swc --backend glx &
hsetroot -tile $BG
xss-lock -- i3lock -i /home/$USER/Photos/wallpapers/ibm.png -t &
xrdb -merge  ~/.Xresources
numlockx on
setxkbmap -option caps:swapescape
dwmblocks &
st &
caffeine &
exec dbus-run-session -- dwm
