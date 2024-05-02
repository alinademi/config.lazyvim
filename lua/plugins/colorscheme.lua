return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      term_colors = true,
      transparent_background = true,
      styles = {
        comments = {
          style = "italic",
        },
        conditionals = {},
        loops = {},
        functions = {
          style = "italic",
        },
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = "#23272B",
          mantle = "#23272B",
          crust = "#23272B",
        },
      },
      highlight_overrides = {
        all = function(colors)
          return {
            CmpBorder = { fg = colors.none },
          }
        end,
        frappe = function(frappe)
          return {}
        end,
        macchiato = function(macchiato)
          return {}
        end,
        mocha = function(mocha)
          return {
            LineNr = { fg = "#3B4249" },
            Comment = { fg = mocha.overlay0 },
            ["@comment"] = { fg = mocha.overlay1, style = { "italic" } },
            -- Structure = { fg = mocha.sky },
            StorageClass = { fg = mocha.sky },
          }
        end,
      },
      integrations = {
        telescope = {
          enabled = true,
          -- style = "nvchad",
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
  },
  -- add theme
  -- {
  --    "rmehri01/onenord.nvim",
  --    opts = {
  --       custom_colors = {
  --          bg = "#1B1B1D",
  --       },
  --    },
  -- },

  -- Configure LazyVim to load theme
  -- {
  --    "LazyVim/LazyVim",
  --    opts = {
  --       colorscheme = "onenord",
  --    },
  -- }
}
