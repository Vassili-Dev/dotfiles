local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
      require "custom.configs.rustlsp"
    end,
  },
  {
    "natecraddock/workspaces.nvim",
    init = function()
      require("workspaces").setup({
        hooks = {
          open = { "Telescope find_files" }
        },
      })
    end,
  }
}

return plugins
