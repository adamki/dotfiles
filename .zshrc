# ------------------------
# Homebrew (Apple Silicon)
if [[ -d "/opt/homebrew/bin" ]]; then
	export PATH="/opt/homebrew/bin:$PATH"
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ------------------------
# Starship prompt
# must come after Homebrew is in PATH
if command -v starship >/dev/null 2>&1; then
	eval "$(starship init zsh)"
fi

# ------------------------
# rbenv (Ruby version manager)
export PATH="$HOME/.rbenv/bin:$PATH"
if command -v rbenv >/dev/null 2>&1; then
	eval "$(rbenv init - zsh)"
fi

# ------------------------
# pyenv (Python version manager)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null 2>&1; then
	eval "$(pyenv init --path)"
fi

# ------------------------
# NVM (Node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ------------------------
# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -L"
export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always {}"'
export FZF_DEFAULT_OPTS="--ansi --border --height=80% --reverse --info=inline \
  --preview-window=right:60%:wrap --bind alt-j:down,alt-k:up,?:toggle-preview \
  --color=fg:#c0caf5,bg:#1a1b26,hl:#7aa2f7,fg+:#ffffff,bg+:#1f2335,hl+:#bb9af7,info:#7aa2f7,prompt:#bb9af7,spinner:#bb9af7,pointer:#7aa2f7,marker:#7aa2f7,border:#1f2335"

# ------------------------
# Antigen (Zsh plugin manager)
case $(uname) in
Darwin)
	source /opt/homebrew/share/antigen/antigen.zsh
	;;
Linux)
	source $HOME/antigen.zsh
	;;
esac

antigen use oh-my-zsh
antigen bundle colorize
antigen bundle colored-man-pages
antigen bundle paulirish/git-open
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# ------------------------
# Defaults
export VISUAL=nvim # make vim default editor
export EDITOR="$VISUAL"
export HISTSIZE=20000        # store 20,000 history entries
export HISTCONTROL=erasedups # no duplicates

# ------------------------
# Custom PATHs
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

# ------------------------
# Aliases and dotfiles
export DOTFILES="$HOME/dotfiles"
source $DOTFILES/aliases
