# DEFAULTS
export VISUAL=nvim # make vim defaut editor
export EDITOR="$VISUAL"
export HISTSIZE=20000        # Store 10,000 history entries
export HISTCONTROL=erasedups # Don't store duplicates

# Set $DOTFILES VAR
export DOTFILES="$HOME/dotfiles"

# setup path to antigen ZSH pachage manager
case $(uname) in
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
antigen apply # Tell Antigen that you're done.

# IMPORTS
source $DOTFILES/aliases

# enable FZF fuzzy find and auto-complete
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tell FZF to use ripgrep
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -L"
export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always {}"'
export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up,?:toggle-preview --border'
export FZF_DEFAULT_OPTS="
  --ansi \
  --border \
  --height=80% \
  --reverse \
  --info=inline \
  --preview-window=right:60%:wrap \
  --bind alt-j:down,alt-k:up,?:toggle-preview \
  --color=fg:#c0caf5,bg:#1a1b26,hl:#7aa2f7,fg+:#ffffff,bg+:#1f2335,hl+:#bb9af7,info:#7aa2f7,prompt:#bb9af7,spinner:#bb9af7,pointer:#7aa2f7,marker:#7aa2f7,border:#1f2335
"

# sets up nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# sets up rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
# sets up PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# BREW
export PATH="/opt/homebrew/bin:$PATH"

# launch starship prompt
eval "$(starship init zsh)"
eval "$(rbenv init - zsh)"
eval "$(pyenv init --path)"

export PATH="$HOME/.poetry/bin:$PATH"
# export NODE_EXTRA_CA_CERTS="/etc/Cloudflare/CloudflareCA.pem"
