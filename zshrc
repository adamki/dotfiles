# Set $DOTFILES
export DOTFILES="/Users/$USER/adams-dotfiles"

# IMPORTS
source $DOTFILES/aliases
source $DOTFILES/spaceship-config

# DEFAULTS
export VISUAL=nvim # make vim defaut editor
export EDITOR="$VISUAL"
export HISTSIZE=12000 # Store 10,000 history entries
export HISTCONTROL=erasedups # Don't store duplicates

# setup path to antigen ZSH pachage manager
source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship
antigen apply  # Tell Antigen that you're done.

# enable FZF fuzzy find and auto-complete
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# tell FZF to use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_OPTS='--preview "(highlight -O ansi -l {} || cat {} || tree -C {}) 2> /dev/null | head -200" --bind "?:toggle-preview"'
export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up'

# handles TMUX pathing issue(s): https://github.com/creationix/nvm/issues/1880
if [ -f /etc/profile ]; then
  PATH=""
  source /etc/profile
fi

# Setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Setup PATH
export PATH="/usr/local/bin:$PATH"
# Setup RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# Setup PIP
USER_BASE_PATH=$(python -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin
# Setup GoLang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export PATH="$PATH:/Users/$USER/bin:/usr/local/bin:/Users/$USER/bin:/usr/local/bin:/Users/$USER/bin:/usr/local/bin:/Users/$USER/bin:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/local/bin:/opt/local/sbin:/usr/X11/bin"
# Setup Rust
export PATH="$HOME/.cargo/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/adamjensen/.nvm/versions/node/v6.11.5/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/adamjensen/.nvm/versions/node/v6.11.5/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/adamjensen/.nvm/versions/node/v6.11.5/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/adamjensen/.nvm/versions/node/v6.11.5/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
