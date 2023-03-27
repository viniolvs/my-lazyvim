-- need to run to install the server:
-- swipl
-- pack_install(prolog_lsp).
-- and add the following file to your project:
-- file name: pack.pl
-- name(lsp_server).
-- title('A Prolog LSP Server').
-- version('2.2.8').
-- author('James N. V. Cash', 'james.cash@occasionallycogent.com').
-- home('https://github.com/jamesnvc/lsp_server').
-- download('https://github.com/jamesnvc/lsp_server/releases/*.zip').
-- provides(lsp_server).

local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

configs.prolog_lsp = {
  default_config = {
    cmd = {
      "swipl",
      "-g",
      "use_module(library(lsp_server)).",
      "-g",
      "lsp_server:main",
      "-t",
      "halt",
      "--",
      "stdio",
    },
    filetypes = { "prolog" },
    root_dir = util.root_pattern("pack.pl"),
  },
  docs = {
    description = [[
    https://github.com/jamesnvc/prolog_lsp

    Prolog Language Server
    ]],
  },
}
-- vim:et ts=2 sw=2
