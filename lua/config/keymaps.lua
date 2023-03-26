-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Zen mode
vim.api.nvim_set_keymap("n", "<leader>z", ":ZenMode<CR>", { silent = true, noremap = true })

-- Harpoon
vim.api.nvim_set_keymap(
  "n",
  "<leader>ht",
  ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ha",
  ":lua require('harpoon.mark').add_file()<CR>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>hn",
  ":lua require('harpoon.ui').nav_next()<CR>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>hp",
  ":lua require('harpoon.ui').nav_prev()<CR>",
  { silent = true, noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>uh", ":Telescope harpoon marks<CR>", { silent = true, noremap = true })

-- replace with yanked text
vim.api.nvim_set_keymap("n", "<leader>p", '"0p', { silent = true, noremap = true })
-- delete without yanking
vim.api.nvim_set_keymap("n", "<leader>d", '"_d', { silent = true, noremap = true })

--Copilot keymap
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-c>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- notify keymap
vim.api.nvim_set_keymap("n", "<leader>ut", ":Telescope notify<CR>", { silent = true, noremap = true })

-- Toggle all terminal windows
vim.api.nvim_set_keymap("n", "<leader>tt", ":ToggleTermToggleAll<CR>", { silent = true, noremap = true })

-- Togle terminal windows
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Markdown Preview
vim.cmd("autocmd FileType markdown nmap <leader>mp :MarkdownPreview<CR>")

-- NavBuddy
vim.api.nvim_set_keymap("n", "<leader>n", ":Navbuddy<CR>", { silent = true, noremap = true })
