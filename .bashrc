# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
force_color_prompt=yes

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

PS1="\u@\h [\$(date +%k:%M:%S)] 😎 \w > "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

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
alias proxy="export http_proxy=http://127.0.0.1:8080;export https_proxy=http://127.0.0.1:8080;echo proxy actived"
alias noproxy="export http_proxy= ;export https_proxy= ;echo proxy desactived"
alias fireprox="firefox -p roxy -no-remote"
alias gitcommit='sudo git commit -m "commit"'
alias gitconfig='sudo git config user.email "tom.bloch@univ-tlse3.fr";sudo git config user.name "thethinggoesskra";'
alias smbon="systemctl start smbd"
alias smboff="systemctl stop smbd"
alias ftpon"systemctl start vsftpd"
alias ftpoff="systemctl stop vsftpd"
alias tftpon"systemctl start atftpd"
alias tftpoff="systemctl stop atftpd"
alias httpon"systemctl start httpd"
alias httpoff="systemctl stop httpd"
alias sshon"systemctl start ssh"
alias sshoff="systemctl stop ssh"
export l="/opt/linux"
export s="/opt/resources"
export w="/opt/windows"
export i="/opt/web"
export c="/opt/cracking"
export r="/opt/reverse"
export o="/opt/osint"
export k="/opt/kit"

putsmb() {
    sudo cp "$1" "/srv/smb/root/"
    sudo chown nobody:nogroup /srv/smb/root/*
    sudo chmod 755 /srv/smb/root/*
}
puthttp() {
    sudo cp "$1" "/srv/http/root/"
    sudo chown $USER:$USER /srv/http/root/*
    sudo chmod 755 /srv/http/root/*
}
putftp() {
    sudo cp "$1" "/srv/ftp/root/"
    sudo chown ftp:ftp /srv/ftp/root/*
    sudo chmod 755 /srv/ftp/root/*
}
puttftp() {
    sudo cp "$1" "/srv/tftp/root/"
    sudo chown $USER:$USER /srv/tftp/root/*
    sudo chmod 755 /srv/tftp/root/*
}

source ~/.bash_profile
source ~/.pureline ~/.pureline.conf

# Powerline
if [ -f 'which powerline-daemon' ]; then
	powerline-daemon -q
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
fi
if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
	source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
fi

