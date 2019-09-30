
source_if_exists () {
	[[ -e "$1" ]] && source "$1"
}

source_if_exists "${HOME}/.profile"    # load generic profile settings
# source_if_exists "${HOME}/.bashrc"     # load aliases etc.

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

## PLATFORM SPECIFIC
_uname_val=$( uname -s )
case "$_uname_val" in
	Darwin*)
		# bash-completion port installed through macports
		source_if_exists /opt/local/etc/profile.d/bash_completion.sh

		# https://iterm2.com/documentation-shell-integration.html
		_temp_path="${HOME}/.iterm2_shell_integration.bash"
		if [[ -e "$_temp_path" ]]; then
			source "$_temp_path"

			# pass current conda env to iterm2
			# https://www.iterm2.com/documentation-scripting-fundamentals.html#setting-user-defined-variables
			# https://www.saulshanabrook.com/conda-environment-in-iterm2-status-bar
			iterm2_print_user_vars () {
  				iterm2_set_user_var condaEnv "${CONDA_DEFAULT_ENV}"
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

source_if_exists "${HOME}/.git-completion.bash"
source_if_exists "${HOME}/.aliases"