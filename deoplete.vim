let g:deoplete#enable_at_startup = 1
let s:default_ignore_sources = ['around', 'dictionary', 'member', 'tag']
let s:deoplete_custom_option = {
      \ 'auto_complete': v:true,
      \ 'auto_complete_delay': 0,
      \ 'auto_refresh_delay': 20,
      \ 'camel_case': v:true,
      \ 'ignore_case': v:true,
      \ 'ignore_sources': {
      \   '_': s:default_ignore_sources,
      \   'go': s:default_ignore_sources+['file', 'omni', 'tabnine'],
      \   'javascript': s:default_ignore_sources+['omni'],
      \   'python': s:default_ignore_sources+['omni', 'LanguageClient'],
      \   'typescript': s:default_ignore_sources+['omni', 'tabnine'],
      \   'yaml': s:default_ignore_sources+['buffer', 'omni'],
      \   'yaml.docker-compose': s:default_ignore_sources+['buffer', 'omni'],
      \   'vue': s:default_ignore_sources+['omni','tabnine'],
      \ },
      \ 'max_list': 20,
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
      "\ 'prev_completion_mode': 'filter', 'length', 'mirror',
call deoplete#custom#option(s:deoplete_custom_option)

"# 'c': s:default_ignore_sources+['buffer', 'omni', 'neosnippet'],
"# 'cpp': s:default_ignore_sources+['buffer', 'omni', 'neosnippet'],
"# 'dockerfile': s:default_ignore_sources+['omni'],
"
"      'lua': s:default_ignore_sources,
"      'objc': s:default_ignore_sources+['buffer', 'omni', 'neosnippet'],
"      'rust': s:default_ignore_sources+['omni'],
"      'sh': s:default_ignore_sources+['omni'],
"      'swift': s:default_ignore_sources+['omni'],
