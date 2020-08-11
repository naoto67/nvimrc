let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
let g:ruby_host_prog = $HOME.'/.rbenv/shims/ruby'

nnoremap <C-]> g<C-]>
inoremap <C-]> <ESC>g<C-]>

set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard+=unnamedplus  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set showmatch          " 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set noswapfile         " swap file を作らない
set scrolloff=10        " スクロール時に下が見えるようにする
set virtualedit=onemore " 行末1文字までカーソルを移動できるようにする
set history=100
" set undofile            " ファイルを閉じてもundoできるようにする
autocmd BufWritePre * :%s/\s\+$//ge " 行末の無駄な空白を削除

autocmd ColorScheme * highlight htmlTagName ctermfg=226
autocmd ColorScheme * highlight htmlTag ctermfg=14
autocmd ColorScheme * highlight htmlEndTag ctermfg=14
autocmd ColorScheme * highlight htmlArg ctermfg=154

" 括弧類を勝手に閉じるマン
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

if &compatible
  set nocompatible
endif

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = $HOME . '/.config/nvim/dein.toml'
let s:lazy_toml_file = $HOME . '/.config/nvim/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:lazy_toml_file, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" emmetのキーボードバインディング
let g:user_emmet_leader_key = "<C-f>"

" git gutter のハイライト
let g:gitgutter_highlight_lines = 0
highlight GitGutterAdd ctermfg=green
highlight GitGutterAdd ctermfg=red
set updatetime=1000

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
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
colorscheme monokai
"

" let g:go_fmt_command = "goimports"
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

" let g:coc_global_extensions = ['coc-solargraph']
let g:dein#auto_recache = 1

function! s:typescript() abort
  ALEEnable
  call asyncomplete#enable_for_buffer()
  map <buffer> <C-]> <Plug>(ale_go_to_definition)
  imap <buffer> <C-Space> <Plug>(asyncomplete_force_refresh)
endfunction

augroup TypeScript
  autocmd!
  autocmd FileType typescript call s:typescript()
augroup END
