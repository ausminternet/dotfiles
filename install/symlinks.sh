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
	bash_functions
)

# Find all symlinks in $HOME which point to .dotfiles
find $HOME -maxdepth 1 -type l | while IFS= read -r lnk
do
  if readlink "$lnk" | grep -q '.dotfiles'
  then
    echo "remove old symlink for ${lnk}"
    rm "$lnk"
  fi
done

for FILE in ${FILES[@]}; do
  # Backup existing file
	if [ -f $HOME/.$FILE ]; then
		echo "Moving old .$FILE to .${FILE}-bkp"
		mv "$HOME/.$FILE" "$HOME/.${FILE}-bkp"
	fi

  # Create new symlink (duh)
	echo "create symlink for ${FILE}"
	ln -s .dotfiles/$FILE .$FILE
done
