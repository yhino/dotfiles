# vim:ft=zsh

if has 'exa'; then
    alias ls='exa -Fg'

    alias ll='ls -l --git'
    alias la='ls -a'
    alias lla='ll -a'
else
    if is_linux; then
        alias ls='ls -Fh --color'
    else
        alias ls='ls -FhG'
    fi

    alias ll='ls -l'
    alias la='ls -a'
    alias lla='ll -a'
fi
alias sl='ls'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias df='df -h'

alias diff='diff -u'

has 'htop' && alias top='htop'

has 'nvim' && {
    alias vim='nvim'
    alias vimdiff='nvim -d'
}

has 'k9s' && {
    alias k9s='k9s --readonly'
    alias k9sw='k9s'
}


ssh() {
    if is_tmux_running; then
        local window_name=$(tmux display -p '#{window_name}')
        local window_id=$(tmux display -p '#{window_id}')
        command ssh $@
        tmux rename-window -t $window_id $window_name
    else
        command ssh $@
    fi
}

reshell() {
    rm -f ~/.zcompdump
    rm -f ~/.zplug/zcompdump
    exec $SHELL -l
}
