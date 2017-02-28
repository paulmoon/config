bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias grep='grep --color=auto'
alias ll='ls -laGp'

# Git aliases
alias gs='git status '
alias gd='git diff '

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export PS1="\[\e[00;36m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[00;36m\]\h\[\e[0m\]\[\e[00;37m\]:\w \[\e[0m\]\[\e[00;35m\]\\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Functions
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar     xjf     $1      ;;
            *.tar.gz)   tar     xzf     $1      ;;
            *.bz2)      bunzip2         $1      ;;
            *.gz)       gunzip          $1      ;;
            *.tar)      tar     xf      $1      ;;
            *.tbz2)     tar     xjf     $1      ;;
            *.tgz)      tar     xzf     $1      ;;
            *.zip)      unzip           $1      ;;
            *.Z)        uncompress      $1      ;;
            *.7z)       7z      x       $1      ;;
            *)          echo "'$1' cannot be extracted by extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

psgrep() {
    if [ ! -z $1 ] ; then
        echo "Grepping for processes matching $1..."
        ps aux | grep -i $1 | grep -v grep
    else
        echo "Need a name for grep"
    fi
}

dirsize () {
    du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
    egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
    egrep '^ *[0-9.]*M' /tmp/list
    egrep '^ *[0-9.]*G' /tmp/list
    rm -rf /tmp/list
}

cl () {
  cd $1;
  ll;
}

# Disable Ctrl-S so it can be used for vim saving files
stty -ixon
