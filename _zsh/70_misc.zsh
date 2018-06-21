# Important
zstyle ':completion:*:default' menu select=2

zstyle ':completion:*:sudo:*' environ PATH="$SUDO_PATH:$PATH"

# Completing Groping
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'
zstyle ':completion:*' group-name ''

# Completing misc
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history

# 中間ファイルは補完候補にしない
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

# cacheを使う
zstyle ':completion:*' use-cache true

# 変数の添字を補完する
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# 親ディレクトリからカレントディレクトリを選択しないので非表示にする
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Completing Colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Set Separator, default: --
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# for Docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-:*' option-stacking yes

# Menu select
zmodload -i zsh/complist
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
