has() {
    type "${1:?too few arguments}" &>/dev/null
}

is_screen_running() {
    [[ -n $STY ]]
}

is_tmux_running() {
    [[ -n $TMUX ]]
}

is_screen_or_tmux_running() {
    is_screen_running || is_tmux_runnning
}

shell_has_started_interactively() {
    [[ -n $PS1 ]]
}

is_ssh_running() {
    [[ -n $SSH_CLIENT ]]
}

ostype() {
    echo ${(L):-$(uname)}
}

os_detect() {
    export PLATFORM
    case "$(ostype)" in
        *linux*)  PLATFORM='linux'   ;;
        *darwin*) PLATFORM='osx'     ;;
        *bsd*)    PLATFORM='bsd'     ;;
        *)        PLATFORM='unknown' ;;
    esac
}

is_linux() {
    os_detect && [[ $PLATFORM == 'linux' ]]
}

is_osx() {
    os_detect && [[ $PLATFORM == 'osx' ]]
}
alias is_mac=is_osx
