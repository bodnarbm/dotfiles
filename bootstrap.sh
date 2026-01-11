#!/bin/sh
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

info() { printf "${GREEN}[INFO]${NC} %s\n" "$1"; }
error() { printf "${RED}[ERROR]${NC} %s\n" "$1"; exit 1; }

check_stow() {
    if ! command -v stow >/dev/null 2>&1; then
        error "GNU Stow is required but not installed. Install it with: brew install stow"
    fi
}

run_stow() {
    info "Running stow..."
    cd "$DOTFILES_DIR"
    if ! stow -v -t "$HOME" home 2>&1; then
        echo ""
        error "Stow failed. If there are conflicts, either remove/backup the existing files or use: stow --adopt -t ~ home"
    fi
    info "Symlinks created successfully"
}

main() {
    if [ "$(uname -s)" != "Darwin" ]; then
        error "This script only supports macOS"
    fi

    info "Setting up dotfiles..."
    check_stow
    run_stow
}

main "$@"
