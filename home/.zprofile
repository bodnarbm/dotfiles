ensure_path() { [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"; }

if [[ -d "$HOME/.docker/bin" ]]; then
  ensure_path "$HOME/.local/bin"
fi

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
