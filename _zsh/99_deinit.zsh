echo
echo -e "$fg_bold[cyan]This is ZSH $fg_bold[red]${ZSH_VERSION}$reset_color\n"
echo

() {
    local f
    for f in ./*secret*.zsh(N-.)
    do
        source $f
    done
}
