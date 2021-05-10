let g:deoplete#enable_at_startup = 1
"let s:default_ignore_sources = ['around', 'dictionary', 'member', 'tag']
let s:default_ignore_sources = ['ale', 'around', 'dictionary', 'floaterm', 'lsp', 'member', 'omni', 'tag', 'LanguageClient']
let s:deoplete_custom_option = {
      \ 'auto_complete': v:true,
      \ 'auto_complete_delay': 0,
      \ 'auto_complete_popup': 'auto',
      \ 'auto_refresh_delay': 10,
      \ 'camel_case': v:true,
      \ 'ignore_case': v:true,
      \ 'ignore_sources': {
      \   '_': s:default_ignore_sources,
      \   'go': s:default_ignore_sources+['buffer'],
      \ },
      \ 'max_list': 10,
      \ 'min_pattern_length': 3,
      \ 'num_processes': 4,
      \ 'on_insert_enter': v:true,
      \ 'on_text_changed_i': v:true,
      \ 'prev_completion_mode': 'none',
      \ 'refresh_always': v:false,
      \ 'skip_chars': ['(', ')'],
      \ 'skip_multibyte': v:false,
      \ 'smart_case': v:true,
      \ }
call deoplete#custom#option(s:deoplete_custom_option)
