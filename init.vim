"---------------------------------------------------
" Plugins Section: Using vim-plug
" https://github.com/junegunn/vim-plug
"---------------------------------------------------
" Specify Directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" List plugins here

"[1] seamless navigation between tmux and vim splits
Plug 'https://github.com/christoomey/vim-tmux-navigator'

"[2] color scheme
Plug 'morhetz/gruvbox'

"[4] Linter and style checker with autocompletion features"
Plug 'dense-analysis/ale'

"[5] markdown compilation
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

let g:plug_timeout = 120

" Initializes plugin system
call plug#end()


"---------------------------------------------------
" Additions and Customizations
"---------------------------------------------------
colorscheme gruvbox

let g:gruvbox_contrast_dark = 'hard'

set guicursor=n-v-c:block-Cursor/lCursor,ve:ver25-Cursor,o:hor50-Cursor

let mapleader = " "

" Enable debugging
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_server_python_interpreter = $CONDA_PREFIX . '/bin/python'

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

" Search
set incsearch
set hlsearch
"This unsets the "last search pattern" register by hitting return
nnoremap <nowait><silent> <CR> :noh<CR><CR>

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

" Persistent undo
set undofile
set undodir=$HOME/.local/share/nvim/undo
set undolevels=1000
set undoreload=10000

" Switching buffers only hides rather than close
set hidden

nnoremap <leader>b :ls<CR>:b<space>
nnoremap <leader><Right> :bnext<CR>
nnoremap <leader><Left> :bprevious<CR>

let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ale_virtualtext_cursor = 'current'

" Use Python from the active Conda environment
let g:ale_python_flake8_executable = $CONDA_PREFIX . '/bin/python'
let g:ale_enabled = 1

" Customize ALE warning and error colors in Vim script
" Use a muted color for warnings
hi ALEWarning ctermfg=DarkGray ctermbg=none guifg=#928374 guibg=none
hi ALEError ctermfg=Red ctermbg=none guifg=#FB4934 guibg=none

let g:python3_host_prog = '/usr/local/anaconda3/envs/ml/bin/python'
