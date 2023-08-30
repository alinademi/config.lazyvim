-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Custom commands.
-- @TODO: Move these to a separate file.

-- Copy the absolute path of the current file to the clipboard.
vim.cmd [[command! CopyAbs let @+=expand('%:p')]]
-- copy the relative path of the current opent file to the project root to the clipboard
vim.cmd [[command! CopyRel let @+=expand('%:p:~:.')]]
-- Copy the filename of the current file to the clipboard.
vim.cmd [[command! CopyName let @+=expand('%')]]
