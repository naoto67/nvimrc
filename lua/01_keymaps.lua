-- 補完が出ているときTABで選択可能にする
-- vim.api.nvim_set_keymap('i', '<TAB>', 'pumvisible() and "\\<C-n>" or "\\<TAB>"', { expr = true })
-- vim.api.nvim_set_keymap('i', '<S-TAB>', 'pumvisible() and "\\<C-p>" or "\\<S-TAB>"', { expr = true })

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

-- copilotのキーマッピング
-- vim.api.nvim_set_keymap('i', '<C-[>', '<Plug>(copilot-previous)', {})
-- vim.api.nvim_set_keymap('i', '<C-]>', '<Plug>(copilot-next)', {})

-- クリップボードからペースト
vim.api.nvim_set_keymap('n', '<D-v>', '"+p<CR>', {})
