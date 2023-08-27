return {
   {
      "nvim-telescope/telescope.nvim",
      defaults = { file_ignore_patterns = { "node_modules", "vendor" } },
      -- replace all Telescope keymaps with only one mapping
      keys = function()
         return {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
         }
      end,
   }
}
