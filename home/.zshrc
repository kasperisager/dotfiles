export PURE_PROMPT_SYMBOL="$"
export PURE_PROMPT_VICMD_SYMBOL=">"

# Antibody (https://github.com/caarlos0/antibody)
source <(antibody init)

antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure

# Load auto completions
autoload -U compinit && compinit

# Load Jump
eval "$(jump shell)"

# Aliases, functions, and exports
for file in ~/.{aliases,functions,exports}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# History configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
