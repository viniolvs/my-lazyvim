return {
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
    -- config = function ()
    --   require('lspconfig').jdtls.setup{}
    -- end
  },
}
