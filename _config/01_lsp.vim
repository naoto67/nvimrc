function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd :LspDefinition <CR>
  nmap <buffer> vgd :vsplit \| :LspDefinition <CR>
  nmap <buffer> gr :LspImplementation<cr>
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
" let g:lsp_text_document_did_save_delay = 500
let g:lsp_text_document_did_save_delay = 1000
let g:lsp_diagnostics_echo_delay = 1000
let g:lsp_diagnostics_float_delay = 1000

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" let g:asyncomplete_auto_popup = 1
" let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 500
let g:lsp_text_edit_enabled = 1
let g:lsp_preview_float = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']

let g:lsp_settings = {}
let g:lsp_settings['gopls'] = {
  \  'workspace_config': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \  'initialization_options': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \}
set completeopt+=menuone
