return {
  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
      })
    end,
  },

  -- Multiple cursors
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
  },

  -- Rainbow parentheses
  {
    "mrjones2014/nvim-ts-rainbow",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
        },
      })
    end,
  },

  -- Java config
  {
    "mfussenegger/nvim-jdtls",
    lazy = false,
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.black,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
          nls.builtins.formatting.prettierd,
        },
      }
    end,
  },

  -- Zen Mode
  {
    "folke/zen-mode.nvim",
    lazy = false,
    config = function()
      require("zen-mode").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },

  -- Screen saver
  {
    "folke/drop.nvim",
    event = "VimEnter",
    lazy = false,
    config = function()
      require("drop").setup()
    end,
  },

  --Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    ft = { "markdown" },
  },

  -- Markdown mappings
  {
    "antonk52/markdowny.nvim",
    lazy = false,
    config = function()
      require("markdowny").setup({ filetypes = { "markdown" } })
    end,
  },
}
