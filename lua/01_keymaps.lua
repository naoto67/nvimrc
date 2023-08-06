-- キーバインドの変換
vim.api.nvim_set_keymap('n', '<C-h>', '<S-Left>', {})
vim.api.nvim_set_keymap('n', '<C-l>', '<S-Right>', {})
vim.api.nvim_set_keymap('n', '<S-h>', '<S-Left>', {})
vim.api.nvim_set_keymap('n', '<S-l>', '<S-Right>', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-d>', {})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-u>', {})
vim.api.nvim_set_keymap('i', '<C-j>', '<down>', {})
vim.api.nvim_set_keymap('i', '<C-k>', '<up>', {})
vim.api.nvim_set_keymap('i', '<C-h>', '<left>', {})
vim.api.nvim_set_keymap('i', '<C-l>', '<right>', {})
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})
vim.api.nvim_set_keymap('i', 'kk', '<Esc>', {})
vim.api.nvim_set_keymap('n', 'ww', ':w<CR>', {})
vim.api.nvim_set_keymap('n', 'qq', ':q<CR>', {})
vim.api.nvim_set_keymap('n', '<S-u>', '<C-r>', {})

-- FzfLuaコマンドのキーマッピング
vim.api.nvim_set_keymap('n', '<C-f>', ':FzfLua files<CR>', {})
vim.api.nvim_set_keymap('n', '<C-b>', ':FzfLua buffers<CR>', {})
vim.api.nvim_set_keymap('n', '<S-f>', ':FzfLua live_grep<CR>', {})

-- snippetのキーバインド
-- vim.api.nvim_set_keymap('i', '<C-y>', '<Plug>(neosnippet_expand_or_jump)', {})

-- 括弧の自動挿入
vim.api.nvim_set_keymap('i', '{<CR>', '{}<Left><CR><ESC><S-o', {})
vim.api.nvim_set_keymap('i', '[<CR>', '[]<Left><CR><ESC><S-o', {})
vim.api.nvim_set_keymap('i', '(', '()<Left><Esc>i', {})

vim.api.nvim_set_keymap('n', '<D-v>', '"+p<CR>', {})

-- nvim-tree
vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeToggle<CR>', {})
vim.api.nvim_set_keymap('n', '<C-r>', ':NvimTreeRefres<CR>', {})
