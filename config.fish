# Usually goes into ~/.config/fish/config.fish
# fisher add jomik/fish-gruvbox

fish_vi_key_bindings

theme_gruvbox dark

# ============== Aliases ==============
## Directories
alias ...='cl ../..'
alias ....='cl ../../..'
alias .....='cl ../../../..'
# -l = list in long format
# -a = list entries starting with . (hidden)
# -G = colors
# -h = human readable 
alias l="ls -lAGh --color=auto"

alias grep='grep --color=auto'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

alias vimr="vim -R "
alias findn='find . -name '"$1"''
alias _sb="source ~/.config/fish/config.fish"
alias _eb="vim ~/.config/fish/config.fish"
alias _et="vim ~/.tmux.conf"
alias _ei="vim ~/.config/i3/config"
alias htopc="htop --sort-key=PERCENT_CPU"
alias htopm="htop --sort-key=PERCENT_MEM"

alias sagi="sudo apt-get install -y "
alias sagr="sudo apt-get remove -y "
alias sagu="sudo apt-get update "
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

## Git aliases
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gall='git add .'

function psgrep
  if set -q argv 
    echo "Grepping for processes matching $argv[1]..."
    ps aux | grep -i $argv[1] | grep -v grep
  else
    echo "Need a name for grep"
  end
end

function cl
  cd $argv[1] && l
end

function _col 
  if test (count $argv) -eq 2
    awk -F"$argv[1]" -v col=$argv[2] '{print $col}'
  else 
    awk -v col=$argv[1] '{print $col}'
  end
end

function sinsert
  echo $argv[1] >> ~/.snippy/$argv[2]
  echo "Inserted $argv[1] into ~/.snippy/$argv[2]"
end

export GDK_SCALE=1.2
