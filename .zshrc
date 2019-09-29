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

## PLATFORM SPECIFIC
_uname_val=$(uname -s)
case "$_uname_val" in
	Darwin*)
		# https://iterm2.com/documentation-shell-integration.html
		_temp_path="~/.iterm2_shell_integration.zsh"
		if [[ -e "$_temp_path" ]]; then
			source "$_temp_path"

			# pass current conda env to iterm2
			# https://www.iterm2.com/documentation-scripting-fundamentals.html#setting-user-defined-variables
			iterm2_print_user_vars() {
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

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit # needed?

#zmodload zsh/terminfo
#if [[ "${terminfo[kcuu1]}" != "" ]]; then
#    bindkey "${terminfo[kcuu1]}" up-line-or-search
#    bindkey "${terminfo[kcud1]}" down-line-or-search
#fi

bindkey -e

