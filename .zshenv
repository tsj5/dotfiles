# Commands executed for *all* zsh invocations 
# (login/non-login, interactive/script)

source_from_bash () {
	# POSIX compatiability mode to share scripts between zsh and bash.
	# see https://unix.stackexchange.com/a/3449
  	emulate -LR sh
  	. "$@"
}
source_from_bash "${HOME}/.profile"
# avoid cluttering up home directory
export ZDOTDIR="${HOME}/.zsh"
