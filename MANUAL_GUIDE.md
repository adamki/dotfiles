### These are my Dotfiles.
___

## Dependencies

## General Sanity/First items

#### Re-Map CapsLock to control/ESC.

- Install `xcape`.

- Depending on your DE, this will be slightly different.

- On `Mac`, Get started with and `Karibiner-elements`
```
On Mac, this is done by adding a 'complex modification' called 'Change Caps_Lock to control if pressed with other keys, to escape if pressed alone.

```

- On `Gnome 3.x`, place the following script in `./profile

- On `XFCE4`, place the following script in a file and use `Settings > Session and Startup > Application Autostart` tasks to call the file. Note: don't forget to make the file executable first

```
# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps

# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'
```

#### Misc
I like to install some of the following mono-spaced fonts:

* Operator Mono
* Dank Mono
* Hack
* Fira Code

For system fonts, these are good starters:

* San Francisco ?
* Overpass

---

## Shell and Shell tools

#### Install kitty terminal
* Most Distros/MacOS: `curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin `
* Manjaro: install via pamac

Now to install some of the following dependencies:
* ZSH
* antigen for ZSH
* neofetch
* lolcat

#### Install zsh
* Ubuntu/Debian: `sudo apt-get update && sudo apt-get -y install zsh`

* Manjaro: `sudo pacman -S zsh`

* MacOS: `brew install zsh`

#### Set zsh as default:

* Verify that zsh is installed: `zsh --version`
`chsh -s $(which zsh)`

*_At this point, you should verify that ZSH is the default shell_. `echo $SHELL` should return `/bin/zsh` of something similar

#### Install Antigen
* Ubuntu/Debian: `apt-get install zsh-antigen`

* Manjaro: `curl -L git.io/antigen > antigen.zsh`

* MacOS: `brew install antigen`

#### Install neofetch

* Ubuntu/Debian: `sudo apt-get install neofetch`

* Manjaro: `sudo pacman -S neofetch`

* MacOS: `brew install neofetch`

#### Install lolcat
* Ubuntu/Debian: `sudo gem install lolcat`

* Manjaro: `sudo gem install lolcat`

* MacOS: `sudo gem install lolcat`

#### Install ripgrep
* Debian Sid/MXLinux/
```
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb
sudo dpkg -i ripgrep_11.0.1_amd64.deb

```
* Ubuntu: `sudo apt-get install ripgrep`

* Manjaro: `sudo pacman -S ripgrep`

* MacOS: `brew install ripgrep`

##### Install fzf(Optional)
* Manjaro: `sudo pacman -S fzf`
__This can be instaled via the fzf.vim plugin__
* MacOS: `brew install fzf` && `/usr/local/opt/fzf/install`
* Other:

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

#### Install tmux
* Ubuntu/Debian: `sudo apt-get install tmux`

* Manjaro: `sudo pacman -S tmux`

* MacOS: `brew install tmux`

#### Install tpm

All distros: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

#### Set/check true colors

```
awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s s s s s s s s s s s s s s s s;
    for (colnum = 0; colnum<256; colnum++) {
        r = 255-(colnum*255/255);
        g = (colnum*510/255);
        b = (colnum*255/255);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'
```

#### Install Misc Shell tools
* Ranger
* htop
* gotop
---

## Languages (these should happen BEFORE neovim as well)
#### Install nvm, node, and npm

* For all OS's:
```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | zsh
nvm --version  # check for proper install
nvm install node
```

This `curl` script will install/update your system's NVM. It also appends an autostart script to the end of your `.bashrc`. Normally, you'd need to manually include this in your `.zshrc`, but it is already included in this repo's `.zshrc`

#### Install rbenv and then ruby

* Linux
```
wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | zsh
rbenv install [arg]
rbenv global [arg]
```

* MacOS: `brew install rbenv`

NOTE: `rbenv` setup has been problematic. It is best to follow the directions in the documentation and confirm that it is setup using the `rbenv-doctor` script here:
NOTE: MacOS ships with a system install of Ruby. It is best to install an updated/supported global version (and set this version as the system default) that to avoid conflicts before proceeding


https://github.com/rbenv/rbenv#installation

#### Install Gem

* Ubuntu/Debian: `sudo apt-get install rubygems`
* Manjaro: `pacman -S rubygems`
* MacOS: as long as you've used rbenv to install a local ruby version, no action is needed

and then: `gem install bundler`

---
## Neovim
#### Installation

* Manjaro: `sudo pacman -S neovim`
* Ubuntu/Debian(I've had the best luck using flatpak):
```
flatpak install flathub io.neovim.nvim
flatpak run io.neovim.nvim
```
* MacOS: I've not had success using the pre-built `brew` package as it hasn't been updated imo.

---
## Neovim Dependencies
#### Plug Manager
* All *nix OS's:
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Neovim Providers

* Ruby provider: `gem install neovim`

* Node Provider: `npm install -g neovim`

* Python2 provider: `python2 -m pip install --user --upgrade pynvim`

    If your system doesn't have pip2:
    * Ubuntu/Debian: `sudo apt-get install python2-pip`
    * Manjaro: `sudo pacman -S python2-pip`
    * MacOS:  `brew install pytnon2`

* Python3 provider: `python3 -m pip install --user --upgrade pynvim`

    If your system doesn't have pip3:

    * Ubuntu/Debian: `sudo apt-get install python3-pip`
    * Manjaro: `sudo pacman -S python-pip`

* _It is best to run :checkhealth and resolve all missing requirements before proceeding_

---

##### Cloning down dotfiles:
* `git clone git@github.com:adamki/dotfiles.git`
* `cd ~/dotfiles`

NOTE: There are ** TWO ** similar files for symlinking. Make sure to choose the OS Specific one

* `chmod +x makesymlinks_mac.sh` || `chmod +x makesymlinks_linux.sh`
* `./makesymlinks_mac.sh` || `./makesymlinks_linux.sh`

This script executes the following:
* dumps old dotfiles into a newly created dir called `dotfiles_old`

It is now recommended that you restart your terminal completely.

## Other Things to do:
* add SSH keys to local keyring
