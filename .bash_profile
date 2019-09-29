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

## PLATFORM SPECIFIC
_uname_val=$(uname -s)
case "$_uname_val" in
	Darwin*)
		# https://iterm2.com/documentation-shell-integration.html
		_temp_path="~/.iterm2_shell_integration.bash"
		if [[ -e "$_temp_path" ]]
			source "$_temp_path"

			# pass current conda env to iterm2
			# https://www.iterm2.com/documentation-scripting-fundamentals.html#setting-user-defined-variables
			iterm2_print_user_vars () {
  				iterm2_set_user_var condaEnv "$CONDA_DEFAULT_ENV"
			}
		fi

		unset _temp_path
		;;
	Linux*)
		;;
	*)
		echo "Unrecognized platform ${_uname_val}"
		;;
esac