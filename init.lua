-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- My plugins
require("plugins.my-plugins")
require("plugins.toggleterm")

-- Disabled LazyVim plugins
require("plugins.disabled")

-- colorscheme
vim.cmd([[colorscheme dracula]])

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

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-c>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })
