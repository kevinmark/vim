#
# usage:
# (1) add following desciprtion to .bashrc
#
# # omk shell config
# if [ -f ~/.bash_profile ]; then
#     . ~/.bash_profile
# fi
#
# (2) ln -sf ~/.vim/.bash_profile ~/.bash_profile
#

# common config
export PS1='\u@\[\033[0;33m\]\h:\[\033[0;32m\]\w\[\033[0m\]\$'
export LS_COLORS="$LS_COLORS:di=01;34;47"
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='02;04;32'

alias vi='vim'
alias sudo='sudo env PATH=$PATH'

# user path for excuting private-build
PATH="$PATH":/sbin:${HOME}/local/bin
export LD_LIBRARY_PATH=${HOME}/local/lib/:${LD_LIBRARY_PATH}



# Ubuntu config
if [ -n "$(uname -a | grep Ubuntu)" ]; then
       export LANGUAGE="en_us"
fi

# tmp/ for compiler caching
if [ -d "/home/omk/download_large/tmp" ]; then
       export TEMP=/home/omk/download_large/tmp
       export TMPDIR=/home/omk/download_large/tmp
fi

# TOMATO cross compiler position
if [ -d "/opt/brcm" ]; then
    PATH="$PATH":/opt/brcm/hndtools-mipsel-uclibc/bin:/opt/brcm/hndtools-mipsel
fi


