[[ -e ~/.profile ]] && source ~/.profile    # load generic profile settings
# [[ -e ~/.bashrc  ]] && source ~/.bashrc     # load aliases etc.

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tsj/anaconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

source ~/.aliases

# bash-completion port installed through macports
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
	. /opt/local/etc/profile.d/bash_completion.sh
fi

source ~/.git-completion.bash