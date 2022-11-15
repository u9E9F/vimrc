""""""""""""""""""""""""""""""""""""""""
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! s:path(path)
  let path = expand(s:home . '/' . a:path )
  return substitute(path, '\\', '/', 'g')
endfunc

""""""""""""""""""""""""""""""""""""""""
if has('win32') || has('win64') || has('win95') || has('win16')
  let s:uname = 'windows'
elseif has('win32unix')
  let s:uname = 'cygwin'
elseif has('unix')
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Linux"
    let s:uname = 'linux'
  elseif v:shell_error == 0 && match(s:uname, 'Darwin') >= 0
    let s:uname = 'darwin'
  else
    let s:uname = 'posix'
  endif
else
  let s:uname = 'posix'
endif

""""""""""""""""""""""""""""""""""""""""
if !exists('g:bundle_group')
  let g:bundle_group = [
    \ 'molokai',
    \ 'airline',
    \
    \ 'system',
    \
    \ 'ale',
    \ 'neoformat',
    \ 'finder',
    \
    \ 'magic-yank',
    \
    \ 'view',
    \ 'move',
    \ 'edit',
    \ 'win',
    \
    \ 'code',
    \ 'text',
    "\ 'gutentags',
  \ ]
endif

""""""""""""""""""""""""""""""""""""""""

" motions: http://vimdoc.sourceforge.net/htmldoc/motion.html

exec 'so '.fnameescape(s:home).'/custom/script/before/main.vim'

call plug#begin('~/.vim/.plugins')
  Plug 'inkarkat/vim-ingo-library'
  Plug 'tpope/vim-obsession'
  Plug 'ojroques/vim-oscyank', {'branch': 'main'}

  if index(g:bundle_group, 'win') >= 0
    Plug 'simeji/winresizer'
    Plug 't9md/vim-choosewin'
    Plug 'szw/vim-maximizer'

    exec 'so '.fnameescape(s:home).'/custom/plugin/choosewin.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/winresizer.vim'
  endif

  if index(g:bundle_group, 'view') >= 0
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'kshenoy/vim-signature'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'inkarkat/vim-mark'

    exec 'so '.fnameescape(s:home).'/custom/plugin/indent-guides.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/signature.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/vim-mark.vim'
  endif

  if index(g:bundle_group, 'edit') >= 0
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'ervandew/supertab'
    Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

    exec 'so '.fnameescape(s:home).'/custom/plugin/tabular.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/auto-pairs.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/surround.vim'
  endif

  if index(g:bundle_group, 'move') >= 0
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-unimpaired'
    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'
    Plug 'haya14busa/incsearch-easymotion.vim'

    exec 'so '.fnameescape(s:home).'/custom/plugin/easymotion.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/incsearch-easymotion.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/unimpaired.vim'
  endif

  if index(g:bundle_group, 'finder') >= 0
    "Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    "exec 'so '.fnameescape(s:home).'/custom/plugin/LeaderF.vim'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/fzf.vim'
  endif

  if index(g:bundle_group, 'magic-yank') >= 0
    Plug 'fcpg/vim-osc52'

    xmap <F9> y:call SendViaOSC52(getreg('"'))<cr>
  endif

  if index(g:bundle_group, 'system') >= 0
    Plug 'tpope/vim-eunuch'
    Plug 'scrooloose/nerdtree'
    Plug 'skywind3000/asyncrun.vim'

    exec 'so '.fnameescape(s:home).'/custom/plugin/NerdTreeToggle.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/asyncrun.vim'
  endif

  if index(g:bundle_group, 'molokai') >= 0
    Plug 'fatih/molokai'
  endif

  if index(g:bundle_group, 'airline') >= 0
    Plug 'vim-airline/vim-airline'

    exec 'so '.fnameescape(s:home).'/custom/plugin/airline.vim'
  endif

  if index(g:bundle_group, 'code') >= 0
    Plug 'mhinz/vim-signify'
    Plug 'mhinz/vim-startify'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-projectionist'
    Plug 'kaiserhl/vim-snippets'
    Plug 'SirVer/ultisnips'
    Plug 'mh21/errormarker.vim'
    Plug 'Shougo/echodoc.vim'
    Plug 'rhysd/vim-grammarous'
    Plug 'pseewald/vim-anyfold'

    Plug 'octol/vim-cpp-enhanced-highlight', {'for':['c', 'cpp']}
    Plug 'mrtazz/DoxygenToolkit.vim', {'for':['c', 'cpp']}
    Plug 'mzlogin/vim-markdown-toc', {'for':['md']}
    Plug 'dhruvasagar/vim-table-mode', {'for':['md']}
    Plug 'justinmk/vim-syntax-extra', {'for': ['c', 'bison', 'flex', 'cpp']}
    Plug 'vim-python/python-syntax', {'for': ['python']}
    Plug 'tell-k/vim-autoflake', {'for': ['python']}
    Plug 'fisadev/vim-isort', {'for': ['python']}
    Plug 'sukima/xmledit', {'for':['html', 'xml']}
    Plug 'pprovost/vim-ps1', {'for': 'ps1'}
    Plug 'tbastos/vim-lua', {'for': 'lua'}
    Plug 'rust-lang/rust.vim', {'for': 'rust'}
    Plug 'heavenshell/vim-pydocstring', {'for':'python'}

    exec 'so '.fnameescape(s:home).'/custom/plugin/anyfold.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/startify.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/errormarker.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/UltiSnips.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/DoxygenToolkit.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/markdown-toc.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/vim-cpp-enhanced-highlight.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/vim-pydocstring.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/isort.vim'
    exec 'so '.fnameescape(s:home).'/custom/plugin/autoflake.vim'
  endif

  if index(g:bundle_group, 'ale') >= 0
    Plug 'w0rp/ale'

    exec 'so '.fnameescape(s:home).'/custom/plugin/ALE.vim'
  endif

  if index(g:bundle_group, 'neoformat') >= 0
    Plug 'sbdchd/neoformat'

    exec 'so '.fnameescape(s:home).'/custom/plugin/neoformat.vim'
  endif

  if index(g:bundle_group, 'gutentags') >= 0
    Plug 'ludovicchabant/vim-gutentags'

    exec 'so '.fnameescape(s:home).'/custom/plugin/gutentags.vim'
  endif

  if index(g:bundle_group, 'YCM') >= 0
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --go-completer --js-completer'  }

    exec 'so '.fnameescape(s:home).'/custom/plugin/YouCompleteMe.vim'
  endif

  if index(g:bundle_group, 'text') >= 0
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-indent'
    Plug 'kana/vim-textobj-syntax'
    Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
    Plug 'sgur/vim-textobj-parameter'
    Plug 'bps/vim-textobj-python', {'for': 'python'}
    Plug 'jceb/vim-textobj-uri'
  endif

call plug#end()

exec 'so '.fnameescape(s:home).'/custom/plugin/after/molokai.vim'

""""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin on
filetype plugin indent on

syntax on

"""""""""""""""""""""
let mapleader="\\"

""""""""""""""""""""
exec 'so '.fnameescape(s:home).'/custom/script/tabstop.vim'
exec 'so '.fnameescape(s:home).'/custom/script/MkNonExDir.vim'
exec 'so '.fnameescape(s:home).'/custom/script/pass.vim'

vnoremap <leader>c :OSCYank<CR>
let g:oscyank_max_length = 1000000
let g:oscyank_term = 'tmux'
