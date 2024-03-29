# Better safe than sorry
alias rm="rm -i"

# Navigation aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Exa aliases
alias l="exa --long"
alias ls="exa"
alias la="exa --long --all"

# Vim aliases
alias v="vim"

# Helix aliases
alias h="hx"

# Git aliases
alias g="git"
alias gl="git pull --prune"
alias gp="git push"
alias gd="git diff"
alias gdc="git diff --cached"
alias gc="git commit"
alias ga="git add"
alias gca="git commit -a"
alias gco="git checkout"
alias gb="git branch"
alias gs="git status -sb"
alias gsw="git switch"
alias gm="git merge"
alias gr="git rebase"
alias gri="git rebase -i"
alias gst="git stash"

# Docker aliases
alias d="docker"
alias dc="docker-compose"
alias dm="docker-machine"

# Podman aliases
alias p="podman"

# Kubernetes aliases
alias k="kubectl"
alias kc="kubectl config"
alias kd="kubectl describe"

# Yonkers aliases
alias yo="yonkers"

# Bare aliases
alias bd="bare-dev"

# Reload the shell
alias reload="exec ${SHELL} -l"
