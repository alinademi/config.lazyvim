-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.termguicolors = true
-- disable relative line numbers
vim.wo.relativenumber = false
-- enable wordwrap
vim.wo.wrap = true
vim.g.netrw_keepdir = false -- for telescope to work with `vim /path/to/project/dir/`
vim.opt.conceallevel = 0
vim.opt.splitbelow = false
vim.opt.wildmode = { "full" }
