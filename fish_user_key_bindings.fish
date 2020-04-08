function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end

    bind -M default \ca beginning-of-line
    bind -M default \ce end-of-line

    bind -M insert \cp history-token-search-backward
    bind -M insert \cn history-token-search-forward
    bind -M insert \cp up-or-search
    bind -M insert \cn down-or-search

    bind -M insert -m default jk 'commandline -f repaint'
    bind -M insert \ca beginning-of-line
    bind -M insert \ce end-of-line
    bind -M insert \ef forward-word
    bind -M insert \eb backward-word
    bind -M insert \ck kill-line
    bind -M insert \cl 'clear; commandline -f repaint'
end
