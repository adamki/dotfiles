# DEFAULTS
export VISUAL=nvim # make vim defaut editor
export EDITOR="$VISUAL"
export HISTSIZE=20000 # Store 10,000 history entries
export HISTCONTROL=erasedups # Don't store duplicates

# Set $DOTFILES VAR
export DOTFILES="$HOME/dotfiles"


# setup path to antigen ZSH pachage manager
case `uname` in
  Darwin)
    source /opt/homebrew/share/antigen/antigen.zsh
  ;;
  Linux)
    source $HOME/antigen.zsh
    # eval $(keychain --eval --quiet id_ed25519 id_rsa ~/.ssh/id_ed25519.pub)
  ;;
esac

antigen use oh-my-zsh
antigen bundle colorize
antigen bundle colored-man-pages
antigen bundle paulirish/git-open
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply  # Tell Antigen that you're done.

# IMPORTS
source $DOTFILES/aliases

# enable FZF fuzzy find and auto-complete
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export AWS_PROFILE=brightloom-cgp

# tell FZF to use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden --glob ""'
export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always {}"'
export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up,?:toggle-preview --border'

# sets up nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add ARDUINO_PATH variable
export ARDUINO_PATH=/usr/local/arduino
# sets up rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
# sets up PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/bin:$PATH"
# BREW
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

# launch starship prompt
eval "$(starship init zsh)"

eval "$(pyenv init --path)"

export PATH="$HOME/.poetry/bin:$PATH"
