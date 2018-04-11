#zplug "zplug/zplug"

zplug "~/.zsh", from:local, use:"<->_*.zsh"

zplug "b4b4r07/enhancd", use:init.sh

zplug "zsh-users/zsh-autosuggestions", hook-load:"ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'"

zplug "zsh-users/zsh-completions"

zplug "zsh-users/zsh-syntax-highlighting", defer:2, if:"is-at-least 4.3.11"

zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf

zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

zplug "stedolan/jq", as:command, from:gh-r, rename-to:jq

zplug "github/hub", as:command, from:gh-r, rename-to:hub

zplug "motemen/ghq", as:command, from:gh-r, rename-to:ghq

zplug "tcnksm/ghr", as:command, from:gh-r, rename-to:ghr

zplug "b4b4r07/zsh-gomi", as:command, use:bin/gomi
