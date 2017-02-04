# My personal dotfiles

My personal dotfiles and themes to get quickly up and running on a new system.

## What's included?

- gitconfig
- global gitignore file
- gemrc
- bash config/exports/aliases
- Terminal.app Theme/Settings
- install scripts

## How does it work?
All the dotfiles are in your `~/.dotfile` folder and will be symlinked to their appropriate place.

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

- create `~/.gitconfig_local`:

  ```
  [user]
    name = John Doe
    email = john.doe@example.com
  ```
- Optional: create `~/.bash_local` to set machine specific settings.

## Terminal.app Theme
Got to `Settings > Profile > Import`, select `One Dark.terminal` and select as default.
