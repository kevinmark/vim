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

alias ls='ls --color'
alias vi='vim'
alias sudo='sudo env PATH=$PATH LD_LIBRARY_PATH=$LD_LIBRARY_PATH'
# simple web server (depends on python)
alias simpleweb='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'



# user path for excuting private-build
PATH=${HOME}/local/bin:${HOME}/local/sbin:"$PATH":/usr/local/sbin:/usr/sbin:/sbin

# ./configure argument for gcc header path
export C_INCLUDE_PATH=${HOME}/local/include
#                    for g++ header path
export CPLUS_INCLUDE_PATH=${HOME}/local/include
#                    searched when the program starts
#                    (used by program)
export LD_LIBRARY_PATH=${HOME}/local/lib/
#                    searched at link time ( before compiled completely, 
#                             to search for directories containing needed libraries )
#                    (used by gcc)
export LIBRARY_PATH=${HOME}/local/lib/
#                    searched for installed library information
export PKG_CONFIG_PATH=${HOME}/local/lib/pkgconfig/
#                    for GCC optimization
export CFLAGS="-march=native -mtune=native -pipe -O2"
export CXXFLAGS="${CFLAGS}"




# 500gpv2 env section
if [ -n "$(uname -a | grep mips)" ]; then
	export TMP=/opt/tmp
	export TEMP=/opt/tmp
	
	alias ls='/opt/bin/ls --color'
	alias wget='/opt/bin/wget'
	#alias grep='/opt/bin/grep'

	alias ps='/opt/bin/ps'
	alias vim='env TMPDIR=/tmp TERM=xterm-color /opt/bin/vim'
	unalias vi
	#alias vi='vim'
	alias curl='/opt/bin/curl'
	alias nethogs='TERMINFO="/opt/share/terminfo/" && nethogs'

	PATH="$PATH":/opt/etc/init.d:/opt/bin:/opt/sbin:/opt/local/bin
        #export PS1='\u@\[\033[0;33m\]\h:\[\033[1;37m\]\w\[\033[0m\]\$ '
	export LC_ALL=zh_TW.UTF-8

	# for screen
	[ ! -e /opt/var/run/utmp ] && touch /opt/var/run/utmp
		
	# for git pull
	export GIT_SSH=${HOME}/.gitssh.sh
	
	# change shell for auto-complete tab
#	[ -e /bin/ash ] && export SHELL=/bin/ash; exec /bin/ash
fi

# shimakaze env
if [ -n "$(hostname | grep shimakaze)" ]; then

        # Chinese Description in LXDE
        alias startx="LANGUAGE='zh_TW.UTF-8' startx"
        # fix problem : when "ls -la" it disply unknown code in month column
        #export LC_TIME=zh_TW.UTF-8
        export LC_TIME=en_US.UTF-8
fi

# Ubuntu config
if [ -n "$(uname -a | grep Ubuntu)" ]; then
       export LANGUAGE="en_us"
fi

# .tmp/ for compiler caching
if [ -d "${HOME}/download_large/.tmp" ]; then
	export TEMP=${HOME}/download_large/.tmp 
	export TMPDIR=${HOME}/download_large/.tmp
fi	
if [ -d "${HOME}/download/.tmp" ]; then
	export TEMP=${HOME}/download/.tmp 
	export TMPDIR=${HOME}/download/.tmp
fi	

# TOMATO cross compiler position
if [ -d "/opt/brcm" ]; then
	PATH="$PATH":/opt/brcm/hndtools-mipsel-uclibc/bin:/opt/brcm/hndtools-mipsel-linux/bin

	#CPLUS_INCLUDE_PATH=/opt/brcm/hndtools-mipsel-linux/include:${CPLUS_INCLUDE_PATH}
	#C_INCLUDE_PATH=/opt/brcm/hndtools-mipsel-linux/include:${C_INCLUDE_PATH}
	#LD_LIBRARY_PATH=/opt/brcm/hndtools-mipsel-linux/lib:${LD_LIBRARY_PATH}
	#LIBRARY_PATH=/opt/brcm/hndtools-mipsel-linux/lib:${LIBRARY_PATH}
fi

# python 3  VirtualEnv
[ -d "${HOME}/local/python_env" ] && \
	VIRTUAL_ENV_DISABLE_PROMPT=1 source ${HOME}/local/python_env//bin/activate

# Nodejs Version Magager (NVM) installation PATH
# if others needed, make a symbolic link "/others/.nvm/" to install_dir
[ -d "$HOME/.nvm" ] && export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && cd ~ && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

