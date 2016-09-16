#!/bin/zsh

PACKAGES=(tree imagemagick git tmux unrar zsh zsh-completions node wget diff-so-fancy thefuck)

SCRIPT_PATH=$0:A
SCRIPT_DIR=`dirname $SCRIPT_PATH`

# Configure Safari to not only search beginnings of words
defaults write /Library/Preferences/com.apple.Safari FindOnPageMatchesWordStartsOnly -bool FALSE

autoload -U colors && colors

WARNING="$fg[blue]*$reset_color"
STATUS="$fg[green]*$reset_color"
ERROR="$fg[red]*$reset_color"

# Check if Homebrew is installed
BREW=`which brew`

if [[ -n "$BREW" ]]; then
	echo "${STATUS} Found Homebrew."
else
	# Ask first
	echo -n "Install Homebrew [Y/n]? "
	read INSTALL_BREW
	echo ""

	if [[ "$INSTALL_BREW" = "N" || "$INSTALL_BREW" = "n" ]]; then
		echo "${WARNING} Skipping Homebrew..."
	else
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
fi

# Install base packages
echo "Base packages include: ${PACKAGES}"
echo -n "Install base packages via brew [Y/n]? "
read INSTALL_BASE

if [[ "$INSTALL_BASE" = "N" || "$INSTALL_BASE" = "n" ]]; then
	echo "${WARNING} Skipping base packages..."
else
	echo "${STATUS} Installing base packages..."

	for PACKAGE in $PACKAGES; do
		/usr/local/bin/brew install $PACKAGE
	done
fi

# Install symlinks
$SCRIPT_DIR/symlinks.sh

# Install prezto
$SCRIPT_DIR/zprezto.sh

echo "${STATUS} Done."
