" Leader mappings

" Open last buffer
nnoremap <leader><leader> <C-^>

" Male the current buffer the only one
nnoremap <Leader>o :only<CR>

" <Leader>p -- Show the path of the current file (mnemonic: path; useful when
" you have a lot of splits and the status line gets truncated).
nnoremap <Leader>p :echo expand('%')<CR>

"fast writing 
nnoremap <Leader>w :write<CR>

"fast exiting
nnoremap <Leader>x :xit<CR>

" <LocalLeader>e -- Edit file, starting in same directory as current file.
nnoremap <Leader>e :edit <C-R>=expand('%:p:h') . '/'<CR>

