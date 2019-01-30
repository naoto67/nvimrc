set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set showmatch          " 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
autocmd BufWritePre * :%s/\s\+$//ge " 行末の無駄な空白を削除

colorscheme delek
" カラースキーマの微妙な設定 :highlightで詳細を確認できる
" :help group-nameでなんかできる
" :so $VIMRUNTIME/syntax/hitest.vim 現在の色設定の確認
" temp 以下のterm_color.plを実行するとctermfg が調べられるよ
autocmd ColorScheme * highlight LineNr ctermfg=226 guifg=#ffff00
autocmd ColorScheme * highlight htmlTagName ctermfg=226
autocmd ColorScheme * highlight htmlTag ctermfg=14
autocmd ColorScheme * highlight htmlEndTag ctermfg=14
autocmd ColorScheme * highlight htmlArg ctermfg=154

" 括弧類を勝手に閉じるマン
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

call plug#begin('~/.local/share/nvim/plugged')
" rails の 色々
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

" vue の syntax
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

" html emmet
Plug 'mattn/emmet-vim'
call plug#end()

" emmetのキーボードバインディング
let g:user_emmet_leader_key = "<C-f>"
