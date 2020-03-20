#!/bin/bash
xrdb ~/.Xresources
#xrandr --output DVI-I-1 --mode 1920x1080 --pos 0x0 --rotate right --output HDMI-0 --mode 1920x1080 --pos 1080x307 --rotate normal
./home/greg/scripts/screens.sh
setxkbmap gb
redshift &
dunst --config ~/.config/dunst/dunstrc &
#export XDG_SESSION_TYPE=x11
#export GDK_BACKEND=x11
#exec gnome-session
exec i3 --shmlog-size=26214400
