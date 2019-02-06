"
" Theme settings
"

if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark
colorscheme nord

"let g:nord_italic=1
"let g:nord_italic_comments=1
"let g:nord_comment_brightness=15

autocmd! BufEnter,BufNewFile *.taskpaper colorscheme default
autocmd! BufLeave  *.taskpaper colorscheme nord

" air-line conf
let g:airline_powerline_fonts=1
let g:airline_theme='nord'
let g:airline_skip_empty_sections=1
let g:airline_section_y=''

