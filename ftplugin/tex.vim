nnoremap あ a
autocmd BufWritePre * :%s/。/．/ge " 行末の無駄な空白を削除
autocmd BufWritePre * :%s/、/，/ge " 行末の無駄な空白を削除
