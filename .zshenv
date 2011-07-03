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
