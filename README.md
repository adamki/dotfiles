### These are my Dotfiles.

This setup involves the following technologies:
* Alacritty - https://github.com/jwilm/alacritty
* neovim - https://neovim.io/
* tmux - https://github.com/tmux/tmux/wiki
* Karabiner Elementts - https://github.com/tekezo/Karabiner-Elements
* ZSH - https://github.com/robbyrussell/oh-my-zsh

Lets get started with building my dev environment. This assums you are using Mac OS.
___

##### Brew
Brew manages packages for Mac OS users. Installation instructions here: /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

##### Alacritty
Alacritty claims to be the fastest terminal emulator. It prioritizes simplicity over being a feature rich terminal such as iTerm 2.

Installation is outlined here: https://github.com/jwilm/alacritty#manual-installation

___

##### cloning down the dot files
*__ATTN__* Before proceedng, you should have the following dependencies resolved:
* Operator Mono (Light, Book, & Light Italic) should be stored in your Mac OS FontBook
* You should have True colors enabled in your terminal
* tmux should be installed (brew install tmux)

Ok, now lets gets started

* `git clone git@github.com:adamki/adams-dotfiles.git`
*  `cd adams-dotfiles`
*  `chmod +x makesymlinks.sh`
*  `./makesymlinks.sh`

This script executes the following:
* dumps old dotfiles into a newly created dir called `dotfiles_old`
* installs ZSH
* sets ZSH as default shell
* symlinks the following:
    * `~/.config/nvim/init.vim` -> `~/adams-dotfiles/config/nvim/init.vim`
    * `~/.config/alacritty/alacritty.yml` -> `~/adams-dotfiles/alacritty/alacritty.yml`
    * `~/.tmux.conf` -> `/Users/A075140/adams-dotfiles/tmux.conf`
    * `~/.tmuxlinesnapshot.conf` -> `/Users/A075140/adams-dotfiles/tmuxlinesnapshot.conf`
    * `~/aliases` -> `/Users/A075140/adams-dotfiles/aliases`

It is now recommended that you restart your terminal completely

___


##### Plug manager
I use `Plug` to manage vim dependencies. Be sure to install it first

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
___

### Enable True Colors
checking for True Colors:
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

* create a file called `xterm-256color-italic.terminfo` in your home dir.
* compile the color path by running `tic xterm-256color-italic.terminfo`.

```
# A xterm-256color based TERMINFO that adds the escape sequences for italic.
xterm-256color-italic|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color,
```
