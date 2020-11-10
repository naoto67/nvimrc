let g:deoplete#enable_at_startup = 1
let s:deoplete_custom_option = {
      \ 'auto_complete': v:true,
      \ 'auto_complete_delay': 0,
      \ 'auto_refresh_delay': 20,
      \ 'camel_case': v:true,
      \ 'ignore_case': v:true,
      \ 'max_list': 30,
      \ 'min_pattern_length': 1,
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
