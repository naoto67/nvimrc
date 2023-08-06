let g:python3_host_prog = '/usr/bin/python3'
" let g:python_host_prog = '/usr/bin/python2'
let g:ruby_host_prog = '/usr/bin/ruby'
let g:loaded_perl_provider = 0

runtime _config/00_init.vim
runtime _config/01_lsp.vim
runtime _config/02_colorschema.vim
runtime _config/03_dein.vim
runtime _config/04_deoplete.vim
runtime _config/05_nerdtree.vim
runtime _config/10_emmet.vim
runtime _config/11_fugitive.vim
runtime _config/21_keymaps.vim
runtime _config/22_fzf.vim
" set rtp+=~/.fzf
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
nnoremap <silent><C-e> :NERDTreeToggle<CR>
