# {{{ Prompt
autoload colors
colors

local GREEN=$'%{\e[0;32m%}'
local DEFAULT=$'%{\e[0;37m%}'

PROMPT='${GREEN}%m${DEFAULT}:%/%# '
PROMPT2='> '
SPROMPT='%R -> %r ? '
# }}}


# {{{ History
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
HISTFILE="${HOME}/.zhistory"
HISTSIZE=10000
SAVEHIST=10000
# }}}


# {{{ Alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -h'
alias diff='diff -u'
case "${OSTYPE}" in
    linux*)
    alias ls='ls -Fh --color'
    alias ll='ls -alFh'
    alias la='ls -aFh'
    alias sl='ls'
    ;;
    *)
    alias ls='ls -FhG'
    alias ll='ls -alFh'
    alias la='ls -aFh'
    alias sl='ls'
    ;;
esac
# }}}


# {{{ Keybind
bindkey -e
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
# }}}


# {{{ Completion
autoload -U compinit
compinit -u

# color
zstyle ':completion:*' list-colors ''
# }}}


# {{{ setopt
# プロンプトエスケープシーケンス有効化
setopt prompt_subst

# ディレクトリ名で移動
setopt auto_cd

## 補完関連
# 補完候補の日本語を適性表示
setopt print_eight_bit
# 移動したディレクトリを補完候補にする
setopt auto_pushd
# 補完候補を詰めて表示
setopt list_packed
# 間違ったコマンドを正す
setopt correct
# = 以降でも補完できるようにする( --prefix=/usr 等の場合)
setopt magic_equal_subst

# ビープ音を消す
setopt nolistbeep
setopt no_beep

## 履歴関連
# 直前と同じコマンドは履歴に加えない
setopt hist_ignore_dups
# 先頭がスペースのコマンドは履歴に加えない
setopt hist_ignore_space
# 履歴を共有する
setopt share_history
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 余分な空白は詰めて記録
setopt hist_reduce_blanks

#
setopt globsubst
# }}}
