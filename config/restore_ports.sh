#!/usr/bin/env bash
# collect steps in https://trac.macports.org/wiki/Migration

set -Eeuo pipefail

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# update self
sudo port selfupdate

# clear existing install
sudo port -f uninstall installed
sudo rm -rf /opt/local/var/macports/build/*

# install ports from file
chmod u+x ./restore_ports.tcl
sudo ./restore_ports.tcl requested_ports.txt

# cleanup
sudo port -f clean --all installed

# restore 'requested' status
sudo port unsetrequested installed
xargs sudo port setrequested < requested_ports.txt

# activate requested ports
xargs sudo port activate < requested_ports.txt

  # bash-completion has the following notes:
  #   To use bash_completion, add the following lines at the end of your
  #   .bash_profile:
  #     if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  #         . /opt/local/etc/profile.d/bash_completion.sh
  #     fi

  #   The port bash-completion >=2.0 requires bash >=4.1; please make sure
  #   you are using /opt/local/bin/bash by changing the preferences of your
  #   terminal accordingly. If your version of bash is too old, the script
  #   above will not modify your shell environment and no extended completion
  #   will be available.
  # coreutils has the following notes:
  #   The tools provided by GNU coreutils are prefixed with the character 'g' by
  #   default to distinguish them from the BSD commands.
  #   For example, cp becomes gcp and ls becomes gls.

  #   If you want to use the GNU tools by default, add this directory to the
  #   front of your PATH environment variable:
  #       /opt/local/libexec/gnubin/
  # gawk has the following notes:
  #   readline support has been removed from gawk. If you need to run gawk
  #   interactively, install rlwrap:

  #   sudo port install rlwrap

  #   and run gawk using rlwrap:

  #   rlwrap gawk ...
  # grep has the following notes:
  #   This port previously installed itself without a g* prefix, thus
  #   overshadowing
  #   system binaries such as grep, fgrep, and egrep. The port is now changed so
  #   that
  #   it does install with a g* prefix, like other GNU ports. This means that
  #   you'll
  #   now find GNU grep at /opt/local/bin/ggrep. If you dislike typing ggrep, you
  #   can
  #   create a shell alias or you can add /opt/local/libexec/gnubin to your PATH,
  #   wherein non-g* prefixed symlinks are installed. In other words,
  #   /opt/local/libexec/gnubin contains GNU binaries without any prefix to the
  #   file-
  #   names, so you can type grep and get GNU grep just as before.
  # wget has the following notes:
  #   To customize wget, you can copy /opt/local/etc/wgetrc.sample to
  #   /opt/local/etc/wgetrc and then make changes.