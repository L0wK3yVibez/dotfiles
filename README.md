# dotfiles

Personal Linux configs for Hyprland on CachyOS.

## What's included

| Package | Path | Purpose |
|---------|------|---------|
| `hypr` | `~/.config/hypr/` | Hyprland desktop (modular conf + scripts) |
| `waybar` | `~/.config/waybar/` | Status bar |
| `fish` | `~/.config/fish/` | Shell |
| `kitty` | `~/.config/kitty/` | Terminal |
| `fastfetch` | `~/.config/fastfetch/` | Boot logo + system info |
| `ohmyposh` | `~/.config/ohmyposh/` | Prompt theme |
| `home` | `~/.profile` | Session environment |

Not tracked (machine-local): `fish_variables`, `hypr/opacity_state`, app data in `~/.config/`.

## Install

Requires [GNU stow](https://www.gnu.org/software/stow/).

```bash
git clone <your-repo-url> ~/dotfiles
~/dotfiles/install.sh
```

Re-run `install.sh` after pulling changes. It restows symlinks safely.

## Edit workflow

1. Edit files in `~/dotfiles/` (symlinked into `~/.config` after install)
2. Commit from `~/dotfiles`
3. `hyprctl reload` or restart apps as needed

## Layout

```
dotfiles/
├── hypr/.config/hypr/
├── waybar/.config/waybar/
├── fish/.config/fish/
├── kitty/.config/kitty/
├── fastfetch/.config/fastfetch/
├── ohmyposh/.config/ohmyposh/
├── home/.profile
├── install.sh
└── README.md
```
