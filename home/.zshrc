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

command -v starship >/dev/null && eval "$(starship init zsh)"
command -v mise >/dev/null && eval "$(mise activate zsh)"

# Machine-specific configuration
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
