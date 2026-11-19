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
        _config)
            # to be processed later, at `link XDG_CONFIG_HOME` section
            continue
            ;;
        _ssh)
            # to be processed later, at `link ${HOME}/.ssh` section
            continue
            ;;
        *)
            ln -snf ${PWD}/${dotfile} ${HOME}/${dotfile/_/.}
            ;;
    esac
done

# link XDG_CONFIG_HOME
config_home="${XDG_CONFIG_HOME:-${HOME}/.config}"
mkdir -p "${config_home}" || exit 1
for file in _config/*; do
    config_source="${PWD}/${file}"
    config_target="${config_home}/$(basename "${file}")"
    case ${file} in
    "_config/karabiner")
        mkdir -p "${config_target}" || exit 1
        config_source="${config_source}/karabiner.json"
        config_target="${config_target}/karabiner.json"
        ;;
    "_config/herdr")
        mkdir -p "${config_target}" || exit 1
        config_source="${config_source}/config.toml"
        config_target="${config_target}/config.toml"
        ;;
    *)
        ;;
    esac
    ln -snf "${config_source}" "${config_target}"
done

# make ${HOME}/.ssh and ${HOME}/.ssh/conf.d
mkdir -p ${HOME}/.ssh/conf.d
# link ${HOME}/.ssh
for file in _ssh/*; do
    file_basename=$(basename ${file})
    case "${file_basename}" in
        conf.d)
            for config_file in _ssh/conf.d/*; do
                ln -snf ${PWD}/${config_file} ${HOME}/.ssh/conf.d/$(basename ${config_file})
            done
            ;;
        *)
            ln -snf ${PWD}/${file} ${HOME}/.ssh/${file_basename}
            ;;
    esac
done
