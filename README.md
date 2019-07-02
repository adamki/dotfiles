### These are my Dotfiles.
___

#### General Productivity tools:
* Slack - https://itunes.apple.com/us/app/slack/id803453959?mt=12
* MailSpring - https://getmailspring.com/download
* Spotify - https://www.spotify.com/us/download/other/
___

## Dependencies

## General Sanity/First items

#### Re-Map CapsLock to control/ESC.

- Install `xcape`.

- Depending on your DE, this will be slightly different.

- On `Mac`, Get started with `Karibiner` and `Karibiner-elements`

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
## Shell commandline tools
This sets up ZSH, antigen ZSH manager, and zsh-spaceship prompt, and neofetch for some fanciness

#### Install zsh
Ubuntu/Debian: `sudo apt-get update && sudo apt-get -y install zsh`

Manjaro: installed via pamac

#### Set zsh as default:

`chsh -s $(which zsh)`

*_At this point, you should verify that ZSH is the default shell_

#### Install Antigen
* Ubuntu/Debian: `apt-get install zsh-antigen`

* Manjaro: `curl -L git.io/antigen > antigen.zsh`

#### Install ufetch

* Ubuntu/Debian: `sudo apt-get install ufetch`

* Manjaro: `sudo pacman -S ufetch`

#### Install ripgrep
* Debian Sid/MXLinux/
```
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb
sudo dpkg -i ripgrep_11.0.1_amd64.deb

```
* Ubuntu: `sudo apt-get install ripgrep`

* Manjaro: `sudo pacman -S ripgrep`

##### Install fzf(Optional)
* Manjaro: `sudo pacman -S fzf`
__This can be instaled via the fzf.vim plugin__

* Other
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

#### Install tmux
* Ubuntu/Debian: `sudo apt-get install tmux`

* Manjaro: `sudo pacman -S tmux`

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

#### Install kitty terminal
* Most Distros: ` curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin `
* Manjaro: install via pamac

---

## Languages (these should happen BEFORE neovim as well)
#### Install nvm, node, and npm
```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | zsh
nvm --version  # check for proper install
nvm install node
```

This `curl` script will install/update your system's NVM. It also appends an autostart script to the end of your `.bashrc`. Normally, you'd need to manually include this in your `.zshrc`, but it is already included in this repo's `.zshrc`

#### Install rbenv and then ruby
```
wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | zsh
rbenv install [arg]
rbenv global [arg]
```

#### Install Gem

* Ubuntu/Debian: `sudo apt-get install rubygems`
* Manjaro: `pacman -S rubygems`

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

* Python3 provider: `python3 -m pip install --user --upgrade pynvim`

    If your system doesn't have pip3:

    * Ubuntu/Debian: `sudo apt-get install python3-pip`
    * Manjaro: `sudo pacman -S python-pip`

* _It is best to run :checkhealth and resolve all missing requirements before proceeding_

---

##### Cloning down dotfiles:
* `git clone git@github.com:adamki/dotfiles.git`
* `cd ~/dotfiles`
* `chmod +x makesymlinks.sh`
* `./makesymlinks.sh`

This script executes the following:
* dumps old dotfiles into a newly created dir called `dotfiles_old`
* installs ZSH
* sets ZSH as default shell
* symlinks the following:

  |~/.*                                 |~/dotfiles/*                                |
  |-------------------------------------|--------------------------------------------|
  | `~/.tmux.conf`                      | `~/dotfiles/tmux.conf`               |
  | `~/.vimrc`                          | `~/dotfiles/vimrc`                   |
  | `~/.zshrc`                          | `~/dotfiles/zshrc`                   |
  | `~/.config/nvim/init.vim`           | `~/dotfiles/config/nvim/init.vim`    |
  | `~/.config/nvim/fplugin/*`          | `~/dotfiles/config/fplugin/*`        |
  | `~/.config/alacritty/alacritty.yml` | `~/dotfiles/alacritty/alacritty.yml` |

It is now recommended that you restart your terminal completely.

## Other Things to do:
* add SSH keys to local keyring
*
