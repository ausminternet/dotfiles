#!/bin/bash

PACKAGES=(tree git git-fow-avh hugo youtube-dl unrar node@6 wget bash-completion)

SCRIPT_PATH=$0:A
SCRIPT_DIR=`dirname $SCRIPT_PATH`

# Check if Homebrew is installed and install if not
BREW=`which brew`

if [[ -n "$BREW" ]]; then
	echo "Found Homebrew."
else
	# Ask first
	echo -n "Install Homebrew [Y/n]? "
	read INSTALL_BREW
	echo ""

	if [[ "$INSTALL_BREW" = "N" || "$INSTALL_BREW" = "n" ]]; then
		echo "Skipping Homebrew..."
	else
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
fi

# Install base packages
printf 'Base packages include: %s\n' "${PACKAGES[*]}"
echo -n "Install base packages via brew [Y/n]? "
read INSTALL_BASE

if [[ "$INSTALL_BASE" = "N" || "$INSTALL_BASE" = "n" ]]; then
	echo "Skipping base packages..."
else
	echo "Installing base packages..."

	for PACKAGE in $PACKAGES; do
		/usr/local/bin/brew install $PACKAGE
	done
fi

# Install symlinks
$SCRIPT_DIR/symlinks.sh

echo "Done."
