return {
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-t>]],
        shade_terminals = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        -- float_opts = {
        --   border = "curved",
        --   winblend = 0,
        --   highlights = {
        --     border = "Normal",
        --     background = "Normal",
        --   },
        -- },
      })
    end,
  },
}
