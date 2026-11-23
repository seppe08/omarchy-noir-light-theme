# Noir Light — Omarchy Theme

A refined, high-contrast monochrome theme featuring a clean luminous light canvas (`#f4f5f7`), solid jet black accents (`#09090b`), and rich architectural ink syntax highlighting.

## Components Included

- **`colors.toml`**: System-wide color palette for Hyprland borders, Quickshell surfaces, and terminal emulators.
- **`backgrounds/`**: Curated minimalist monochrome wallpapers (cycleable with `omarchy theme bg next`).
- **`icons/Yaru-noir/`**: Bundled monochrome folder icon theme for Nautilus and GTK.
- **`neovim.lua`**: Seamless Neovim integration (`vim.o.background = "light"`, `aether.nvim` ink palette).
- **`btop.theme`**: Bespoke dark/charcoal system monitor theme.
- **`starship.toml`**: Matching monochrome shell prompt configuration.
- **`unlock.png` & `preview-unlock.png`**: Matching lock screen and Plymouth boot/disk unlock screen assets.
- **`hooks/20-noir-light.sh`**: Automation hook installed in `~/.config/omarchy/hooks/theme-set.d/` to synchronize icons, Starship, and terminals whenever the theme is applied.

## Quick Install / Apply

```bash
omarchy theme set noir-light
```

Or run the installer script:

```bash
~/.config/omarchy/themes/noir-light/install.sh
```
