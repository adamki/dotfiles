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
# asdf (Node, Ruby, Python, etc.)
if [[ -d "$(brew --prefix asdf 2>/dev/null)" ]]; then
  . "$(brew --prefix asdf)/libexec/asdf.sh"
fi

# ------------------------
# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -L"
export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always {}"'
export FZF_DEFAULT_OPTS="--ansi --border --height=80% --reverse --info=inline \
  --preview-window=right:60%:wrap --bind alt-j:down,alt-k:up,?:toggle-preview \
  --color=fg:#c0caf5,bg:#1a1b26,hl:#7aa2f7,fg+:#ffffff,bg+:#1f2335,hl+:#bb9af7,info:#7aa2f7,prompt:#bb9af7,spinner:#bb9af7,pointer:#7aa2f7,marker:#7aa2f7,border:#1f2335"

# Official git completion (so team dotfiles' deprecated script no-ops and doesn't warn)
fpath=("${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh/site-functions" $fpath)

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
# Work dotfiles (optional)
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
export PATH="$(brew --prefix imagemagick@6)/bin:$PATH"
export PATH="$(brew --prefix)/opt/libpq/bin:$PATH"

# Cursor / VS Code CLI (code and cursor commands)
# Cursor in ~/Applications (brew cask --appdir=~/Applications)
[[ -d "$HOME/Applications/Cursor.app/Contents/Resources/app/bin" ]] && export PATH="$HOME/Applications/Cursor.app/Contents/Resources/app/bin:$PATH"
# System Applications (e.g. VS Code or Cursor installed to /Applications)
[[ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]] && export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
[[ -d "/Applications/Cursor.app/Contents/Resources/app/bin" ]] && export PATH="/Applications/Cursor.app/Contents/Resources/app/bin:$PATH"

[[ -f "$HOME/workspace/dotfiles/dotfiles.sh" ]] && source "$HOME/workspace/dotfiles/dotfiles.sh"

# ------------------------
# Defaults
export VISUAL=nvim # make vim default editor
export EDITOR="$VISUAL"
export HISTSIZE=20000       # store 20,000 history entries
setopt HIST_IGNORE_ALL_DUPS # no duplicate entries in history

# ------------------------
# Custom PATHs
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/workspace/kube-connect:$PATH"

# ------------------------
# Aliases and dotfiles
export DOTFILES="$HOME/dotfiles"
source "$DOTFILES/aliases"
