require("config.lazy")

--VSCODE
-- Some global variables to use in our vscode api
Map = vim.keymap.set
Cmd = vim.cmd
VSCodeNotify = vim.fn.VSCodeNotify
VSCodeCall = vim.fn.VSCodeCall

-- we are using Lazyvim's Extras Vscode, so
-- any plugin that we want to use inside vscode
-- must have the vscode = true flag in its config
-- below is custom settings only for neovim inside vscode
if vim.g.vscode then
    require("vscode.api")
    require("vscode.vscode")
end
