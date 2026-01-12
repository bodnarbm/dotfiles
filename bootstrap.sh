#!/bin/sh
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

info() { printf "${GREEN}[INFO]${NC} %s\n" "$1"; }
error() { printf "${RED}[ERROR]${NC} %s\n" "$1"; exit 1; }

install_brew_packages() {
    if command -v brew >/dev/null 2>&1; then
        info "Installing brew packages..."
        brew bundle --file="$DOTFILES_DIR/brew/Brewfile"
    else
        error "Homebrew is required but not installed. Install it from https://brew.sh"
    fi
}

run_stow() {
    info "Running stow..."
    cd "$DOTFILES_DIR"
    if ! stow -v --no-folding -t "$HOME" home 2>&1; then
        echo ""
        error "Stow failed. If there are conflicts, either remove/backup the existing files or use: stow --adopt -t ~ home"
    fi
    info "Symlinks created successfully"
}

run_post_install() {
    for script in "$DOTFILES_DIR/post-install"/*.sh; do
        [ -f "$script" ] || continue
        info "Running post-install: $(basename "$script")..."
        # shellcheck source=/dev/null
        . "$script"
    done
}

main() {
    if [ "$(uname -s)" != "Darwin" ]; then
        error "This script only supports macOS"
    fi

    info "Setting up dotfiles..."
    install_brew_packages
    run_stow
    run_post_install
}

main "$@"
