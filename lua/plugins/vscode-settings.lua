-- we are using Lazyvim's Extras Vscode, so
-- any plugin that we want to use inside vscode
-- must have the vscode = true flag in its config
-- https://www.lazyvim.org/extras/vscode
return {
    --disable in vscode
    { 'ggandor/flit.nvim',         vscode = false },
    { 'ggandor/leap.nvim',         vscode = false },
    { 'echasnovski/mini.ai',       vscode = false },
    { 'echasnovski/mini.comment',  vscode = false },
    { 'echasnovski/mini.pairs',    vscode = false },
    { 'echasnovski/mini.surround', vscode = false },
    -- enable in vscode
}
