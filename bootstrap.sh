#!/bin/sh

# initialize git submodule
if [ -x `which git` ]; then
    git submodule update --init
else
    echo '[warn] can not setup submodules, please install git'
fi

# link bin
if [ ! -d ${HOME}/bin ]; then
    mkdir ${HOME}/bin
fi
for binfile in bin/*; do
    case ${binfile} in
        *)
            ln -snf ${PWD}/${binfile} ${HOME}/${binfile}
            ;;
    esac
done

# link dotfiles
for dotfile in _?*; do
    case ${dotfile} in
        *)
            ln -snf ${PWD}/${dotfile} ${HOME}/${dotfile/_/.}
            ;;
    esac
done
