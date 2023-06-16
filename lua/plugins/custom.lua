return {
  { url = "https://gitlab.com/yorickpeterse/nvim-window.git" },
  { "github/copilot.vim" },
  {
    "s1n7ax/nvim-window-picker",
    config = function()
      require("window-picker").setup()
    end,
  },
  {
    "krivahtoo/silicon.nvim",
    enabled = false,
    build = "./install.sh",
    config = function()
      require("silicon").setup({
        font = "PragmataPro Mono Liga",
        background = "#87f",
        theme = "Tokyonight",
        line_number = true,
        pad_vert = 80,
        pad_horiz = 50,
        output = {
          path = "/Users/philippg/tmp",
        },
        watermark = {
          text = " @fibbo",
        },
        window_title = function()
          return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ":~:.")
        end,
      })
    end,
  },
}
