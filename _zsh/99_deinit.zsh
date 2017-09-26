echo
echo -ne "$fg_bold[cyan]This is ZSH $fg_bold[red]${ZSH_VERSION}$reset_color"
echo -e  "$fg_bold[cyan] - DISPLAY on $fg_bold[red]${DISPLAY}$reset_color"
echo

() {
    local f
    for f in ./*secret*.zsh(N-.)
    do
        source $f
    done
}
