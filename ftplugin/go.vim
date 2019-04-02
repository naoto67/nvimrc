set shiftwidth=4
set tabstop=4
nnoremap <S-y> <S-k>
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:deoplete#ignore_case = 1

call plug#begin('~/.local/share/nvim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-jp/vim-go-extra'
Plug 'zchee/deoplete-go'

call plug#end()
