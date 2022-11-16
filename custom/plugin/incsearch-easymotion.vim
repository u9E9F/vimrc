"map z/ <Plug>(incsearch-easymotion-/)
"map z? <Plug>(incsearch-easymotion-?)
"map zg/ <Plug>(incsearch-easymotion-stay)

" https://github.com/easymotion/vim-easymotion#bonus-fuzzy-search-with-easymotion

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [
  \       incsearch#config#fuzzy#converter(),
  \       incsearch#config#fuzzyspell#converter(),
  \   ],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
