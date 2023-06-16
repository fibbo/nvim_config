return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.formatting.black,
        nls.builtins.formatting.isort,
        nls.builtins.diagnostics.flake8,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.rustfmt,
        nls.builtins.formatting.latexindent,
        nls.builtins.formatting.prettierd.with({
          disabled_filetypes = { "yaml" },
        }),
        nls.builtins.formatting.prettier.with({
          filetypes = { "yaml" },
        }),
      },
    }
  end,
}
