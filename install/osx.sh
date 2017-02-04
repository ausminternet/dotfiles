#!/bin/bash

SCRIPT_PATH=$0:A
SCRIPT_DIR=`dirname $SCRIPT_PATH`

# Install brew packages
$SCRIPT_DIR/brew.sh

# Install global npm packages
$SCRIPT_DIR/node.sh

# Install symlinks
$SCRIPT_DIR/symlinks.sh

echo "Done."
