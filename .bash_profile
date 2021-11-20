# Sourced by interactive login bash 
source_if_exists () {
	[[ -e "$1" ]] && source "$1"
}
source_if_exists "${HOME}/.bashrc"    # load generic profile settings
