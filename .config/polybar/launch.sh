#!/bin/bash
unset hex0
unset hex1
unset hex2
unset hex3
unset hex4
unset hex5
unset hex6
unset hex7
unset hex10

source ~/.cache/wal/colors.sh

declare -a hexarr=(${color0} ${color1} ${color2} ${color3} ${color4} ${color5} ${color6} ${color7} ${color8} ${color9} ${color10} ${color11} ${color12} ${color13} ${color14})

COUNT=0
for i in "${hexarr[@]}"; do
        color=$i
        hash='#'
        alpha='D9'
        hex=$(echo $color | cut -c2-7)
        polybar=$hash$alpha$hex
        varname='hex'
        declare $varname$COUNT="$polybar"
        export $varname$COUNT="$polybar"
        let COUNT=COUNT+1
done

killall -q polybar

while pgrep -u $UID -x polybar -q >/dev/null; do sleep 1; done

polybar bottom-right &
polybar bottom-left &
