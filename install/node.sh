#!/bin/bash

NODE_MODULES="http-server node-sass"

# Check if Homebrew is installed and install if not
NPM=`which npm`

if [[ -n "$BREW" ]]; then
	echo "Node installed."
else
	# Ask first
	echo -n "Install node@6 via Homebrew [Y/n]? "
	read INSTALL_NODE

	if [[ "$INSTALL_NPM" = "N" || "$INSTALL_NPM" = "n" ]]; then
		echo "Skipping node@6..."
    NODE_INSTALLED=false
	else
		/usr/local/bin/brew install node@6
    NODE_INSTALLED=true
	fi
fi

if [ "$NODE_INSTALLED" = true ] ; then
  # Install global node modules
  printf 'Global node modules include: %s\n' "${NODE_MODULES[*]}"
  echo -n "Install global node modules [Y/n]? "
  read INSTALL_NODE_MODULES

  if [[ "$INSTALL_NODE_MODULES" = "N" || "$INSTALL_NODE_MODULES" = "n" ]]; then
    echo "Skipping global node modules..."
  else
    echo "Installing global node modules..."

    /usr/local/bin/npm install $NODE_MODULES -g
  fi
fi
