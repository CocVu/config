#
# ~/.bash_profile
#
[[ -f ~/.bashrc ]] && . ~/.bashrc
alias ..="cd .."
alias ...="cd ../.."
alias ..2="cd ../.."
alias ....="cd ../../.."
alias ..3="cd ../../.."
alias .....="cd ../../../.."
alias ..4="cd ../../../.."
alias lh="ls -ld .[^.]*"
alias dua="(du -sh * && du -sh $(ls -d .[^.]*)) |sort -h "
function mkdircd () { mkdir -p "$@" && eval cd
"\"\$$#\""; }
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
exec startx
#xset b off # set bell off
else
    sudo loadkeys ~/.config/.keystrings
fi
