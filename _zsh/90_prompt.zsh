# vim:ft=zsh

if is-at-least 4.3.10; then
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' formats ' on %b'
    zstyle ':vcs_info:*' actionformats ' on %b:%a'
    precmd() {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
    }
fi

vim_=""
if [ -n "${VIMRUNTIME}" ]; then
    vim_="${fg[magenta]}(vim) ${reset_color}"
fi

arch_="$(uname -m)"

PROMPT='${vim_}${fg[green]}%M${reset_color}${fg[cyan]}(${arch_})${reset_color} %/${fg[yellow]}${vcs_info_msg_0_}${reset_color}'$'\n''%# '
PROMPT2='> '
SPROMPT='%R -> %r ? '

kubectl_context_prompt() {
    if [[ "${ZSH_KUBECTL_PROMPT}" =~ "not set" ]]; then
        return
    fi
    echo "%{$fg[yellow]%}${ZSH_KUBECTL_PROMPT}%{$reset_color%}"
}

RPROMPT='$(kubectl_context_prompt)'

# プロンプトエスケープシーケンス有効化
setopt prompt_subst

# コマンド実行後は右プロンプトを消す
setopt transient_rprompt
