# {{{ path
# sudoのpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

# pathを設定
typeset -U path cdpath fpath manpath
if [[ -x `which brew` ]]; then
    path=($(brew --prefix php54)/bin(N-/) $(brew --prefix mysql)/bin(N-/) ~/bin(N-/) /usr/local/bin(N-/) ${path})
fi

# fpathを設定
fpath=(${fpath})

# }}}

# {{{ Env
export LANG=ja_JP.UTF-8
export LESSCHARSET=UTF-8
if [[ -x `which vim` ]]; then
    export EDITOR=vim
fi
case "${OSTYPE}" in
    linux*)
        if [[ -f "${HOME}/.dir_colors" ]]; then
            eval `dircolors -b ${HOME}/.dir_colors`
        fi
    ;;
    *)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    ;;
esac
# ls
export FIGNORE=${FIGNORE}:.svn:.git
# grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;41;37'

if [ -f ${HOME}/.nvm/nvm.sh ]; then
    . ${HOME}/.nvm/nvm.sh
    nvm use default > /dev/null
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    . ${HOME}/.rvm/scripts/rvm
fi
# }}}
