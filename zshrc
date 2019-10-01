# Set $DOTFILES
export DOTFILES="$HOME/dotfiles"

# IMPORTS
source $DOTFILES/aliases
source $DOTFILES/spaceship-config

# DEFAULTS
export VISUAL=nvim # make vim defaut editor
export EDITOR="$VISUAL"
export HISTSIZE=12000 # Store 10,000 history entries
export HISTCONTROL=erasedups # Don't store duplicates

# setup path to antigen ZSH pachage manager

# source $HOME/antigen.zsh
source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle colorize
antigen bundle colored-man-pages
antigen bundle paulirish/git-open
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship
antigen apply  # Tell Antigen that you're done.

# enable FZF fuzzy find and auto-complete
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# tell FZF to use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "(highlight -O ansi -l {} || cat {} || tree -C {}) 2> /dev/null | head -200" --bind "?:toggle-preview"'
export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up'

# sets up nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# set up rbenv
eval "$(rbenv init -)"

# eval $(keychain --eval --quiet id_ed25519 id_rsa ~/.ssh/id_ed25519.pub)

[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

neofetch | lolcat
