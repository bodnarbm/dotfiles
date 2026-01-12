export EDITOR="nvim"
alias vim="nvim"

ensure_path() { [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"; }

ensure_path "$HOME/.local/bin"

# Homebrew completions
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# Google Cloud SDK completions
if command -v gcloud &>/dev/null; then
  GCLOUD_SDK_ROOT="$(gcloud info --format='value(installation.sdk_root)' 2>/dev/null)"
  [[ -f "$GCLOUD_SDK_ROOT/path.zsh.inc" ]] && source "$GCLOUD_SDK_ROOT/path.zsh.inc"
  [[ -f "$GCLOUD_SDK_ROOT/completion.zsh.inc" ]] && source "$GCLOUD_SDK_ROOT/completion.zsh.inc"
fi

command -v starship >/dev/null && eval "$(starship init zsh)"
command -v mise >/dev/null && eval "$(mise activate zsh)"

# Machine-specific configuration
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
