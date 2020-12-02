function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-implementation)
  nmap <buffer> <f2> <plug>(lsp-rename)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

" 重いため0でエラーを出さない
let g:lsp_diagnostics_enabled = 1
" let g:lsp_diagnostics_echo_cursor = 0
" let g:lsp_diagnostics_float_cursor = 0
" let g:asyncomplete_auto_popup = 1
" ディスクリプションを表示しない
" let g:asyncomplete_auto_completeopt = 0
" let g:asyncomplete_popup_delay = 200
" let g:lsp_text_edit_enabled = 1
let g:lsp_log_verbose = 0
let g:lsp_log_file = ""
let g:lsp_text_document_did_save_delay = 500
