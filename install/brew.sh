#!/bin/bash

BREW_PACKAGES=(
	tree
	git
	git-fow-avh
	hugo
	youtube-dl
	unrar
	node@6
	wget
	bash-completion
)

BREW_CASK_PACKAGES=(
  1password
  dropbox
  itsycal
  spotify
  whatsapp
  cyberduck
  google-chrome
  mplayerx
  ynab
  firefox
  mamp
  prepros
  sourcetree
  atom
)

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
    BREW_INSTALLED = false
	else
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    BREW_INSTALLED = true
	fi
fi

if [ "$BREW_INSTALLED" = true ] ; then
  # Install base packages
  printf 'Base packages include: %s\n' "${BREW_PACKAGES[*]}"
  echo -n "Install base packages via brew [Y/n]? "
  read INSTALL_BASE

  if [[ "$INSTALL_BASE" = "N" || "$INSTALL_BASE" = "n" ]]; then
    echo "Skipping base packages..."
  else
    echo "Installing base packages..."

    for PACKAGE in $BREW_PACKAGES; do
      /usr/local/bin/brew install $PACKAGE
    done
  fi

  # Install brew cask packages
  printf 'Brew cask packages include: %s\n' "${BREW_CASK_PACKAGES[*]}"
  echo -n "Install cask packages via brew cask [Y/n]? "
  read INSTALL_CASK

  if [[ "$INSTALL_CASK" = "N" || "$INSTALL_CASK" = "n" ]]; then
    echo "Skipping brew cask packages..."
  else
		echo "activate casks..."
		brew tap caskroom/cask
    echo "Installing brew cask packages..."
    for PACKAGE in $BREW_CASK_PACKAGES; do
      /usr/local/bin/brew cask install $PACKAGE
    done
  fi
fi
