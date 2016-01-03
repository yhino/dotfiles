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
    case `basename ${binfile}` in
        ..)
            continue
            ;;
        *)
            ln -snf ${PWD}/${binfile} ${HOME}/${binfile}
            ;;
    esac
done

# link dotfiles
for dotfile in _?*; do
    case ${dotfile} in
        _ssh)
            if [ ! -d ${HOME}/${dotfile/_/.} ]; then
                mkdir -p ${HOME}/${dotfile/_/.}
            fi
            for file in ${dotfile}/*; do
                case `basename ${file}` in
                    ..)
                        continue
                        ;;
                    config)
                        if [ ! -f ${HOME}/${file/_/.} ]; then
                            ln -s ${PWD}/${file} ${HOME}/${file/_/.}
                        fi
                        ;;
                    *)
                        ln -snf ${PWD}/${file} ${HOME}/${file/_/.}
                        ;;
                esac
            done
            ;;
        *)
            ln -snf ${PWD}/${dotfile} ${HOME}/${dotfile/_/.}
            ;;
    esac
done
