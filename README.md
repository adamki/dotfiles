![Screenshot](desktop.png)

## About
👋 This repo contains scripts to bootstrap my tools of choice and take care as much of the setup process as possible.  It currently supports `MacOS`, `Debian(Stable)`, `Manjaro(Arch`, `Fedora`.


This Installation script will:

  1. Install technologies listed [here](#technologies-included)
  2. Move all old configuration files into a directory called `~/dotfiles_old`
  3. Symlink new configuration files in `${HOME}` directory to `~/dotfiles`
  4. Will set your default shell to Zsh

## Getting Started
  ```
    $ git clone git@github.com:adamki/dotfiles.git $HOME/dotfiles
    $ cd $HOME/dotfiles
    $ chmod +x install/install.sh
    $ ./install/install.sh
  ```

## FAQs, DE's, and MISC
* Help setting up Mac OS can be found [here]('./docs/MACOS.md')
* Help setting up XFCE can be found [here]('./docs/XFCE.md')
* Check for true color compatibility [here]('./docs/true-colors.md')
* FAQs found [here]('./docs/FAQ.md')

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
| nvm       |    All    |
| node      |    All    |
| fzf       |    All    |
| rbenv     |    All    |
| bash-language-server      |    All    |
| vim-language-server      |    All    |
| bat       |    All but debian    |
| Fira      |    All    |
| xcape     |    linux   |
| xclip     |    linux   |
| i3-gaps   |    linux   |
| compton   |    linux   |
| rofi      |    linux   |
| feh       |    linux   |
| xfce4-power-manager       |    linux   |
| polybar       |    linux   |
| seahorse       |    linux   |
| firefox   |    MacOS   |
| slack     |    MacOS   |
| yabai     |    MacOS   |
| skhd      |    MacOS   |
| homebrew  |    MacOS   |
