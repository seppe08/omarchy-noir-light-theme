#!/bin/bash
# Installer for Noir Light Omarchy Theme
set -euo pipefail

THEME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_NAME="noir-light"
TARGET_DIR="$HOME/.config/omarchy/themes/$THEME_NAME"

echo "==> Installing Noir Light theme..."

# 1. Sync theme into ~/.config/omarchy/themes/noir-light if running from elsewhere
if [[ "$THEME_DIR" != "$TARGET_DIR" ]]; then
  mkdir -p "$TARGET_DIR"
  cp -r "$THEME_DIR/"* "$TARGET_DIR/"
fi

# 2. Install bundled icon theme into ~/.local/share/icons/
if [[ -d "$TARGET_DIR/icons/Yaru-noir" ]]; then
  echo "==> Installing Yaru-noir icons..."
  mkdir -p "$HOME/.local/share/icons"
  cp -r "$TARGET_DIR/icons/Yaru-noir" "$HOME/.local/share/icons/"
  gtk-update-icon-cache -f "$HOME/.local/share/icons/Yaru-noir" >/dev/null 2>&1 || true
fi

# 3. Install automation hook
echo "==> Installing theme-set hook..."
omarchy hook install theme-set "$TARGET_DIR/hooks/20-noir-light.sh"

# 4. Apply theme via Omarchy CLI
echo "==> Applying Noir Light..."
omarchy theme set "$THEME_NAME"

echo "==> Done! Noir Light is now active."
