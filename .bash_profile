PATH=$PATH:$HOME/.rvm/bin:$HOME/bin # Add RVM to PATH for scripting
[ -z "$PS1" ] && return # If not running interactively, don't do anything
export TERM=screen-256color
HISTCONTROL=ignoreboth

shopt -s histappend # append to history file
shopt -s checkwinsize # ensure window size is correct

set -o vi

function EXT_COL () { echo -ne "\[\033[38;5;$1m\]"; }


USERCOL=`EXT_COL 25`
ATCOL=`EXT_COL 26`
HOSTCOL=`EXT_COL 29`
PATHCOL=`EXT_COL 115`
BRANCHCOL=`EXT_COL 216`
RETURNCOL=`EXT_COL 9`
TIMECOL=`EXT_COL 242`

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function parse_git_dirty {
        status=`git status 2> /dev/null`
        dirty=`echo -n "${status}" 2> /dev/null | grep -q "modified:" 2> /dev/null; echo "$?"`
        untracked=`echo -n "${status}" 2> /dev/null | grep -q "Untracked files" 2> /dev/null; echo "$?"`
        ahead=`echo -n "${status}" 2> /dev/null | grep -q "Your branch is ahead of" 2> /dev/null; echo "$?"`
        newfile=`echo -n "${status}" 2> /dev/null | grep -q "new file:" 2> /dev/null; echo "$?"`
        renamed=`echo -n "${status}" 2> /dev/null | grep -q "renamed:" 2> /dev/null; echo "$?"`
        bits=''
        if [ "${dirty}" == "0" ]; then
                bits="${bits}⚡"
        fi
        if [ "${untracked}" == "0" ]; then
                bits="${bits}?"
        fi
        if [ "${newfile}" == "0" ]; then
                bits="${bits}+"
        fi
        if [ "${ahead}" == "0" ]; then
                bits="${bits}*"
        fi
        if [ "${renamed}" == "0" ]; then
                bits="${bits}>"
        fi
        echo "${bits}"
}

nonzero_return() {
   RETVAL=$?
   [ $RETVAL -ne 0 ] && echo " ⏎ $RETVAL "
}

PS1="\n$TIMECOL\@ $USERCOL \u $ATCOL@ $HOSTCOL\h $PATHCOL \w $RETURNCOL\`nonzero_return\`$BRANCHCOL \`parse_git_branch\`\`parse_git_dirty\` $NC\n\\$ "

if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi

if [ -f ~/.bash_local ]; then
   . ~/.bash_local
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

ulimit -n 1024
ulimit -u 1024
export EDITOR=vim
alias tmux="TERM=screen-256color-bce tmux"
alias l='ls'
alias la='ls -a'
alias sl='ls'
alias bi='vi'
export PATH=/usr/local/bin:$PATH
export ES_HOME=~/dev/elasticsearch/
export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export GOPATH=~/go
export PATH=$PATH:/$GOPATH/bin
export PATH=$(npm bin):$PATH
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/Faiq/.docker/machine/machines/faiqs-docker-vm"
export DOCKER_MACHINE_NAME="faiqs-docker-vm"
