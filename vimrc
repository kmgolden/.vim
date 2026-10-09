"Thanks MIT Vim class
"
" Portable config: keep machine- or employer-specific settings out of this repo.
" Put them in ~/.vimrc.local (sourced at the end, never committed).

set nocompatible
set encoding=utf-8

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" Unbind some useless/annoying default key bindings.
" 'Q' in normal mode enters Ex mode. You almost never want this.
nnoremap Q <Nop>

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
syntax on

set tabstop=2
set shiftwidth=2
set hidden
set number relativenumber
set pastetoggle=<f5>

" lightline shows the mode, so hide the default one
set laststatus=2
set noshowmode

"natural split opening
set splitbelow
set splitright

" Search settings
set ignorecase
set smartcase
set incsearch

" Turn off error notifications
set noerrorbells visualbell t_vb=

" Keep swap/backup/undo/netrw files out of working trees (so they never land in
" a repo by accident). Trailing // encodes the full path in the file name.
let s:state = expand('~/.vim/state')
for s:dir in ['swap', 'backup', 'undo']
  if !isdirectory(s:state . '/' . s:dir)
    call mkdir(s:state . '/' . s:dir, 'p')
  endif
endfor
let &directory = s:state . '/swap//'
let &backupdir = s:state . '/backup//'
let &undodir   = s:state . '/undo//'
set undofile
let g:netrw_home = s:state

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }

" True color where the terminal supports it. Native Windows vim needs it to
" render italics/bold as font styles instead of console color pairs.
if has('termguicolors') && (has('win32') || $COLORTERM =~# 'truecolor\|24bit' || exists('$WT_SESSION'))
  try
    set termguicolors
  catch /E954/
    " console without VT support: stay on 16/256 colors
  endtry
endif

set background=dark
packadd! dracula
silent! colorscheme dracula

let g:astro_typescript = 'enable'

" Syntax highlighting inside fenced Markdown code blocks
" (Markdown display settings live in after/ftplugin/markdown.vim)
let g:markdown_fenced_languages = ['sh', 'vim', 'json', 'html', 'css',
      \ 'js=javascript', 'ts=typescript']

" Machine-local overrides (not in this repo).
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
