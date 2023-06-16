-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
Opts = { noremap = true, silent = true }
Map = vim.api.nvim_set_keymap

Map("n", "<leader>wp", ":lua require'nvim-window'.pick()<CR>", { desc = "Pick Window" })
Map("i", "kj", "<Esc>", Opts)
Map("i", "<A-l>", "copilot#Accept('<CR>')", { desc = "Accept Suggestions", expr = true, silent = true })
Map("n", "<S-A-o>", ':lua require("telescope.builtin").lsp_document_symbols()<CR>zz', Opts)
Map("n", "<leader>bs", ":Telescope buffers<CR>", Opts)
Map("n", "<F5>", ":lua require'dap'.continue()<CR>", Opts)
Map("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", Opts)
Map("n", "<F10>", ":lua require'dap'.step_over()<CR>", Opts)
Map("n", "<F11>", ":lua require'dap'.step_into()<CR>", Opts)
Map("n", "<F12>", ":lua require'dap'.step_out()<CR>", Opts)
Map("n", "<leader>n", ":Neorg<CR>", Opts)
Map(
  "n",
  "<leader>co",
  ":ClangdSwitchSourceHeader<CR>",
  { desc = "Switch between Source & Header", noremap = true, silent = true }
)
-- Move lines
Map("n", "<A-up>", ":m -2<CR>==", Opts)
Map("n", "<A-down>", ":m +1<CR>==", Opts)
Map("i", "<A-down>", ":m .+1<CR>==gi", Opts)
Map("i", "<A-up>", ":m .-2<CR>==gi", Opts)
Map("v", "<A-down>", ":m >+1<CR>gv=gv", Opts)
Map("v", "<A-up>", ":m <-2<CR>gv=gv", Opts)
