#!/bin/bash

cd $HOME

FILES=(
	gitconfig
	gemrc
	gitignore_global
	bash_profile
	bash_prompt
	bashrc
	bash_export
	bash_aliases
)

for FILE in ${FILES[@]}; do
  # Delete existing symlink
	if [ -h $HOME/.$FILE ]; then
		rm $HOME/.$FILE
	fi

  # Backup existing file
	if [ -f $HOME/.$FILE ]; then
		echo "Moving old .$FILE to .${FILE}-bkp"
		mv "$HOME/.$FILE" "$HOME/.${FILE}-bkp"
	fi

  # Create new symlink (duh)
	echo "create symlink for ${FILE}"
	ln -s .dotfiles/$FILE .$FILE
done
