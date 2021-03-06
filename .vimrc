"---------------------------------------------------
" Plugins Section: Using vim-plug
" https://github.com/junegunn/vim-plug
"---------------------------------------------------
" Specify Directory for plugins
call plug#begin('~/.vim/plugged')

" List plugins here

"[1] seamless navigation between tmux and vim splits
Plug 'https://github.com/christoomey/vim-tmux-navigator'

"[2] color scheme
Plug 'morhetz/gruvbox'

"[3] Auto completion by YCM
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

" Initializes plugin system
call plug#end()


"---------------------------------------------------
" Additions and Customizations
"---------------------------------------------------
colorscheme gruvbox

let g:gruvbox_contrast_dark = 'hard'

let mapleader = " "

" Enable debugging
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'

" Load YCM (only)
let &rtp .= ',' . expand( '<sfile>:p:h' )
filetype plugin indent on

" Jump to definition
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>

" Switch between Arabic and English display and keybinding
nnoremap <silent> <leader>a :set arabic<CR>
nnoremap <silent> <leader>e :set noarabic<CR>


" Mapping the exit and write command to common mistypings
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang>     <args>
command Q q
command WQ wq
command Wq wq

" Make Y yank till end of line
nnoremap Y y$

" Auto indent
set autoindent
filetype plugin indent on

" Relative line numbers with current line number
set number relativenumber

" Spell Checking mapped to <F5> and set highlighting color
map <silent> <F5> :setlocal spell spelllang=en_us <CR>
map <silent> <F6> :set nospell<CR>

" Word Completion mapped to <F6> (not working, not useful anymore)
":map <F6> :set complete+=kspell<CR>

" Enables file type detection
syntax on

" Sets the number of spaces for a tab to 2
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" Highlights the 80th column for style specifications
set cc=80

" Solution to tmux bad colors
set background=dark

" Open splits at the bottom and right
set splitbelow splitright

" incremental search
set incsearch

" This is done to comply with quality guide lines in cs class
au BufNewFile,BufRead *.html,*.css,*.js
    \ setlocal tabstop=2 expandtab shiftwidth=2

" Changes coloring for spell checking
hi SpellBad ctermbg=gray ctermfg=black
hi SpellRare ctermbg=red
hi SpellLocal ctermbg=gray ctermfg=black
hi SpellCap ctermbg=blue ctermfg=black

" Changes coloring for YCM and ctrl p menus
hi Pmenu cterm=none ctermbg=DarkGray ctermfg=DarkYellow
