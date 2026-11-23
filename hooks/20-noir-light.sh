#!/bin/bash
# Omarchy theme-set hook for Noir Light
# Runs automatically whenever a theme is set in Omarchy.
# $1 holds the theme slug.

set -u

THEME_NAME="${1:-}"

if [[ "$THEME_NAME" == "noir-light" ]]; then
  THEME_DIR="$HOME/.config/omarchy/themes/noir-light"

  # 1. Ensure bundled Yaru-noir icons exist in ~/.local/share/icons/
  if [[ -d "$THEME_DIR/icons/Yaru-noir" ]]; then
    mkdir -p "$HOME/.local/share/icons"
    if [[ ! -d "$HOME/.local/share/icons/Yaru-noir" ]] || [[ "$THEME_DIR/icons/Yaru-noir" -nt "$HOME/.local/share/icons/Yaru-noir" ]]; then
      cp -r "$THEME_DIR/icons/Yaru-noir" "$HOME/.local/share/icons/"
      gtk-update-icon-cache -f "$HOME/.local/share/icons/Yaru-noir" >/dev/null 2>&1 || true
    fi
  fi

  # 2. Ensure GNOME / GTK interface icon theme is active
  if command -v gsettings >/dev/null 2>&1 && [[ -n "${DBUS_SESSION_BUS_ADDRESS:-}" ]]; then
    gsettings set org.gnome.desktop.interface icon-theme "Yaru-noir" >/dev/null 2>&1 || true
  fi

  # 3. Synchronize matching Starship prompt
  if [[ -f "$THEME_DIR/starship.toml" ]]; then
    cp "$THEME_DIR/starship.toml" "$HOME/.config/starship.toml"
  fi

  # 4. Refresh Nautilus so folder icons reload cleanly
  if command -v nautilus >/dev/null 2>&1; then
    nautilus -q >/dev/null 2>&1 || true
  fi

  # 5. Live update open Kitty terminal instances
  for sock in "${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"/omarchy-kitty-*; do
    if [[ -S "$sock" ]] && command -v kitty >/dev/null 2>&1; then
      kitty @ --to="unix:$sock" set-colors "$HOME/.local/state/omarchy/current/theme/kitty.conf" >/dev/null 2>&1 || true
    fi
  done
fi
