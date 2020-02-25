![Screenshot](desktop.png)

## About
👋 This repo contains scripts to bootstrap my tools of choice and take care as much of the setup process as possible.

## Getting Started
_**Pre-Requisites**_: Set up your `.ssh` keys
```
$ git clone git@github.com:adamki/dotfiles.git $HOME/dotfiles
$ cd $HOME/dotfiles
$ chmod +x install/install.sh
```

This Installation script will:
* Install technologies listed [here](#technologies-included)
* Move all old configuration files into a directory called `~/${USER}/dotfiles`
* Symlink new configuration files in `${HOME}` directory to `{USER}/dotfiles`
* Will set your default shell to Zsh

## Technologies included

| Software  |    OS      |
|-----------|------------|
| kitty     |    All    |
| Z Shell   |    All    |
| Ranger    |    All    |
| htop      |    All    |
| gotop     |    All    |
| Neovim    |    All    |
| vim-plug  |    All    |
| Antigen   |    All    |
| ripgrep   |    All    |
| pfetch    |    All    |
| lolcat    |    All    |
| bundler   |    All    |
| tpm       |    All    |
| nvm       |    All    |
| node      |    All    |
| fzf       |    All    |
| tmux      |    All    |
| rbenv     |    All    |
| python2   |    All    |
| bash-language-server      |    All    |
| vim-language-server      |    All    |
| Fira      |    All    |
| xcape     |    linux   |
| xclip     |    linux   |
| i3-gaps   |    linux   |
| compton   |    linux   |
| rofi      |    linux   |
| feh       |    linux   |
| firefox   |    MacOS   |
| slack     |    MacOS   |
| yabai     |    MacOS   |
| skhd      |    MacOS   |
| homebrew  |    MacOS   |
| bat       |    All    |

Bat is * not currently supported on debian stable. Please download(dpkg -i) the `.deb` file from the official [BAT Releases page](https://github.com/sharkdp/bat/releases)
