# {{{ path
# sudoのpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

# pathを設定
typeset -U path cdpath fpath manpath
path=($(brew --prefix php54)/bin(N-/) $(brew --prefix mysql)/bin(N-/) ~/bin(N-/) /usr/local/bin(N-/) ${path})

# fpathを設定
fpath=(${fpath})

# }}}

# {{{ Env
export LANG=ja_JP.UTF-8
export LESSCHARSET=UTF-8
export EDITOR=vim
case "${OSTYPE}" in
    linux*)
    ;;
    *)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    ;;
esac

if [ -f ${HOME}/.nvm/nvm.sh ]; then
    . ${HOME}/.nvm/nvm.sh
    nvm use default > /dev/null
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# }}}
