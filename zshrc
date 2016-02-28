# Path to your oh-my-zsh installation.
export ZSH=/Users/adamjensen/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="adams"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z git brew osx thefuck nyan rails ruby gem node)

# User configuration

export PATH="/Users/adamjensen/bin:/usr/local/bin:/Users/adamjensen/bin:/usr/local/bin:/Users/adamjensen/bin:/usr/local/bin:/Users/adamjensen/bin:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/local/bin:/opt/local/sbin:/usr/X11/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.




##############################################################################
###########################          BASIC          ##########################
##############################################################################
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias ak='open https://github.com/adamki?tab=repositories'
alias today='open https://today.turing.io/'
alias personal='open https://adamki.github.io/'

##############################################################################
###########################          GIT             ##########################
##############################################################################
alias gap='git add -p'
alias ga='git add'
alias gnap='git add -N . && git add -p'
alias gb='git branch'
alias gc-='git commit -m'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gd='git diff --color-words'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gl='git pull'
alias glod='git log --graph --pretty="%Cgreen%h%Creset%Cblue%d%Creset %Cred%an%Creset: %s"'
alias gp='git push'
alias gpr='git pull --rebase'
alias gst='git status'
alias gr='git rebase'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias gra='git rebase --abort'
alias reset-authors='git commit --amend --reset-author -C HEAD'
