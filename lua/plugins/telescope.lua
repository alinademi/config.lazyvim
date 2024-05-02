return {
  {
    "nvim-telescope/telescope.nvim",
    defaults = { file_ignore_patterns = { "node_modules", "vendor" } },
    keys = function()
      return {}
    end,

    config = function()
      require("telescope").setup({
        defaults = {
          -- Default configuration for telescope goes here:
          -- config_key = value,
          file_ignore_patterns = { "node_modules", "vendor" },
          mappings = {
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ["<C-h>"] = "which_key",
            },
          },
        },
        pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
        },
        extensions = {
          -- Your extension configuration goes here:
          project = {
            display_type = "minimal",
            base_dirs = {
              "~/Desktop/Projects",
            },
            hidden_files = true, -- default: false
            theme = "dropdown",
            order_by = "asc",
            search_by = "title",
            sync_with_nvim_tree = true,
          },
          -- please take a look at the readme of the extension you want to configure
        },
      })
      local builtin = require("telescope.builtin")
      -- telescope find files
      vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Find files " })
      -- telescope git files
      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git files " })
      -- telesccope git status
      vim.keymap.set("n", "<leader>tgs", builtin.git_status, { desc = "Show git status " })
      -- telescope git branches
      vim.keymap.set("n", "<leader>tgb", builtin.git_branches, { desc = "Show git branches " })
      -- telescope git commits
      vim.keymap.set("n", "<leader>tgc", builtin.git_commits, { desc = "Show git commits " })
      -- telescope git stashes
      -- vim.keymap.set("n", "<leader>tgsh", builtin.git_stash, { desc = "Show git stashes " })
      -- telecope buffers
      vim.keymap.set("n", "<leader>tbf", builtin.buffers, { desc = "Show buffers " })
      -- telescope help tags
      vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Show help tags " })
      -- telescope live grep
      vim.keymap.set("n", "<leader>tlg", builtin.live_grep, { desc = "Live grep " })
      -- telescope project
      vim.keymap.set("n", "<leader>tpj", function()
        require("telescope").extensions.project.project()
      end, { desc = "Show projects " })

      -- telescope grep current word under cursor
      vim.keymap.set("n", "<leader>tws", function()
        local word = vim.fn.expand("<cword>")

        builtin.grep_string({ search = word })
      end, { desc = "Grep word under cursor " })

      -- telescope grep current WORD under cursor
      vim.keymap.set("n", "<leader>tWs", function()
        local word = vim.fn.expand("<cWORD>")

        builtin.grep_string({ search = word })
      end, { desc = "Grep WORD under cursor " })
      -- telescope search
      vim.keymap.set("n", "<leader>ts", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
    end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    cond = not vim.g.vscode,
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("project")
    end,
  },
}
