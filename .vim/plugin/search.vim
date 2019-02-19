"
" Search Settings
"

" FZF CONF
 nmap ; :Buffers<CR>
 nmap <Leader>y :Tags<CR>
 nnoremap <c-p> :Files<CR>
 nnoremap <leader>a :Rg 
 nnoremap <c-g> :Rg! 

let g:fzf_layout = { 'down': '~100%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
	\ { 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

set grepprg=rg\ --vimgrep

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
     \   'rg --column --line-number --no-heading --fixed-strings --follow  --color=always --ignore-case --glob "!.git/*" '.shellescape(<q-args>), 1,
     \   <bang>0 ? fzf#vim#with_preview('up:60%')
     \           : fzf#vim#with_preview('right:50%:hidden', '?'),
     \   <bang>0)

