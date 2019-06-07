alias reshell='exec $SHELL -l'

alias ..='cd ..'

if is_linux; then
    alias ls='ls -Fh --color'
else
    alias ls='ls -FhG'
fi
alias ll='ls -alFh'
alias la='ls -aFh'
alias sl='ls'

has 'lsd' && alias ls='lsd'
has 'htop' && alias top='htop'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias df='df -h'
alias diff='diff -u'


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
