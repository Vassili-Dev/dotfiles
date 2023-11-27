-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities

-- local lspconfig = require 'lspconfig'
require("custom.configs.rustlsp")
-- local rust_capabilities = capabilities


-- lspconfig.rust_analyzer.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"rust"},
--   root_dir = lspconfig.util.root_pattern("Cargo.toml")
-- })

vim.lsp.set_log_level("debug")
