-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

vim.g.python3_host_prog = "~/venvs/neovim/bin/python3"
vim.g.copilot_no_tab_map = true
vim.g.minimap_auto_start = 1
vim.g.minimap_auto_start_win_enter = 1
vim.g.nimap_close_buftypes = { "nofile" }
vim.g.minimap_block_filetypes = { "fugitive", "nerdtree", "tagbar", "fzf", "NvimTree" }

require("luasnip.loaders.from_vscode").load({ paths = { "~/.config/nvim/lua/config/snippets" } })

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.rnu = true
opt.nu = true

-- line wrapping
-- opt.wrap = false
opt.wrap = true
opt.breakindent = true
opt.linebreak = true
