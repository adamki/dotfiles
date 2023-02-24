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
export DOCKER_BUILDKIT=1
export CWE_DEV=787201226158
export CWE_PROD=159653997934
export CWE_STAGE=214936853396
export CWE_INFRA=873230290044
export FORCE_MFA="Duo Push"
export AWS_REGION="us-east-1"
# we are not multi-region yet
export AWS_DEFAULT_REGION=us-east-1
# account IDs (copied from the AWS Okta tile sign in, if you have more/others)
export PCYCLE=106877218800
export PPROD=386675210126
export PSTAGE=486598304777
export PTEST=152245890419
export TKITCH=048438595429
export PES1=429007243955
export PNONPROD=354023250235
# prefer to get push notifications (switch to Passcode if you like)
export FORCE_MFA="Duo Push"
# your role which is visible when you click the AWS SSO tile in Okta
export PELOTON_AWS_ROLE="106877218800"
# login to an account if necessary
s2al () { saml2aws login --skip-prompt --profile=${1} --duo-mfa-option "${FORCE_MFA}" --role="arn:aws:iam::${2}:role/acquisition-rw"; }

# inject the active credentials for an account into your env
s2a () { eval $(saml2aws script --shell=bash --skip-prompt --profile=${1}); }
# shortcut to remember who you are (and which account you are in)
awho () { aws sts get-caller-identity; }
# these are the aliases to trigger login (if necessary)
alias apc="s2al pc ${PCYCLE}"
alias atest="s2al test ${PTEST}"
alias astage="s2al stage ${PSTAGE}"
alias aprod="s2al prod ${PPROD}"
alias anprod="s2al nprod ${PNONPROD}"

# these are the aliases to trigger account switch
alias spc="s2a pc"
alias stest="s2a test"
alias sstage="s2a stage"
alias sprod="s2a prod"
alias snprod="s2a nprod"

# these are the aliases to trigger account login (if necessary) and switch
alias jpc="s2al pc ${PCYCLE} && s2a pc"
alias jtest="s2al test ${PTEST} && s2a test"
alias jstage="s2al stage ${PSTAGE} && s2a stage"
alias jprod="s2al prod ${PPROD} && s2a prod"
alias jnprod="s2al nprod ${PNONPROD} && s2a nprod"


# IMPORTS
source $DOTFILES/aliases

# print sys info
~/pfetch/pfetch

# enable FZF fuzzy find and auto-complete
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

# launch starship prompt
eval "$(starship init zsh)"

eval "$(rbenv init -)"
eval "$(pyenv init --path)"

export PATH="$HOME/.poetry/bin:$PATH"
