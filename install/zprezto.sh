#!/bin/zsh

cd $HOME

WARNING="$fg[blue]*$reset_color"
STATUS="$fg[green]*$reset_color"
ERROR="$fg[red]*$reset_color"

# Delete existing symlink
if [ -h $HOME/.zprezto ]; then
  rm $HOME/.zprezto
fi

# Backup existing file
if [ -d $HOME/.zprezto ]; then
  echo "${WARNING} Delete old backup"
  rm -rf "$HOME/.zprezto-bkp"

  echo "${WARNING} Moving old .zprezto to .zprezto-bkp"
  mv "$HOME/.zprezto" "$HOME/.zprezto-bkp"
fi

# install zprezto
echo "${STATUS} Installing zprezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# install pure prompt
# Backup existing prompt
if [ -d $HOME/.pure-prompt ]; then
  echo "${WARNING} Delete old backup"
  rm -rf "$HOME/.pure-prompt-bkp"

  echo "${WARNING} Moving old .pure-prompt to .pure-prompt-bkp"
  mv "$HOME/.pure-prompt" "$HOME/.pure-prompt-bkp"
fi

echo "${STATUS} Installing pure-prompt"
git clone https://github.com/sindresorhus/pure.git "$HOME/.pure-prompt"

if [ ! -d $HOME/.zfunctions ]; then
  mkdir "$HOME/.zfunctions"
fi

ln -s "$HOME/.pure-prompt/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
ln -s "$HOME/.pure-prompt/async.zsh" "$HOME/.zfunctions/async"

# make symlinks
echo "${STATUS} Create symlinks"
FILES=(zlogin zlogout zpreztorc zprofile zshenv zshrc)
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
  echo "${STATUS} Create symlink for ${FILE}"
	ln -s .dotfiles/zprezto/$FILE .$FILE
done
