-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Your existing map_keys function and options
local function map_keys(mode, key, result, options)
   vim.api.nvim_set_keymap(mode, key, result, options)
end

local opts = { noremap = true, silent = true }
-- Start movin lines (lazvim has Alt + J/K) but it does not work in my terminal.
-- New mappings for Ctrl+Shift+J/K in normal mode
map_keys('n', '<C-S-j>', ':m .+1<CR>==', opts)
map_keys('n', '<C-S-k>', ':m .-2<CR>==', opts)

-- New mappings for Ctrl+Shift+J/K in insert mode
map_keys('i', '<C-S-j>', '<Esc>:m .+1<CR>==gi', opts)
map_keys('i', '<C-S-k>', '<Esc>:m .-2<CR>==gi', opts)

-- New mappings for Ctrl+Shift+J/K in visual mode
map_keys('v', '<C-S-j>', ":m '>+1<CR>gv=gv", opts)
map_keys('v', '<C-S-k>', ":m '<-2<CR>gv=gv", opts)

-- Custom commands.
-- @TODO: Move these to a separate file.

-- Copy the absolute path of the current file to the clipboard.
vim.cmd [[command! CopyAbs let @+=expand('%:p')]]
-- copy the relative path of the current opent file to the project root to the clipboard
vim.cmd [[command! CopyRel let @+=expand('%:p:~:.')]]
-- Copy the filename of the current file to the clipboard.
vim.cmd [[command! CopyName let @+=expand('%')]]
