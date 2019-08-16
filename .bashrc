#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)
#
## Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences
#
## Wal alpha
source ~/.cache/wal/colors.sh
#
declare -a hexarr=(${color0} ${color1} ${color2} ${color3} ${color4} ${color5} ${color6} ${color7} ${color8} ${color9} ${color10} ${color11} ${color12} ${color13} ${color14})
#
COUNT=0
for i in "${hexarr[@]}"; do
        hexinput=$i
        a=`echo $hexinput | cut -c2-3` 
        b=`echo $hexinput | cut -c4-5` 
        c=`echo $hexinput | cut -c6-7` 
    
        r=`echo $((0x${a}))` 
        g=`echo $((0x${b}))` 
        b=`echo $((0x${c}))` 
        a='F2'
        begin='rgba('
        end=')'
        rgba=$begin$r,$g,$b,$a$end
        varname='color_argb'
        declare $varname$COUNT="$rgba"
        export $varname$COUNT="$rgba"
        let COUNT=COUNT+1
done    

COUNT=0
for i in "${hexarr[@]}"; do
        color=$i
        hash='#'
        alpha='D9'
        hex=$(echo $color | cut -c2-7)
        polybar=$hash$alpha$hex
        varname='color_hex'
        declare $varname$COUNT="$polybar"
	export $varname$COUNT="$polybar"
        let COUNT=COUNT+1
done

# aliases
alias todo="vim ~/todo"
alias bm="/home/greg/.bashmount/bashmount"
alias daily=". ~/dailyProgrammer/daily"
alias wakeserver="wol b8:27:eb:cc:70:f2"
alias sleepserver='ssh -t pi "systemctl suspend -i"'
alias tab='python /home/greg/projects/tabFinder/main.py'
# extends regex
shopt -s extglob
