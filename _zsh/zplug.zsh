zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "zsh-users/zsh-completions", defer:0

zplug "zsh-users/zsh-autosuggestions", defer:2, hook-load:"ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'"

zplug "zsh-users/zsh-syntax-highlighting", defer:3, if:"is-at-least 4.3.11"

zplug "docker/cli", use:"contrib/completion/zsh", defer:1

zplug "docker/compose", use:"contrib/completion/zsh", defer:1

# disable because there is a problem that cd completion does not work
#zplug "b4b4r07/enhancd", use:init.sh

zplug "ajeetdsouza/zoxide", as:command, from:gh-r, hook-load:'eval \"\$(zoxide init zsh)\"'

zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf

zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

zplug "stedolan/jq", as:command, from:gh-r

zplug "x-motemen/ghq", as:command, from:gh-r

zplug "tcnksm/ghr", as:command, from:gh-r

zplug "b4b4r07/zsh-gomi", as:command, use:bin/gomi

zplug "plugins/kubectl", from:oh-my-zsh, lazy:true

zplug "superbrothers/zsh-kubectl-prompt", if:"[ -s ~/.kube/config ]"

zplug "~/.zsh", from:local, use:"<->_*.zsh"
