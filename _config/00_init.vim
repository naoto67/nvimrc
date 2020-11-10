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
autocmd BufRead,BufNewFile *.jbuilder setfiletype ruby
