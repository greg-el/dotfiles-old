#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


# aliases
alias todo="vim ~/todo"
alias bm="/home/greg/.bashmount/bashmount"
alias daily="./home/greg/projects/dailyProgrammer/daily"
alias tab='python /home/greg/projects/tabFinder/main.py'
alias aur=". /home/greg/scripts/aur-auto"
alias theme='. ~/scripts/theme'
# extends regex
shopt -s extglob
