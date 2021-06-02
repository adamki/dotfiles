# DEFAULTS
export VISUAL=nvim # make vim defaut editor
export EDITOR="$VISUAL"
export HISTSIZE=20000 # Store 10,000 history entries
export HISTCONTROL=erasedups # Don't store duplicates

# Set $DOTFILES VAR
export DOTFILES="$HOME/dotfiles"

# IMPORTS
source $DOTFILES/aliases

# setup path to antigen ZSH pachage manager
case `uname` in
  Darwin)
    source /usr/local/share/antigen/antigen.zsh
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

# Peloton Work Related
# This will allow for shortened alias commands for ease of logging in to AWS using saml2aws
# https://pelotoncycle.atlassian.net/wiki/spaces/OW/pages/40593326182/Access+EKS+Clusters
export CWE_DEV=787201226158
export CWE_PROD=159653997934
export CWE_STAGE=214936853396
export CWE_INFRA=873230290044
export FORCE_MFA="Duo Push"
export AWS_REGION="us-east-1"

# print sys info
~/pfetch/pfetch

# enable FZF fuzzy find and auto-complete
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tell FZF to use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden --glob ""'
export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always {}"'
export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up,?:toggle-preview --border'

# launch starship prompt
eval "$(starship init zsh)"

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

eval "$(rbenv init -)"
eval "$(pyenv init --path)"

export PATH="$HOME/.poetry/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/adamki.jensen/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/adamki.jensen/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/adamki.jensen/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/adamki.jensen/google-cloud-sdk/completion.zsh.inc'; fi
