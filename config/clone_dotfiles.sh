#!/usr/bin/env bash
# Script to clone dotfile repo into new home directory.
# https://www.atlassian.com/git/tutorials/dotfiles

git clone --bare https://github.com/tsj5/dotfiles.git $HOME/._dotfile_repo
function git-dotfile {
	usr/bin/env git --git-dir="$HOME/._dotfile_repo/" --work-tree="$HOME" $@
}
mkdir -p ._dotfile_repo_bak
git-dotfile checkout
if [ $? = 0 ]; then
	echo "Checked out config.";
else
    echo "Backing up pre-existing dot files.";
    git-dotfile checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} ._dotfile_repo_bak/{}
fi;
git-dotfile checkout
git-dotfile config status.showUntrackedFiles no