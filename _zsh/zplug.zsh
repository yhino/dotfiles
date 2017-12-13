#zplug "zplug/zplug"

zplug "~/.zsh", from:local, use:"<->_*.zsh"

zplug "b4b4r07/enhancd", use:init.sh

zplug "zsh-users/zsh-completions"

zplug "zsh-users/zsh-syntax-highlighting", defer:2, if:"is-at-least 4.3.11"

zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf

zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

zplug "stedolan/jq", as:command, from:gh-r, rename-to:jq

# disabled, missmatch binary download
# zplug "github/hub", as:command, from:gh-r, rename-to:hub

zplug "b4b4r07/zsh-gomi", as:command, use:bin/gomi
