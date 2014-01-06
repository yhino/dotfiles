#!/bin/sh

# initialize git submodule
if [ -x `which git` ]; then
    git submodule update --init
else
    echo '[warn] can not setup submodules, please install git'
fi

# link dotfiles
for dotfile in _?*; do
    case ${dotfile} in
        *)
            ln -Fis ${PWD}/${dotfile} ${HOME}/${dotfile/_/.}
            ;;
    esac
done
