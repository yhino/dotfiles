#!/bin/bash

# initialize git submodule
if type git > /dev/null 2>&1; then
    git submodule update --init
else
    echo '[warn] can not setup submodules, please install git'
fi

# create dirs
dirs=("${HOME}/bin" ${XDG_CONFIG_HOME})
for dir in ${dirs[@]}; do
    if [ "x${dir}" = "x" ]; then
        continue
    fi

    if [ ! -d ${dir} ]; then
        mkdir -p ${dir}
    fi
done

# link bin
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

# link XDG_CONFIG_HOME
if [ "x${XDG_CONFIG_HOME}" != "x" ]; then
    for dotfile in _?*; do
        case ${dotfile} in
            _vim)
                ln -snf ${PWD}/${dotfile} ${XDG_CONFIG_HOME}/nvim
                ;;
        esac
    done
fi
