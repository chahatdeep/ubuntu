# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#synclient mouse settings:
synclient HorizTwoFingerScroll=1
synclient VertTwoFingerScroll=1
synclient PalmDetect=1

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
#Switching Caps with Escape Key
setxkbmap -option caps:escape

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#------------------MY Customized ALIASES-----------------:

alias hiber='sudo pm-hibernate'
#alias suspend='sudo sh ~/.scripts/suspend.sh'
alias suspend='sudo pm-suspend'
alias bright='xrandr --output LVDS1 --brightness'
alias redoff='sudo killall redshift'
alias vol=' echo "Enter the volume between 0 and 64" && amixer set Master'
alias volview='alsamixer'
alias pdf='evince'
alias lsl='ls -al'
alias mountall='bash ~/.mountall.sh'
alias chrome='chromium'
alias gre='vim ~/GRE_PRINT.txt'
alias arduino='cd ~/Downloads/arduino-1.6.1/ && sudo ./arduino'
alias cli='sudo killall xinit'
alias wifi='sudo wifi-menu'
alias drive_folder='cd /media/Work/ElectroniX/Google\ Drive/'
alias gmail='firefox -new-tab mail.google.com'
alias google='firefox -new-tab www.google.com'
alias college-wifi='wifi && firefox -new-tab http://172.10.1.2:8090/httpclient.html'
alias cal='calc'
alias calendar='evolution'
alias weather='gnome-weather'
alias filemanager='nemo --no-desktop'
alias wall_color='feh --bg-fill ~/Pictures/10718_naruto.jpg'
alias wall_black='feh --bg-fill ~/Downloads/naruto.jpg'
alias wall_arch='feh --bg-fill ~/Downloads/arch-linux-computer-hd-wallpaper-1920x1080-5991.png'
alias wall_pi='feh --bg-fill ~/Desktop/W8OiQO8.jpg'
alias ebook='calibre'
alias music='deadbeef'
alias monitor_off='sleep 1 && xset dpms force standby'
alias monitor_off_time='xset s'
alias torrent='qbittorrent'
alias gre='pdf /media/ElectroniX/ElectroniX/Google\ Drive/Books/GRE\ Prep/1014-practice-questions.pdf & calc & exit'
alias unicode_install='sudo pacman -S $(pacman -Ss ttf | sed -n 's#^\([^/]*/ttf[^]*\).*$#\1#p')'
alias note='vim ~/work/'
alias manhattan='evince ~/Downloads/5\ lb.\ Book\ of\ GRE\ Practice\ Problems\ -\ Manhattan\ Prep.pdf & exit'
alias .wine='cd ~/.wine/drive_c/'
alias taskmanager='ksysguard'
alias todo='vim ~/todo.txt'
alias passkey='vim /media/Work/ElectroniX/Google\ Drive/Credentials_Passwords.txt'
alias stopwatch='bash ~/.scripts/stopwatch'
alias conky_all='conky && conky -c ~/.conkyrc3 && conky -c ~/.conky_to_do2 && exit'
alias print_restart='sudo systemctl restart org.cups.cupsd.service'
alias printer_add='sudo system-config-printer'
alias com='./a.out'
alias codes_folder='cd /media/Work/Linux_codes/'
alias display_off='sleep 1 & xset dpms force standby'
#-------------------------------------------------------

#Set Default EDITOR to vim:
export EDITOR=vim

#--------------------------------------------------------

# <ROS Settings>-----------------------------------------

source /opt/ros/indigo/setup.bash


#--------------------------------------------------------


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
source /opt/ros/indigo/setup.bash
source /opt/ros/indigo/setup.bash
