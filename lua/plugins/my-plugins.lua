return {
  -- Colorscheme
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    config = function()
      require("dracula").setup({
        transparent_bg = true,
        italic_comment = true,
      })
    end,
  },

  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
      })
    end,
  },

  -- Modicator
  {
    "mawkler/modicator.nvim",
    dependencies = "Mofiqul/dracula.nvim", -- Add your colorscheme plugin here,
    lazy = false,
    config = function()
      local modicator = require("modicator")
      -- local colors = require("dracula").colors()
      local colors = require("catppuccin.palettes").get_palette("macchiato")
      modicator.setup({
        highlights = {
          defaults = {
            bold = true,
          },
          modes = {
            ["n"] = {
              foreground = colors.blue,
            },
            ["i"] = {
              foreground = colors.green,
            },
            ["v"] = {
              foreground = colors.mauve,
            },
            ["V"] = {
              foreground = colors.mauve,
            },
            ["�"] = { -- This symbol is the ^V character
              foreground = colors.mauve,
            },
            ["s"] = {
              foreground = colors.orange,
            },
            ["S"] = {
              foreground = colors.orange,
            },
            ["R"] = {
              foreground = colors.red,
            },
            ["c"] = {
              foreground = colors.orange,
            },
          },
        },
      })
    end,
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = { extensions = { "toggleterm" } },
  },

  -- Notify
  {
    "rcarriga/nvim-notify",
    opts = { background_colour = "#000000", lazy = false },
  },

  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
      })
      opts.window = {
        completion = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
        }),
      }
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        {
          name = "buffer",
          opts = {
            keyword_pattern = [[\k\+]],
          },
        },
      })
    end,
  },

  -- Copilot
  {
    "github/copilot.vim",
    lazy = false,
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
  -- {
  --   "folke/drop.nvim",
  --   event = "VimEnter",
  --   enable = false,
  --   config = function()
  --     require("drop").setup()
  --   end,
  -- },

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

  -- Trailblazer
  {
    "LeonHeidelbach/trailblazer.nvim",
    lazy = false,
    config = function()
      require("trailblazer").setup({
        -- your custom config goes here
      })
    end,
  },
}
