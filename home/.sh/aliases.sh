# Better safe than sorry
alias rm="rm -i"

# Navigation aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Eza aliases
alias l="eza --long"
alias ls="eza"
alias la="eza --long --all"

# Vim aliases
alias v="vim"

# Helix aliases
alias h="hx"

# Git aliases
alias g="git"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gca="git commit -a"
alias gco="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git pull --prune"
alias gm="git merge"
alias gp="git push"
alias gr="git rebase"
alias gri="git rebase -i"
alias gs="git status -sb"
alias gst="git stash"
alias gsu="git submodule"
alias gsw="git switch"
alias gt="git tag"
alias gtl="git tag -l"

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
alias bm="bare-make"
alias bp="bare-pack"

# Reload the shell
alias reload="exec ${SHELL} -l"
