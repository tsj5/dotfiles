# Set $PATH and env vars for zsh and bash (only)

if [[ -z "$TERM" ]]; then
	export TERM='xterm-256color'
fi

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -s -w -X -z-3'

# # Set the Less input preprocessor.
# if (( $+commands[lesspipe.sh] )); then
# 	export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
# fi

## PLATFORM SPECIFIC
_uname_val=$( uname -s )
case "$_uname_val" in
	Darwin*)
		# MacPorts PATH
		export PATH=/opt/local/bin:/opt/local/sbin:$PATH

		# Conda PATH set by conda-init in .bash_profile and .zshrc
		
		export BROWSER='open'
		export EDITOR='/usr/bin/nano'
		export VISUAL='subl'
		export PAGER='less'

		if [[ -z "$LANG" ]]; then
		    export LANG='en_US.UTF-8'
		fi
		;;
	Linux*)
		;;
	*)
		echo "Unrecognized platform ${_uname_val}"
		;;
esac

