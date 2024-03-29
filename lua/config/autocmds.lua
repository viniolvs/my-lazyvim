-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("BufEnter", { command = "set nospell" })

-- node path
local home_dir = "/home/vinicius/"
-- pin nvim to a specific node version, regardless of the project
-- prereq - need to install: nvm i 16.17.1
local node_bin = "/bin/node"
vim.g.node_host_prog = home_dir .. node_bin .. "/node"

-- for mason.nvim
-- prereq - install lsp server in that node/bin npm i -g typescript-language-server
-- (handled by :Mason currently)
vim.cmd("let $PATH = '" .. home_dir .. node_bin .. ":' . $PATH")

-- Fix for clangd
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })

-- Load telescope notify
require("telescope").load_extension("notify")

-- Load telescope harpoon
require("telescope").load_extension("harpoon")

-- Disable autoformat on sql files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "sql" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Load lspkind
-- sqlls
require("lspconfig").sqlls.setup({})

-- prolog_lsp
require("lspconfig.prolog_lsp")
require("lspconfig").prolog_lsp.setup({})

-- cssls
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").cssls.setup({
  capabilities = capabilities,
})
