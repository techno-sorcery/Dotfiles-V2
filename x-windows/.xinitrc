#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession

compton --backend glx --paint-on-overlay --glx-no-stencil --vsync opengl-swc &
feh --bg-fill ~/.dotfiles/wallpapers/jesus1.jpg &
xrdb -merge  ~/.Xresources
exec spectrwm
