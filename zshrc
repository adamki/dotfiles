# Path to your oh-my-zsh installation.
export ZSH=/Users/$USER/.oh-my-zsh

# setup NVM directory
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

ZSH_THEME="spaceship"
HYPHEN_INSENSITIVE="true"

plugins=(osx node)

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export PATH="$PATH:/Users/$USER/bin:/usr/local/bin:/Users/$USER/bin:/usr/local/bin:/Users/$USER/bin:/usr/local/bin:/Users/$USER/bin:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/local/bin:/opt/local/sbin:/usr/X11/bin"

# put rustup and cargo in runtime path
export PATH="$HOME/.cargo/bin:$PATH"
export DOTFILES="/Users/$USER/adams-dotfiles"

source $ZSH/oh-my-zsh.sh
source $DOTFILES/aliases
source $DOTFILES/custom-spaceship-prompt

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# make vim defaut editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Store 10,000 history entries
export HISTSIZE=10000
# Don't store duplicates
export HISTCONTROL=erasedups

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

function weather() {
  curl -4 http://wttr.in/$1
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# load RBENV automatically
eval "$(rbenv init -)"
