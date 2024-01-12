return {
   "epwalsh/obsidian.nvim",
   lazy = true,
   event = { "BufReadPre ~/Library/Mobile Documents/iCloud~md~obsidian/Documents/psst/**.md" },

   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
   -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
   dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see here for full list of optional dependencies https://github.com/epwalsh/obsidian.nvim#plugin-dependencies
   },
   opts = {
      dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/psst", -- no need to call 'vim.fn.expand' here

      -- see here for full list of options https://github.com/epwalsh/obsidian.nvim#configuration-options
   },
}
