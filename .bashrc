# {{{ Prompt
GREEN='\[\e[0;32m\]'
DEFAULT='\[\e[0;37m\]'

PS1="${GREEN}\h${DEFAULT}:\w\\$ "
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
    if [ -f ${HOME}/.dir_colors ]; then
        eval `dircolors -b ${HOME}/.dir_colors`
    fi
    ;;
    *)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    ;;
esac
## ls補完除外キーワード
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
# nvm
if [ -f ${HOME}/.nvm/nvm.sh ]; then
    . ${HOME}/.nvm/nvm.sh
    nvm use default > /dev/null
fi
# grep
export GREP_OPTIONS='--color=auto'
# }}}

# {{{ Localize
if [ -f ${HOME}/.bachrc_local ]; then
    . ${HOME}/.bachrc_local
fi
# }}}
