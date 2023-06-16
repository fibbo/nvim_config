-- return early if we are within vs code
if vim.g.vscode ~= nil then
  return
end
-- bootstrap lazy.nvim, LazyVim and your plugins_str
require("config.lazy")
