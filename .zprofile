#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='subl'
export VISUAL='subl'
export PAGER='less'

if [[ -z "$TERM" ]]; then
  export TERM='xterm-256color'
fi

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

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

# nvidia CUDA GPU drivers
export PATH=/Developer/NVIDIA/CUDA-6.5/bin:$PATH
export LD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.5/lib:$LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.5/lib:$DYLD_LIBRARY_PATH
export CUDA_ROOT=/Developer/NVIDIA/CUDA-6.5/

# MacPorts PATH
export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/lib/openmpi/bin:$PATH

# Anaconda
export PATH=/Users/tsj/anaconda/bin:$PATH

##### unused
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
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

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

