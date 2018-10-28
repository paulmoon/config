# ============== Aliases ==============
## Directories
alias ..='cl ..'
alias ...='cl ../..'
alias ....='cl ../../..'
alias .....='cl ../../../..'
# -l = list in long format
# -a = list entries starting with . (hidden)
# -G = colors
# -h = human readable 
alias l='ls -lAGh'

alias grep='grep --color=auto'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

alias vimr="vim -R "
alias findn='find . -name '"${1}"''
alias _sb="source ~/.bashrc"
alias _eb="vim ~/.bashrc"
alias _et="vim ~/.tmux.conf"
alias htopc="htop --sort-key=PERCENT_CPU"
alias htopm="htop --sort-key=PERCENT_MEM"

## Git aliases
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gall='git add .'
function gc() {
  git commit -m "$*"
}

# ============== Functions ==============

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
  if [[ -n $1 ]] ; then
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
  builtin cd "$@" && l;
}

_col() {
  if [ ! -z $2 ]
  then 
    awk -F"$1" -v col=$2 '{print $col}'
  else 
    awk -v col=$1 '{print $col}'
  fi
}

_mkd() { 
  [[ "$1" ]] && mkdir -p "$1" && cd "$1";
}

# ============== Exports ==============

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ============== Readline ==============
# Case-insensitive completion
bind "set completion-ignore-case on"
# Show all options if completion can't be done
bind "set show-all-if-ambiguous on"

# ============== Colors ==============
# ANSI color sequences to distinguish file types.
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

function set_bash_prompt () {
  PURPLE='\[\e[0;35m\]'
  CYAN='\[\e[0;36m\]'
  WHITE='\[\e[0;37m\]'
  COLOR_NONE='\[\e[0m\]'
  # Username
  PS1="$CYAN\u"
  # :
  PS1="${PS1}$WHITE:"
  # Current path
  PS1="${PS1}$WHITE\w"
  # $
  PS1="${PS1}$PURPLE \$ "
  # Reset colors
  PS1="${PS1}$COLOR_NONE"
}
export PROMPT_COMMAND=set_bash_prompt

# Disable START/STOP output control which allows CTRL-S to work in Vim.
stty -ixon

# Allow CTRL-O in Mac.
# stty discard undef

# ============== History ==============
export HISTSIZE=100000
export HISTFILESIZE=100000
# Don't put duplicate lines or spaces in the history.
export HISTCONTROL=ignoredups:ignorespace
export HISTTIMEFORMAT='%Y/%m/%d %T '
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

