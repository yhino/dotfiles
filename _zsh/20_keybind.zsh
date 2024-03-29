# vim:ft=zsh

bindkey -e

ghq-fzf() {
    local dir=$(ghq list |fzf-tmux -p 80% +m)
    if [[ -n "$dir" ]]; then
        BUFFER="cd $(ghq root)/${dir}"
        zle accept-line
    fi
    zle -R -c
}
zle -N ghq-fzf
bindkey '^]' ghq-fzf

git-br-fzf() {
    local branch_name=$(git branch -a 2>/dev/null |grep -v HEAD |fzf-tmux -p 90% +m --prompt="Branch> " --preview="echo {} |tr -d ' ' |xargs git lg --color=always")
    if [[ -n "${branch_name}" ]]; then
        BUFFER="git switch ${branch_name}"
        zle accept-line
    fi
    zle -R -c
}
zle -N git-br-fzf
bindkey '^g' git-br-fzf

select-history() {
    BUFFER=$(history -n -r 1 |awk '!a[$0]++' |fzf-tmux -p 90% --no-sort +m --query "$LBUFFER" --prompt="History> ")
    CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

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
