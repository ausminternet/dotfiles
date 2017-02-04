#!/bin/zsh

SCRIPT_PATH=$0:A
SCRIPT_DIR=`dirname $SCRIPT_PATH`

# Install symlinks
$SCRIPT_DIR/symlinks.sh

echo "${STATUS} Done."
