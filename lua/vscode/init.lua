-- this file is for vscdoe-only settings. including kemaps, options, cmd, etc.
-- NOTE: Plugins are managed by lazy, and we set teh "cond" to manage loading them in vscode.
if not vim.g.vscode then
  return {}
end

-- these keymaps are only available in vscode, trivial ones go here. Define complex ones below this in separate functions.
vim.api.nvim_create_autocmd("User", {
  callback = function()
    -- Find
    vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
    -- <C-h>  Go to left window
    vim.keymap.set("n", "<C-h>", "<cmd>call VSCodeNotify('workbench.action.navigateRight')<cr>")
    -- <C-l>  Go to right window
    vim.keymap.set("n", "<C-l>", "<cmd>call VSCodeNotify('workbench.action.navigateLeft')<cr>")
    -- <S-h> Go to left tab
    vim.keymap.set("n", "<S-h>", "<cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>")
    -- <S-l> Go to right tab
    vim.keymap.set("n", "<S-l>", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>")
    -- open find in files
    vim.keymap.set("n", "<leader>/", [[<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>]])
    -- Go to symbol
    vim.keymap.set("n", "<leader>ss", [[<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>]])
    -- Toggle file explorer
    vim.keymap.set("n", "<leader>fe", [[<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>]])
    -- Copy relative path
    vim.keymap.set("n", "<leader>cr", [[<cmd>call VSCodeNotify('copyRelativeFilePath')<cr>]])
    -- Copy file path with copyFilePath
    vim.keymap.set("n", "<leader>cp", [[<cmd>call VSCodeNotify('copyFilePath')<cr>]])
    -- toggle terminal with <leader>t
    vim.keymap.set("n", "<leader>t", [[<cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<cr>]])
    -- toggle zen mode with
    vim.keymap.set("n", "<C-t><C-z>", [[<cmd>call VSCodeNotify('workbench.action.toggleZenMode')<cr>]])
    -- toggle problems panel
    vim.keymap.set("n", "<leader>p", [[<cmd>call VSCodeNotify('workbench.action.problems.focus')<cr>]])
    -- map leader be to show buffer list
    vim.keymap.set("n", "<leader>bf", [[<cmd>call VSCodeNotify('workbench.action.showAllEditors')<cr>]])
    -- map leader gs to git status (source conrol panel)
    vim.keymap.set("n", "<leader>gs", [[<cmd>call VSCodeNotify('workbench.view.scm')<cr>]])
  end,
})
--------------------------------------------------------
--
-- open terminal and run lazygit
local vscode = require("vscode-neovim")

local function openTerminalAndRunLazygit()
  vscode.action("workbench.action.terminal.new")
  vscode.action("workbench.action.toggleMaximizedPanel")
  vscode.action("workbench.action.terminal.focus")
  vscode.action("workbench.action.terminal.sendSequence", {
    args = { text = "lazygit\n" },
  })
end

vim.api.nvim_create_autocmd("User", {
  callback = function()
    vim.keymap.set("n", "<leader>gg", openTerminalAndRunLazygit, { desc = "Open Terminal And Run lazygit" })
  end,
})
--------------------------------------------------------
--
-- this is just my experiment with vscode-neovim APIs ;)
-- local vscode = require 'vscode-neovim'

local function createReactComponent()
  vscode.action("workbench.action.files.newUntitledFile", { args = { languageId = "javascript" } })

  vim.defer_fn(function()
    local snippet =
      "function ${1:ComponentName}() {\n  return (\n    <div>\n      $0\n    </div>\n  );\n}\n\nexport default ${1:ComponentName};"
    vscode.action("editor.action.insertSnippet", { args = { snippet = snippet } })
  end, 100)
end

vim.api.nvim_create_user_command("CreateReactComponent", createReactComponent, {})
--------------------------------------------------------
--
-- Create a status bar item to show the current mode 
local modeStatusItem = vscode.get_status_item('neovimMode')

local modeMap = {
    ['n']  = 'NORMAL',
    ['no'] = 'N-OperatoR PENDING',
    ['v']  = 'VISUAL',
    ['V']  = 'V-LINE',
    [''] = 'V-BLOCK',
    ['s']  = 'SELECT',
    ['S']  = 'S-LINE',
    [''] = 'S-BLOCK',
    ['i']  = 'INSERT',
    ['ic'] = 'INSERT COMPLETION',
    ['R']  = 'REPLACE',
    ['Rv'] = 'V-REPLACE',
    ['c']  = 'COMMAND',
    ['cv'] = 'Vim Ex',
    ['ce'] = 'Ex',
    ['r']  = 'PROMPT',
    ['rm'] = 'MORE',
    ['r?'] = 'CONFIRM',
    ['!']  = 'SHELL',
    ['t']  = 'TERMINAl',
}

-- Update the status bar with the current mode
local function updateModeStatus()
    local currentMode = vim.fn.mode()
    local modeString = modeMap[currentMode] or 'Unknown'
    modeStatusItem.text = "🚀 " .. modeString
end

vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function()
        updateModeStatus()
    end,
})

updateModeStatus()