export PURE_PROMPT_SYMBOL="$"
export PURE_PROMPT_VICMD_SYMBOL=">"

# Antibody (https://github.com/caarlos0/antibody)
source <(antibody init)

antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure

# Enable Vi mode
bindkey -v

# Load auto completions
autoload -U compinit && compinit

# Load Jump
eval "$(jump shell)"

# Aliases, functions, and exports
for file in ~/.{aliases,functions,exports}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Lower key timeout to avoid Vi mode lag
KEYTIMEOUT=1
