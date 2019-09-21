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