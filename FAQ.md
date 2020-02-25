#### How do I setup Neovim Providers?

* Ruby provider: `gem install neovim`
* Node Provider: `npm install -g neovim`
* Python2 provider: `python2 -m pip install --user --upgrade pynvim`

    If your system doesn't have pip2:
    * Ubuntu/Debian: `sudo apt-get install python2-pip`
    * Manjaro: `sudo pacman -S python2-pip`
    * MacOS:  `brew install python2`

* Python3 provider: `python3 -m pip install --user --upgrade pynvim`

    If your system doesn't have pip3:
    * Ubuntu/Debian: `sudo apt-get install python3-pip`
    * Manjaro: `sudo pacman -S python-pip`
    * MacOS:  `brew install python3`

Try running `:checkhealth` to confirm that all providers are found by Neovim
---
