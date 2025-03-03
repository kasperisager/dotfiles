if [ -d "/opt/homebrew" ]; then
  export HOMEBREW_NO_ANALYTICS=1
  export HOMEBREW_NO_EMOJI=1
  export HOMEBREW_NO_ENV_HINTS=1

  export PATH=/opt/homebrew/bin:$PATH

  eval "$(brew shellenv)"
fi
