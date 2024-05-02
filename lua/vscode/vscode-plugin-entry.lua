-- we are using Lazyvim's Extras Vscode, so
-- any plugin that we want to use inside vscode
-- must have the vscode = true flag in its config
-- https://www.lazyvim.org/extras/vscode
return {
  --disable even those that lazyvim loads by default in vscode
  { "ggandor/flit.nvim",                      vscode = false },
  { "ggandor/leap.nvim",                      vscode = false },
  { "echasnovski/mini.ai",                    vscode = false },
  { "echasnovski/mini.pairs",                 vscode = false },
  { "lmburns/lf.nvim",                        vscode = false },
  { "akinsho/toggleterm.nvim",                vscode = false },
  -- enable in vscode
  { "folke/lazy.nvim",                        vscode = true },
  { "LazyVim/LazyVim",                        vscode = true },
  { "tpope/vim-repeat",                       vscode = true },
  { "echasnovski/mini.surround",              vscode = true },
  { "vscode-neovim/vscode-multi-cursor.nvim", vscode = true },
  { "xiyaowong/fast-cursor-move.nvim",        vscode = true },
  { "echasnovski/mini.comment",               vscode = true },
}
