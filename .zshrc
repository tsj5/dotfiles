#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
#zmodload zsh/terminfo
#if [[ "${terminfo[kcuu1]}" != "" ]]; then
#    bindkey "${terminfo[kcuu1]}" up-line-or-search
#    bindkey "${terminfo[kcud1]}" down-line-or-search
#fi

bindkey -e

# # Source Prezto.
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

# Customize to your needs...


# aliases
alias mathkernel=/Applications/Mathematica.app/Contents/MacOS/MathKernel


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tsj/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tsj/anaconda/etc/profile.d/conda.sh" ]; then
        . "/Users/tsj/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tsj/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

