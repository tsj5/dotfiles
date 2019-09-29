# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

source_from_bash () {
	# POSIX compatiability mode to share scripts between zsh and bash.
	# see https://unix.stackexchange.com/a/3449
  	emulate -LR sh
  	. "$@"
}

source_from_bash ~/.profile

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
#path=(
#  /usr/local/{bin,sbin}
#  $path
#)


# #####################

##### unused

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
#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

