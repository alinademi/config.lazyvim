-- Cut without yanking visual mode
vim.keymap.set('v', 'x', [['_d]])

-- move between buffers with ctrl+j,k,l,h

-- Move selected lines down in visual mode with <A-k>
-- Mapping for Alt+J as neoVim doesn't exactly receive <A-j>
-- if it were, it would be: vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<Up>-j]', ':m .+1<CR>==', { silent = true, desc = 'Move selected lines down (normal mode)' })
vim.keymap.set('x', '<Up>-j]', ':m .+1<CR>==', { silent = true, desc = 'Move selected lines down (visual mode)' })
-- for insert mode
vim.keymap.set(
  'i',
  '<Up>-j]',
  '<Esc>:m .+1<CR>==gi',
  { silent = true, desc = 'Move selected lines down (insert mode)' }
)

-- Mapping for Alt+K as neoVim doesn't exactly receive <A-k>
-- if it were, it would be: vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('n', '<Up>-k]', ':m .-2<CR>==', { silent = true, desc = 'Move selected lines up (normal mode)' })
vim.keymap.set('x', '<Up>-k]', ':m .-2<CR>==', { silent = true, desc = 'Move selected lines up (visual mode)' })
-- the same for insert mode, I know, I'm lazy and a disgrace to the vim community
vim.keymap.set('i', '<Up>-k]', '<Esc>:m .-2<CR>==gi', { silent = true, desc = 'Move selected lines up (insert mode)' })

-- Center screen after moving to next search result
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center screen after moving to next search result' })

-- Center screen after moving to previous search result
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center screen after moving to previous search result' })

-- file explorer
-- we are uing neotree now, so map that instead
-- vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', { desc = "Toggle netrw" })

-- Interactive search and replace for word under cursor with <leader>s, so cool!, stole form theprimeagen
vim.keymap.set(
  'n',
  '<leader>s',
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Interactive search and replace for word under cursor' }
)

-- remove all the (one-liner) console.log()s from the current buffer
vim.keymap.set(
  'n',
  'rclg',
  [[:%s/console\.log(\_.*\n\{-})\ze\n//g<CR>]],
  { desc = 'Remove all the (one-liner) console.log()s from the current buffer' }
)

-- copy the current line below and comment the original line
vim.keymap.set(
  'n',
  '<leader>cc',
  'yypkgccj',
  { noremap = true, silent = true, desc = 'Copy the current line below and comment the original line' }
)

-- paste to a new line with shift+p mapped to :pu
vim.keymap.set('n', 'P', ':pu<CR>', { noremap = true, silent = true, desc = 'Paste to a new line' })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window', remap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window', remap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window', remap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window', remap = true })
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h', { desc = 'Go to left window' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j', { desc = 'Go to lower window' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k', { desc = 'Go to upper window' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l', { desc = 'Go to right window' })

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-S-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-S-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-S-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-S-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- buffers
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('t', '<S-h>', '<C-\\><C-n>:bprevious<CR>', { desc = 'Previous buffer from terminal' })
vim.keymap.set('t', '<S-l>', '<C-\\><C-n>:bnext<CR>', { desc = 'Next buffer from terminal' })
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
vim.keymap.set('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
-- close buffer
vim.keymap.set('n', '<leader>q', '<cmd>bd<CR>', { desc = 'Close Buffer' })

-- Make current file executable
vim.keymap.set('n', '<leader>exe', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make current file executable' })

-- Exit terminal mode
-- vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>:q!<CR>]], {noremap = true, silent = true})
vim.keymap.set(
  't',
  '<Esc><Esc><Esc>',
  [[<C-\><C-n>:q!<CR>]],
  { noremap = true, silent = true, desc = 'Exit terminal mode' }
)

-- Clear search with <esc>
vim.keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

vim.keymap.set('n', '<leader>xl', '<cmd>lopen<cr>', { desc = 'Location List' })
vim.keymap.set('n', '<leader>xq', '<cmd>copen<cr>', { desc = 'Quickfix List' })

vim.keymap.set('n', '[q', vim.cmd.cprev, { desc = 'Previous quickfix' })
vim.keymap.set('n', ']q', vim.cmd.cnext, { desc = 'Next quickfix' })

--keywordprg
vim.keymap.set('n', '<leader>K', '<cmd>norm! K<cr>', { desc = 'Keywordprg' })

-- better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
vim.keymap.set('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
vim.keymap.set('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
vim.keymap.set('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
vim.keymap.set('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
vim.keymap.set('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
vim.keymap.set('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- Console.log() if the file type is js, jsx, ts, tsx
vim.keymap.set('n', 'clg', function()
  local ft = vim.bo.filetype

  if ft == 'javascript' or ft == 'javascriptreact' or ft == 'typescript' or ft == 'typescriptreact' then
    vim.cmd [[call append(line('.'), "console.log('🚀: ', )")]]
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('j0f:2li', true, false, true), 'n', true)
  end
end, { desc = 'console.log()' })

-- var_dump() if the file type is php
vim.keymap.set('n', 'vd', function()
  local ft = vim.bo.filetype

  if ft == 'php' then
    vim.cmd [[call append(line('.'), "var_dump('🚀 Variable: ', );")]]
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('j0f:2li', true, false, true), 'n', true)
  end
end, { desc = 'PHP var_dump()' })

-- open terminal with ctrl+t in new tab
vim.keymap.set('n', '<C-t>', ':terminal<CR>', { desc = 'Open terminal in new tab' })

-- Copy the absolute path of the current file to the clipboard.
vim.cmd [[command! CopyAbs let @+=expand('%:p')]]
-- map yR to use aboe command and copy the absolute path of the current file to the clipboard.
vim.keymap.set('n', 'yR', ':CopyAbs<CR>', { noremap = true, silent = true, desc = 'Paste to a new line' })
-- copy the relative path of the current opent file to the project root to the clipboard
vim.cmd [[command! CopyRel let @+=expand('%:p:~:.')]]
-- Copy the filename of the current file to the clipboard.
vim.cmd [[command! CopyName let @+=expand('%')]]
