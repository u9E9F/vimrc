" https://github.com/pseewald/vim-anyfold
"
" Use Vim's fold commands
" zo, zO, zc, za, ... to fold / unfold folds
" (read :h fold-commands for more information).
"
"zM		Close all folds: set 'foldlevel' to 0. 'foldenable' will be set.
"zR		Open all folds.  This sets 'foldlevel' to highest fold level.


" Use key combinations [[ and ]] to navigate to the beginning and end of the
" current open fold.

" Use ]k and [j to navigate to the end of the previous block and to the
" beginning of the next block.



autocmd Filetype * AnyFoldActivate " activate for all filetypes
set foldlevel=0 " close all folds


"autocmd Filetype <your-filetype> AnyFoldActivate " activate for a specific filetype
"set foldlevel=99 " Open all folds
