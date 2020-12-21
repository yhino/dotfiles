zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "~/.zsh", from:local, use:"<->_*.zsh"

zplug "b4b4r07/enhancd", use:init.sh

zplug "zsh-users/zsh-completions", defer:0

zplug "zsh-users/zsh-autosuggestions", defer:2, hook-load:"ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'"

zplug "zsh-users/zsh-syntax-highlighting", defer:3, if:"is-at-least 4.3.11"

zplug "docker/cli", use:"contrib/completion/zsh", defer:1

zplug "docker/compose", use:"contrib/completion/zsh", defer:1

zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf

zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

zplug "stedolan/jq", as:command, from:gh-r, rename-to:jq

zplug "github/hub", as:command, from:gh-r, rename-to:hub

zplug "tcnksm/ghr", as:command, from:gh-r, rename-to:ghr

zplug "b4b4r07/zsh-gomi", as:command, use:bin/gomi

zplug "plugins/kubectl", from:oh-my-zsh, lazy:true
kubectl() {
    unfunction kubectl
    . "${ZPLUG_REPOS}/robbyrussell/oh-my-zsh/plugins/kubectl/kubectl.plugin.zsh"
    kubectl "$@"
}
