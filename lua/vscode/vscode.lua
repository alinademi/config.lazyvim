-- deifine space key as 'leader' key
Map("n", "<space>", "<Nop>")
vim.g.mapleader = " "

-- show file explorer
Map("n", "<leader>e", Toggle_file_explorer)

Map("n", "yr", Copy_relative_path)
-- Map("n", "yR", Copy_path)
-- Map("n", "<space>", Whichkey_show)
