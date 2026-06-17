#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES=(hypr waybar fish kitty fastfetch ohmyposh home)

cd "$DOTFILES"

if ! command -v stow >/dev/null; then
  echo "GNU stow is required. Install with: sudo pacman -S stow"
  exit 1
fi

echo "Linking dotfiles from $DOTFILES"
stow -v -R -t "$HOME" --adopt "${PACKAGES[@]}"

echo "Done. Reload Hypr with: hyprctl reload"
