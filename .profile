# Set $PATH and env vars for zsh and bash (only)

if [[ -z "$TERM" ]]; then
	export TERM='xterm-256color'
fi
export DISPLAY=:0 # need for XQuartz

# Set the default Less options.
export PAGER='less'
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
		export PATH=/usr/local/bin:/usr/local/sbin:$PATH
		# MacPorts PATH
		export PATH=/Library/TeX/texbin:/opt/local/bin:/opt/local/sbin:$PATH
		# setting conda PATH is shell-specific; done in .bashrc and .zshrc

		export BROWSER='open'
		export EDITOR='/usr/bin/nano'
		export VISUAL='subl'

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

# #####################
# old $PATH stuff

# # nvidia CUDA GPU drivers
# export PATH=/Developer/NVIDIA/CUDA-6.5/bin:$PATH
# export LD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.5/lib:$LD_LIBRARY_PATH
# export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.5/lib:$DYLD_LIBRARY_PATH
# export CUDA_ROOT=/Developer/NVIDIA/CUDA-6.5/

# add in /opt/lib so python finds MacPorts version of ALPS library -- copied from the alpspython script
# export PYTHONPATH=$PYTHONPATH:/opt/local/lib 

# export MPI_DIR=/opt/local/lib/openmpi
# export LD_LIBRARY_PATH=/opt/local/lib:/opt/local/lib/openmpi:$LD_LIBRARY_PATH
# export DYLD_LIBRARY_PATH=$LD_LIBRARY_PATH

# pip site.USER_BASE so as not to conflict with MacPorts
# export PYTHONUSERBASE=/Users/tsj/code/pip-user

# Theano/pylearn2
# export PYLEARN2_DATA_PATH=/Users/tsj/data/pylearn2-data
# export PYLEARN2_VIEWER_COMMAND="open -Wn"
# export PATH=/Users/tsj/code/pylearn2/pylearn2/scripts:$PATH

# lightTable and Julia
# export LT_HOME=/Users/tsj/code/LightTable/deploy
# export PATH=/Users/tsj/code/julia:$PATH

# DiagHam
# export PATH=/Users/tsj/code/DiagHam/FTI/src/Programs/FCI:/Users/tsj/code/DiagHam/FTI/src/Programs/FTI:$PATH

# #####################
