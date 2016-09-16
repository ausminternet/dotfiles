# My personal dotfiles

My personal dotfiles and themes to get quickly up and running on a new system.

## What's included?

- gitconfig
- global gitignore file
- gemrc
- [prezto/zsh](https://github.com/sorin-ionescu/prezto) config
- Terminal.app Theme/Settings
- install scripts

## How does it work?
All the dotfiles are in your `~/.dotfile` folder and will be symlinked to their appropriate place.

## Preinstall

### Linux
zsh and zsh-completions need to be installed manually.

### OSX
Nothing.

## Usage

```
git clone git@github.com:ausminternet/dotfiles.git ~/.dotfiles
cd ~/.dotfiles/install/

# on OSX:
./osx.sh

# on Linux:
./linux.sh
```

## Postinstall

- Default-Shell needs to be set to zsh.
- user and mail need to be added to the gitconfig.

## Terminal.app Theme
Got to `Settings > Profile > Import`, select `Snazzy.terminal` and select as default.

## Known Problems
 There can be a problem with installing the [pure-prompt](https://github.com/sindresorhus/pure):
 ```
 * Installing pure-prompt

> pure-prompt@1.4.0 postinstall /opt/home/www/.npm-packages/lib/node_modules/pure-prompt
> dest=/usr/local/share/zsh/site-functions; mkdir -p $dest && ln -sf "$PWD/pure.zsh" $dest/prompt_pure_setup && ln -sf "$PWD/async.zsh" $dest/async || echo 'Could not automagically symlink the prompt. Check out the readme on how to do it manually: https://github.com/sindresorhus/pure#manually'

ln: Symbolische Verknüpfung „/usr/local/share/zsh/site-functions/prompt_pure_setup“ konnte nicht angelegt werden: Keine Berechtigung
Could not automagically symlink the prompt. Check out the readme on how to do it manually: https://github.com/sindresorhus/pure#manually
 ```

 Please check out https://github.com/sindresorhus/pure#manually and add the missing symlinks manually.
