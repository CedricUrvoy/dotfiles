"
" Settings
"

scriptencoding utf-8

set autoindent "keep indent for new line
set autoread "update file if changed from outside
set history=100 "number of lines to remember, default 50
set so=7  "set 7 lines to the cursor when moving verticallyo
set lazyredraw "don't update screen during macro
set hidden " Allow to change file even if the current file isn't written
set mouse=a "Allow mouse for all modes

"if exists('+extra_search')
  set incsearch
  set hlsearch
"endif

"Clipboard
set clipboard=unnamed
if $TMUX == ''
  set clipboard+=unnamed
endif

"from stackoverflow : https://stackoverflow.com/a/3765575
if exists('+colorcolumn') "This settings show a ruler at the column 80
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"from  https://github.com/wincent/wincent/blob/e20f7e430c7ffc3eccc95e24f7466aedfbad0490/roles/dotfiles/files/.vim/plugin/settings.vim#L40
if has('folding')
  if has('windows')
    set fillchars+=fold:·
  endif
  set foldmethod=indent "fold method syntax is very slow
  set foldlevelstart=99 " start unfolded
endif

"CMD settings
set cmdheight=4
if has('showcmd')
  set showcmd " extra info at end of command line
endif
if has('wildmenu')
  set wildmenu " show options as list
endif


"Editor settings
set number "show line number in the gutter
if exists('+relativenumber')
  set relativenumber " show relative numbers in gutter
endif
set cursorline
set noshowmatch " don't jump between matching brackets
if has('linebreak')
  set linebreak " wrap long lines at characters in 'breakat'
endif
if has('linebreak')
  let &showbreak='⤷ '
endif


"Tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

"Colors
"if has('termguicolors')
"set termguicolors
"endif
" if has('termguicolors')
"   " Don't need this in xterm-256color, but do need it inside tmux.
"   " (See `:h xterm-true-color`.)
"   if &term =~# 'tmux-256color'
"     let &t_8f="\e[38;2;%ld;%ld;%ldm"
"     let &t_8b="\e[48;2;%ld;%ld;%ldm"
"   endif
" endif
