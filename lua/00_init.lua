vim.wo.number = true
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.bo.expandtab = true

vim.o.swapfile = false
vim.o.dir = '/tmp'
vim.o.smartcase = true
vim.o.laststatus = 2
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.scrolloff = 10
vim.opt.helplang = 'ja', 'en'

vim.opt.clipboard:append{'unnamedplus'}

vim.wo.wrap = false

vim.api.nvim_exec([[
  autocmd BufWritePre * :%s/\s\+$//ge
]], false)

vim.cmd 'autocmd ColorScheme * highlight htmlTagName ctermfg=226'
vim.cmd 'autocmd ColorScheme * highlight htmlTag ctermfg=14'
vim.cmd 'autocmd ColorScheme * highlight htmlEndTag ctermfg=14'
vim.cmd 'autocmd ColorScheme * highlight htmlArg ctermfg=154'
vim.cmd 'colorscheme monokai'
