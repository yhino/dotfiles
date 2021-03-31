# anyenv
if type anyenv &>/dev/null; then
    ANYENV_HOME=${HOME}/.anyenv
    ANYENV_CACHE_HOME=${XDG_CACHE_HOME}/anyenv

    # if anyenv is installed by homebrew, make the `$HOME/.anyenv` directory
    [[ -d ${ANYENV_HOME} && -d ${ANYENV_CACHE_HOME} ]] || {
        mkdir -p ${ANYENV_HOME}
        mkdir -p ${ANYENV_CACHE_HOME}
    }

    path=(${HOME}/.anyenv/bin(N-/) ${path})
    [[ -f ${ANYENV_CACHE_HOME}/anyenv.cache ]] || {
        anyenv init - zsh > ${ANYENV_CACHE_HOME}/anyenv.cache
        zcompile ${ANYENV_CACHE_HOME}/anyenv.cache
    }
    source ${ANYENV_CACHE_HOME}/anyenv.cache
fi

