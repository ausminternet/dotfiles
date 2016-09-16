#!/bin/bash

cd $HOME

FILES=(gitconfig gemrc gitignore_global)
for FILE in ${FILES[@]}; do
  # Delete existing symlink
	if [ -h $HOME/.$FILE ]; then
		rm $HOME/.$FILE
	fi

  # Backup existing file
	if [ -f $HOME/.$FILE ]; then
		echo "${WARNING} Moving old .$FILE to .${FILE}-bkp"
		mv "$HOME/.$FILE" "$HOME/.${FILE}-bkp"
	fi

  # Create new symlink (duh)
	echo "create symlink for ${FILE}"
	ln -s .dotfiles/$FILE .$FILE
done
