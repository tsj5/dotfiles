# dotfiles
Configuration for personal use.

Methodology used here: https://www.atlassian.com/git/tutorials/dotfiles
Defines a `git-dotfile` shell alias wrapping `git`; repo files are cloned to `~/._dotfile_repo/`.

## TODO
- Cross-platform script for symlinking VSCode and sublime text files on Linux.

## How did we set up our shell, again?

Dotfiles here attempt to handle bash and zsh on MacOS (Darwin) and Linux (by testing `uname` in the body of each script). In both cases, init for interactive  login and non-login shells should be the same.

For both bash and zsh, 
- `.profile` sets `$PATH` and other key shell variables;
- `.aliases` sets aliases for interactive shells.

These are sourced from the following init scripts:

For bash, the only function of `.bash_profile` is to source `.bashrc`, which sources `.profile`, `.aliases`, and handles bash-specific init.

For zsh, `.zshenv` is called on init for all shells (interactive or not), so we source `.profile` there and use it to set `ZDOTDIR` to `.zsh`, where the rest of the zsh-specific files are. We don't have a `.zprofile`, because `.zshrc` is sourced whether we're a login shell or not. `.zshrc` does zsh-specific init for interactive shells and sources `.aliases`.

## Links
- Methodology used here: https://www.atlassian.com/git/tutorials/dotfiles
- Shell init [reference](https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/) for bash, zsh
- Mac OS login shell [details](https://unix.stackexchange.com/questions/119627/why-are-interactive-shells-on-osx-login-shells-by-default)
- bash vs. tcsh [differences](https://web.fe.up.pt/~jmcruz/etc/unix/sh-vs-csh.html)
- https://dotfiles.github.io
- https://github.com/webpro/awesome-dotfiles
- https://github.com/mathiasbynens/dotfiles
- VSCode [settings](https://code.visualstudio.com/docs/getstarted/settings#_settings-file-locations)
- sublime text [settings](http://docs.sublimetext.info/en/latest/customization/settings.html)
- macports [settings](https://guide.macports.org/chunked/installing.shell.html)
- Using GNU utilities by default on mac: https://apple.stackexchange.com/q/69223
