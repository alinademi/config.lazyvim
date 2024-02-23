local highlight = {
  "CursorColumn",
  "Whitespace",
}
return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  event = "LazyFile",
  opts = {
    indent = { highlight = highlight, char = "" },
    whitespace = {
      highlight = highlight,
      remove_blankline_trail = true,
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
  main = "ibl",
}
