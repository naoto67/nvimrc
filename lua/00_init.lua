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
vim.opt.splitright = true
vim.g.encoding="UTF-8"

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

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "plugins.lua" },
  command = "PackerCompile",
})

vim.g.gitgutter_highlight_lines = 0
vim.cmd 'highlight GitGutterAdd ctermfg=green'
vim.opt.updatetime = 1000

-- tree setting
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
