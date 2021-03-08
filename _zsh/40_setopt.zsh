# vim:ft=zsh

# ディレクトリ名で移動
setopt auto_cd

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

# 履歴上限に達したら重複排除を先にする
setopt hist_expire_dups_first

# 重複するコマンドは古い方を削除する
setopt hist_ignore_all_dups

# 直前と同じコマンドは履歴に加えない
setopt hist_ignore_dups

# 先頭がスペースのコマンドは履歴に加えない
setopt hist_ignore_space

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# 履歴を共有する
setopt share_history
