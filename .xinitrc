\!/bin/bash
numlockx &
xrdb ~/.Xresources
xrandr --output HDMI-0  --rotate right --pos 0x0
xrandr --output DVI-I-1 --pos 1080x450
setxkbmap gb
exec i3 --shmlog-size=26214400
