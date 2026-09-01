#!/usr/bin/env bash

set -eux

# ---------------------------------------------------------------------------
# Keyboard
# ---------------------------------------------------------------------------
# KeyRepeatするまでの時間
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# KeyRepeat
defaults write NSGlobalDomain KeyRepeat -int 3

# @NOTE disable temporarily
## ---------------------------------------------------------------------------
## Trackpad
## ---------------------------------------------------------------------------
## タップでクリック
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
#defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
#defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
## 右下クリックで、副クリック
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
#defaults -currentHost write NSGlobalDomain com.apple.trackpad.tapBehavior.trackpadCornerClickBehavior -int 1
#defaults -currentHost write NSGlobalDomain com.apple.trackpad.tapBehavior.enableSecondaryClick -bool true

# ---------------------------------------------------------------------------
# Finder
# ---------------------------------------------------------------------------
# 全ての拡張子を表示する
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# デフォルトでホームディレクトリを開く
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
# ステータスバー表示
defaults write com.apple.finder ShowStatusBar -bool true
# パスバー表示
defaults write com.apple.finder ShowPathBar -bool true
# 隠しファイルをfinder上で表示する
defaults write com.apple.finder AppleShowAllFiles -bool true
# finderを終了させる項目を表示する
defaults write com.apple.finder QuitMenuItem -bool true
# finderのタイトルにファイルパスを表示する
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# ---------------------------------------------------------------------------
# QuickLook
# ---------------------------------------------------------------------------
# QuickLookでテキスト選択可能にする
defaults write com.apple.finder QLEnableTextSelection -bool true
# Finderから離れた時にQuickLookウィンドウを非表示にする
defaults write com.apple.finder QLHidePanelOnDeactivate -bool true

# ---------------------------------------------------------------------------
# Dock
# ---------------------------------------------------------------------------
# dockを自動的に隠す
defaults write com.apple.dock autohide -bool true
# dockが隠れる速度を早くする
defaults write com.apple.dock autohide-delay -float 0
# dockアイコンサイズを設定
defaults write com.apple.dock tilesize -float 32
# dock拡大サイズを設定
defaults write com.apple.dock largesize -float 82
# dockの拡大機能をON
defaults write com.apple.dock magnification -bool true
# Dockに標準で入っている全てのアプリを消す
defaults write com.apple.dock persistent-apps -array
# 最近使ったアプリをDockに表示しない
defaults write com.apple.dock show-recents -bool false

# ---------------------------------------------------------------------------
# Dashboard/Exporse/MissionControl
# ---------------------------------------------------------------------------
# Dashboardを無効
defaults write com.apple.dashboard mcx-disabled -bool true
# exporseの動作を早くする
defaults write com.apple.dock expose-animation-duration -float 0.15

# ---------------------------------------------------------------------------
# Safari
# ---------------------------------------------------------------------------
# 開発メニューを表示
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# デバッグメニューを表示
defaults write com.apple.Safari IncludeDevelopMenu -bool true
# アドレスバーに完全なURLを表示
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
# コンテキストメニューにWebインスペクタを追加
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# ステータスバー表示
defaults write com.apple.Safari ShowStatusBar -bool true

# ---------------------------------------------------------------------------
# misc.
# ---------------------------------------------------------------------------
# ネットワーク接続時に.DS_Storeファイルの作成を抑制する
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# USBに.DS_Storeファイルの作成を抑制する
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# スクリーンキャプチャで影を入れないようにする
defaults write com.apple.screencapture disable-shadow -bool true
# デバイス接続時にアプリを立ち上げない
defaults write com.apple.ImageCapture disableHotPlug -bool true
# 未確認のアプリケーションを実行する際のダイアログを無効化
defaults write com.apple.LaunchServices LSQuarantine -bool false
# 印刷が終わったらプリンターアプリを終了する
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
