return {
  {
    "folke/tokyonight.nvim",
    opts = {
      -- transparent = true,
      styles = {
        functions = { italic = true },
        -- sidebars = "transparent",
        -- floats = "transparent",
      },
      -- for a list of highlights see https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua
      on_highlights = function(highlights, colors)
        highlights.String = { fg = "#6faee2", bg = colors.bg }
        highlights.Comment = { fg = "#5b6aa0", bg = colors.bg }
      end,
      on_colors = function(colors)
        -- colors.bg = "#0F111A"
      end,
    },
  },
  -- Configure LazyVim to load theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
