# vim:ft=zsh

bindkey -e

select-history() {
    BUFFER=$(history -n -r 1 |awk '!a[$0]++' |fzf --no-sort +m --query "$LBUFFER" --prompt="History> ")
    CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

fixssh() {
    if is_tmux_running; then
        for key in SSH_AUTH_SOCK; do
            if ((tmux show-environment |grep "^${key}" > /dev/null)); then
                value=`tmux show-environment |grep "^${key}" |sed -e "s/^[A-Z_]*=//"`
                export ${key}="${value}"
            fi
        done

        tmux display-message "(fixssh) ssh-env fixed!!"
    fi
}

zle -N fixssh
bindkey "^[s" fixssh
