#!/bin/zsh

SCRIPT_PATH=$0:A
SCRIPT_DIR=`dirname $SCRIPT_PATH`


autoload -U colors && colors

WARNING="$fg[blue]*$reset_color"
STATUS="$fg[green]*$reset_color"
ERROR="$fg[red]*$reset_color"

# Install symlinks
$SCRIPT_DIR/symlinks.sh

# Install prezto
$SCRIPT_DIR/zprezto.sh

echo "${STATUS} Done."
