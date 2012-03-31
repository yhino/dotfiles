#!/bin/sh

# initialize git submodule
git submodule update --init

# link dotfiles
for dotfile in .?*; do
    case ${dotfile} in
        ..)
            continue;;
        .git)
            continue;;
        .gitmodules)
            continue;;
        *)
            ln -Fis ${PWD}/${dotfile} ${HOME}
            ;;
    esac
done
