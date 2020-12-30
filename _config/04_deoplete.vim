let g:deoplete#enable_at_startup = 1
let s:default_ignore_sources = ['around', 'dictionary', 'member', 'tag']
let s:deoplete_custom_option = {
      \ 'auto_complete': v:true,
      \ 'auto_complete_delay': 50,
      \ 'auto_refresh_delay': 100,
      \ 'camel_case': v:true,
      \ 'ignore_case': v:true,
      \ 'ignore_sources': {
      \   '_': s:default_ignore_sources,
      \ },
      \ 'max_list': 15,
      \ 'min_pattern_length': 3,
      \ 'num_processes': 16,
      \ 'on_insert_enter': v:true,
      \ 'on_text_changed_i': v:true,
      \ 'prev_completion_mode': 'none',
      \ 'refresh_always': v:false,
      \ 'skip_chars': ['(', ')'],
      \ 'skip_multibyte': v:false,
      \ 'smart_case': v:true,
      \ }
call deoplete#custom#option(s:deoplete_custom_option)
