# tomato firmware login env

alias ls='/opt/bin/ls --color'
alias wget='/opt/bin/wget'
#alias grep='/opt/bin/grep'
alias ps='/opt/bin/ps'

alias vim='env TMPDIR=/tmp TERM=xterm-color /opt/bin/vim'
#alias vi='vim'
alias sudo='sudo LD_LIBRARY_PATH=$LD_LIBRARY_PATH env PATH=$PATH'


export PS1='\u@\[\033[0;33m\]\h:\[\033[1;37m\]\w\[\033[0m\]\$ '
export LC_ALL=zh_TW.UTF-8
#       color of directory color
export LS_COLORS="$LS_COLORS:di=01;34;47"
#       color of compress file
export LS_COLORS="$LS_COLORS:*.tar=01;31:*.tgz=01;31:*.tbz2=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.xz=01;31"
#       color of multimedia file
export LS_COLORS="$LS_COLORS:*.avi=01;35:*.mp4=01;35:*.flv=01;35:*.3gp=01;35"


PATH="$PATH":/opt/etc/init.d:${HOME}/local/bin

# for screen
if [ ! -e /opt/var/run/utmp ]; then
        touch /opt/var/run/utmp
fi
        
# for git pull
export GIT_SSH=/root/.gitssh.sh

