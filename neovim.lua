vim.o.background = "light"

return {
  {
    "omacom/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg = "#f4f5f7",
        dark_bg = "#eaedf1",
        darker_bg = "#dfe3e8",
        lighter_bg = "#ffffff",

        fg = "#09090b",
        dark_fg = "#3f3f46",
        light_fg = "#18181b",
        bright_fg = "#000000",
        muted = "#71717a",

        red = "#7f1d1d",
        yellow = "#78350f",
        orange = "#7c2d12",
        green = "#14532d",
        cyan = "#134e4a",
        blue = "#1e3a8a",
        magenta = "#4c0519",
        brown = "#451a03",

        bright_red = "#991b1b",
        bright_yellow = "#92400e",
        bright_green = "#166534",
        bright_cyan = "#0e7490",
        bright_blue = "#1d4ed8",
        bright_magenta = "#581c87",

        accent = "#09090b",
        cursor = "#000000",
        foreground = "#09090b",
        background = "#f4f5f7",
        selection = "#d4d4d8",
        selection_foreground = "#09090b",
        selection_background = "#d4d4d8",
      },
      on_highlights = function(hl, c)
        -- Ensure crisp contrast and architectural noir feel in Neovim
        hl.CursorLine = { bg = c.dark_bg }
        hl.CursorLineNr = { fg = c.fg, bold = true }
        hl.LineNr = { fg = c.muted }
        hl.WinSeparator = { fg = c.darker_bg, bold = true }
        hl.VertSplit = { fg = c.darker_bg }
        hl.StatusLine = { fg = c.fg, bg = c.dark_bg }
        hl.StatusLineNC = { fg = c.muted, bg = c.darker_bg }
        hl.Visual = { bg = c.selection, fg = c.fg }
        hl.Search = { bg = c.selection, fg = c.fg, bold = true }
        hl.IncSearch = { bg = c.fg, fg = c.bg, bold = true }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
