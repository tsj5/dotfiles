# Executes commands at the start of an interactive session.

source_from_bash () {
	# POSIX compatiability mode to share scripts between zsh and bash.
	# see https://unix.stackexchange.com/a/3449
  	emulate -LR sh
  	. "$@"
}

# # Source Prezto.
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tsj/anaconda2/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tsj/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/Users/tsj/anaconda2/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tsj/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source_from_bash ~/.aliases

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

#zmodload zsh/terminfo
#if [[ "${terminfo[kcuu1]}" != "" ]]; then
#    bindkey "${terminfo[kcuu1]}" up-line-or-search
#    bindkey "${terminfo[kcud1]}" down-line-or-search
#fi

bindkey -e