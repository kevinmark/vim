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
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='02;04;32'

#	color of directory color
export LS_COLORS="$LS_COLORS:di=01;34;47"
#	color of compress file
export LS_COLORS="$LS_COLORS:*.tar=01;31:*.tgz=01;31:*.tbz2=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.xz=01;31"
#	color of multimedia file
export LS_COLORS="$LS_COLORS:*.avi=01;35:*.mp4=01;35:*.flv=01;35:*.3gp=01;35:*.mpg=01;35"

alias vi='vim'
alias ls='ls --color'
alias sudo='sudo LD_LIBRARY_PATH=$LD_LIBRARY_PATH env PATH=$PATH'




# user path for excuting private-build
PATH=${HOME}/local/bin:${HOME}/local/sbin:"$PATH":/usr/local/sbin:/usr/sbin:/sbin
#           for gcc header path
export C_INCLUDE_PATH=${HOME}/local/include
#           for g++ header path
export CPLUS_INCLUDE_PATH=${HOME}/local/include
#           searched when the program starts
#           (used by program)
export LD_LIBRARY_PATH=${HOME}/local/lib/
#           searched at link time ( before compiled completely, 
#                    to search for directories containing needed libraries )
#           (used by gcc)
export LIBRARY_PATH=${HOME}/local/lib/
#	    searched for installed library information
export PKG_CONFIG_PATH=${HOME}/local/lib/pkgconfig/




# Ubuntu config
if [ -n "$(uname -a | grep Ubuntu)" ]; then
       export LANGUAGE="en_us"
fi

# tmp/ for compiler caching
if [ -d "${HOME}/download_large/tmp" ]; then
       export TEMP=${HOME}/download_large/tmp
       export TMPDIR=${HOME}/download_large/tmp
fi

# TOMATO cross compiler position
if [ -d "/opt/brcm" ]; then
	PATH="$PATH":/opt/brcm/hndtools-mipsel-uclibc/bin:/opt/brcm/hndtools-mipsel-linux/bin

	#CPLUS_INCLUDE_PATH=/opt/brcm/hndtools-mipsel-linux/include:${CPLUS_INCLUDE_PATH}
	#C_INCLUDE_PATH=/opt/brcm/hndtools-mipsel-linux/include:${C_INCLUDE_PATH}
	#LD_LIBRARY_PATH=/opt/brcm/hndtools-mipsel-linux/lib:${LD_LIBRARY_PATH}
	#LIBRARY_PATH=/opt/brcm/hndtools-mipsel-linux/lib:${LIBRARY_PATH}
fi

# python 2.7  VirtualEnv
if [ -d "${HOME}/local/python_env" ]; then
	VIRTUAL_ENV_DISABLE_PROMPT=1 source ${HOME}/local/python_env//bin/activate
fi
