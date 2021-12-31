"Thanks MIT Vim class

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

filetype plugin on
set omnifunc=syntaxcomplete#Complete

syntax on
set tabstop=2
set shiftwidth=2
set hidden
set number

"natural split opening
set splitbelow
set splitright

" Search setings
set ignorecase
set smartcase

" Turn off error notifications
set noerrorbells visualbell t_vb=


let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
set pastetoggle=<f5>

set number relativenumber
set nu rnu
