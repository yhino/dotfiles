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
    setopt no_nomatch
    . ${HOME}/.nvm/nvm.sh
    nvm use default > /dev/null
fi
