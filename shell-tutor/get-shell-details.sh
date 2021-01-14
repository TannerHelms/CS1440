# Purpose: detect OS and shell version numbers
#
# Usage: to detect current interactive shell this script must be sourced and NOT executed!
#
# . ./get-shell-details.sh

# Decide whether script was sourced/executed from https://stackoverflow.com/a/28776166
SOURCED=0
if [ -n "$ZSH_EVAL_CONTEXT" ]; then 
    case $ZSH_EVAL_CONTEXT in *:file) SOURCED=1;; esac
elif [ -n "$KSH_VERSION" ]; then
    [ "$(cd $(dirname -- $0) && pwd -P)/$(basename -- $0)" != "$(cd $(dirname -- ${.sh.file}) && pwd -P)/$(basename -- ${.sh.file})" ] && SOURCED=1
elif [ -n "$BASH_VERSION" ]; then
    (return 0 2>/dev/null) && SOURCED=1 
else # All other shells: examine $0 for known shell binary filenames
    # Detects `sh` and `dash`; add additional shell filenames as needed.
    case ${0##*/} in sh|dash) SOURCED=1;; esac
fi

if [ $SOURCED -eq 0 ]; then
    echo "Don't execute this file - source it!"
    echo ". ./get-shell-details.sh"
    exit 1
fi


uname -a
echo
echo     "SHELL          = $SHELL"
if [ -n "$ZSH_NAME" ]; then
    echo "ZSH_NAME       = $ZSH_NAME"
    echo "ZSH_VERSION    = $ZSH_VERSION"
    echo "ZSH_PATCHLEVEL = $ZSH_PATCHLEVEL"
elif [ -n "$BASH_VERSION" ]; then
    echo "BASH_VERSION   = $BASH_VERSION"
    echo "BASH_VERSINFO  = ${BASH_VERSINFO[@]}"
elif [ -n "$KSH_VERSION" ]; then
    echo "KSH_VERSION    = $KSH_VERSION"
else
    echo Unknown shell $SHELL
fi
