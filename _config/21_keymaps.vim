" 補完が出ているときTABで選択可能にする
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
noremap <C-h> <S-Left>
noremap <C-l> <S-Right>
noremap <S-h> <S-Left>
noremap <S-l> <S-Right>
noremap <C-j> <C-d>
noremap <C-k> <C-u>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap jj <Esc>
inoremap kk <Esc>
noremap ww :w<Enter>
noremap qq :q<Enter>
noremap <S-u> <C-r>
" snippet のキーバインド
imap <C-y> <Plug>(neosnippet_expand_or_jump)

" 括弧類を勝手に閉じるマン
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
