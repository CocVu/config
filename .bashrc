#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] ;and return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

#export PS1="\[\033[38;5;12m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

[ -e "/etc/DIR_COLORS" ] ;and DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] ;and DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] ;or DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"
set -o vi
# export JAVA_HOME=/usr/bin/java
# export PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export JAVA=$JAVA_HOME/bin/java
export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH


export HADOOP_CONF_DIR=/usr/lib/hadoop/orig_etc/hadoop/
export HADOOP_HOME=/usr/lib/hadoop
if [ -n "$SSH_TTY" ]; then exec fish -C 'set -g fish_color_host brred'; else exec fish; fi
# export HADOOP_LOG_DIR=/tmp/hadoop/log
# export HADOOP_SLAVES=/etc/hadoop/slaves
# export HADOOP_PID_DIR=/tmp/hadoop/run
