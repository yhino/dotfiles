# {{{ Prompt
DEFAULT='\[\e[00m\]'
GREEN='\[\e[1;32m\]'

PS1="[${GREEN}\h${DEFAULT}:\w]\\$"
PS2=">"
# }}}

# {{{ Alias
alias ..='cd ..'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -h'
alias diff='diff -u'
case "${OSTYPE}" in
    linux*)
    alias ls='ls -Fh --color'
    alias ll='ls -alFh'
    alias la='ls -aFh'
    alias sl='ls'
    ;;
    *)
    alias ls='ls -FhG'
    alias ll='ls -alFh'
    alias la='ls -aFh'
    alias sl='ls'
    ;;
esac
# }}}

# {{{ Env
# Basic
export PATH=${PATH}
if [ -x `which vim` ]; then
    export EDITOR=vim
else
    export EDITOR=vi
fi
case "${OSTYPE}" in
    linux*)
    ;;
    *)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    ;;
esac
export FIGNORE='.svn'
## less文字コード設定
export LESSCHARSET=utf-8
## EOF(Ctrl-D)でログアウトしない(10回まで許容)
export IGNOREEOF=10

# History
export HISTFILE="${HOME}/.bhistory"
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth
# }}}

# {{{ Localize
if [ -f ${HOME}/.bachrc_local ]; then
    . ${HOME}/.bachrc_local
fi
# }}}
