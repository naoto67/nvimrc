local keymap_opts = { noremap = true, silent = false }

-- キーバインドの変換 vim.api.nvim_set_keymap("n", "<C-h>", "<S-Left>", keymap_opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<S-Right>", keymap_opts)
vim.api.nvim_set_keymap("n", "<S-h>", "<S-Left>", keymap_opts)
vim.api.nvim_set_keymap("n", "<S-l>", "<S-Right>", keymap_opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-d>", keymap_opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-u>", keymap_opts)
vim.api.nvim_set_keymap("n", "ww", ":w<CR>", keymap_opts)
vim.api.nvim_set_keymap("n", "qq", ":q<CR>", keymap_opts)
vim.api.nvim_set_keymap("n", "<S-u>", ":red<CR>", keymap_opts)
vim.api.nvim_set_keymap("v", "<C-h>", "<S-Left>", keymap_opts)
vim.api.nvim_set_keymap("v", "<C-l>", "<S-Right>", keymap_opts)
vim.api.nvim_set_keymap("v", "<S-h>", "<S-Left>", keymap_opts)
vim.api.nvim_set_keymap("v", "<S-l>", "<S-Right>", keymap_opts)
vim.api.nvim_set_keymap("v", "<C-j>", "<C-d>", keymap_opts)
vim.api.nvim_set_keymap("v", "<C-k>", "<C-u>", keymap_opts)
vim.api.nvim_set_keymap("v", "ww", ":w<CR>", keymap_opts)
vim.api.nvim_set_keymap("v", "qq", ":q<CR>", keymap_opts)
vim.api.nvim_set_keymap("v", "<S-u>", ":red<CR>", keymap_opts)
vim.api.nvim_set_keymap("i", "<C-j>", "<down>", keymap_opts)
vim.api.nvim_set_keymap("i", "<C-k>", "<up>", keymap_opts)
vim.api.nvim_set_keymap("i", "<C-h>", "<left>", keymap_opts)
vim.api.nvim_set_keymap("i", "<C-l>", "<right>", keymap_opts)
vim.api.nvim_set_keymap("i", "jj", "<Esc>", keymap_opts)
vim.api.nvim_set_keymap("i", "kk", "<Esc>", keymap_opts)

-- nvim-tree
vim.api.nvim_set_keymap("n", "<C-E>", ":NvimTreeToggle<CR>", keymap_opts)
vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeFindFileToggle<CR>", keymap_opts)
vim.api.nvim_set_keymap("n", "<C-r>", ":NvimTreeRefres<CR>", keymap_opts)

-- vim.keymap.set("n", "<leader>tt", "<cmd>:GoTest -p -a -test.count=1<cr>", keymap_opts)
-- vim.keymap.set("n", "<leader>tr", "<cmd>:GoTest -n -a -test.count=1<cr>", keymap_opts)
-- vim.keymap.set("n", "<leader>tf", "<cmd>:GoTest -f -a -test.count=1<cr>", keymap_opts)
-- vim.keymap.set("n", "<leader>tc", "<cmd>:GoTermClose<cr>", keymap_opts)
-- vim.keymap.set("n", "<leader>gg", "<cmd>:GoGenerate<cr>", keymap_opts)

vim.keymap.set("n", "<leader>gl", "<cmd>:LazyGit<cr>", keymap_opts)

vim.api.nvim_set_keymap("i", "<C-t>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.api.nvim_set_keymap("n", "<leader>gb", '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>', { silent = true })
vim.api.nvim_set_keymap("v", "<leader>gb", '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>', { silent = true })
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>gb",
-- 	'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
-- 	{ silent = true }
-- )
-- vim.api.nvim_set_keymap(
-- 	"v",
-- 	"<leader>gb",
-- 	'<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
-- 	{ silent = true }
-- )
