return {
  "nvim-neorg/neorg",
  -- version = "4.0.1",
  opts = {
    ft = "norg",
    run = ":Neorg sync-parsers", -- This is the important bit!
    load = {
      ["core.defaults"] = {}, -- Load all the default modules
      ["core.concealer"] = {}, -- Allows for use of icons
      ["core.ui"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            work = "~/notes/work",
            home = "~/notes/home",
          },
        },
      },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
