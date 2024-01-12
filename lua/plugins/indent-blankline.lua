vim.cmd [[highlight IndentBlanklineIndent1 guibg=#0f111a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#10121B gui=nocombine]]
return {
   {
      "lukas-reineke/indent-blankline.nvim",
      event = { "BufReadPost", "BufNewFile" },
      opts = {
         char = "",
         char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
         },
         space_char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
         },
         show_trailing_blankline_indent = true,
      },
   }
}
