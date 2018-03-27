#!/bin/bash

BREW_PACKAGES=(
  tree
  git
  git-flow-avh
  youtube-dl
  unrar
  node@8
  wget
  bash-completion
)

# Check if Homebrew is installed and install if not
BREW_INSTALLED="false"

BREW=`which brew`

if [[ -n "$BREW" ]]; then
  echo "Found Homebrew."
  BREW_INSTALLED="true"
else
  # Ask first
  echo -n "Install Homebrew [Y/n]? "
  read INSTALL_BREW
  echo ""

  if [[ "$INSTALL_BREW" = "N" || "$INSTALL_BREW" = "n" ]]; then
    echo "Skipping Homebrew..."
  else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    BREW_INSTALLED="true"
  fi
fi

if [ "$BREW_INSTALLED" = "true" ] ; then
  # Install base packages
  printf 'Base packages include: %s\n' "${BREW_PACKAGES[*]}"
  echo -n "Install base packages via brew [Y/n]? "
  read INSTALL_BASE

  if [[ "$INSTALL_BASE" = "N" || "$INSTALL_BASE" = "n" ]]; then
    echo "Skipping base packages..."
  else
    echo "Installing base packages..."
    /usr/local/bin/brew install ${BREW_PACKAGES[@]}
  fi
fi
