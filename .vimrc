"Mapping the exit and write command to common mistypings
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang>     <args>
command Q q
command WQ wq
command Wq wq

"Auto indent
set autoindent
filetype plugin indent on

"Relative line numbers with current line number
set number relativenumber

"Spell Checking mapped to <F5>
map <F5> :setlocal spell spelllang=en_us<CR>

"Word Completion mapped to <F6> (not working, not useful anymore)
":map <F6> :set complete+=kspell<CR>

"Enables file type detection
syntax on

"Sets the number of spaces for a tab to 2
set tabstop=4

"when indenting with '>', use 4 spaces width
set shiftwidth=4

"Highlights the 80th column for style specifications
set cc=80

"Solution to tmux bad colors
set background=dark

"Open splits at the bottom and right
set splitbelow splitright

"This is done to comply with quality guide lines in cs class
au BufNewFile,BufRead *.html, *.css, *.js
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4

"---------------------------------------------------
"Plugins Section: Using vim-plug
"https://github.com/junegunn/vim-plug
"---------------------------------------------------
"Specify Directory for plugins
call plug#begin('~/.vim/plugged')

"List plugins here

"[1] seamless navigation between tmux and vim splits
Plug 'https://github.com/christoomey/vim-tmux-navigator'

"Initialzes plugin system
call plug#end()

"---------------------------------------------------
"Disabled Options
"---------------------------------------------------

"Gives the ability to put the cursor on non existting charecters
"set virtualedit=all

"disables weird behavior for vim within tmux (Didn't Work)
"if &term =~ '^screen'
    "" tmux will send xterm-style keys when its xterm-keys option is on
    "execute "set <xUp>=\e[1;*A"
    "execute "set <xDown>=\e[1;*B"
    "execute "set <xRight>=\e[1;*C"
    "execute "set <xLeft>=\e[1;*D"
"endif

