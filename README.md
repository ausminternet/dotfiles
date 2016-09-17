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

- set default shell to `zsh`
- create `~/.gitconfig_local`:
  ```
  [user]
    name = John Doe
    email = john.doe@example.com
  ```
- Linux only: install https://github.com/so-fancy/diff-so-fancy

## Terminal.app Theme
Got to `Settings > Profile > Import`, select `Snazzy.terminal` and select as default.
