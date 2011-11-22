" Shortcuts:
" ; == :   i.e. ;w will work as :w
" in insert mode, jj escapes out to command mode
"Ctrl-l removes highlights
"w!! writes to read-only files

"    ____                           _ 
"   / ___| ___ _ __   ___ _ __ __ _| |
"  | |  _ / _ \ '_ \ / _ \ '__/ _` | |
"  | |_| |  __/ | | |  __/ | | (_| | |
"   \____|\___|_| |_|\___|_|  \__,_|_|
"Set 'nocompatible' to ward off unexpected things that your distro might
"have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

"Set the default encoding to utf-8
set encoding=utf-8

"Automatic file type detection based on name and possible contents
"Intelligent auto-indenting and plugins that are filetype specific
filetype plugin indent on

"w!! writes to read-only files. 
cmap w!! %!sudo tee > /dev/null %

"open new line to the same indent as the current line
set autoindent
set smartindent

"remap ; to : to save pushing shift all the time
nnoremap ; :
" don't remap : to ; because it seems to break plugins

"Quick escaping - finger already on jj
inoremap jj <ESC>
"FYI, ctrl-c and ctrl-[ also escape

"  _   _ ___ 
" | | | |_ _|
" | | | || | 
" | |_| || | 
"  \___/|___|
"Switch syntax highlighting on, when the terminal has colors
"Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif

"nice color scheme
colorscheme desert

"increase default font size for MacVim
set guifont=Menlo\ Regular:h14

"enable mouse in terminals. works for PuTTY!
set mouse=a

"Display line numbers
set number

" _____                 _   _
"|   __|___ ___ ___ ___| |_|_|___ ___
"|__   | -_| .'|  _|  _|   | |   | . |
"|_____|___|__,|_| |___|_|_|_|_|_|_  |
"                                |___|
"makes vim use normal regexes by adding \v before search string.
nnoremap / /\v
vnoremap / /\v

"when searching ignore case unless you have both upper and lower
set ignorecase
set smartcase

"highlight as search becomes more specific 
set incsearch
set showmatch
set hlsearch 

"clear highlights with ctrl-l
nmap <silent> <C-l> :noh<CR>

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif


" _____     _
"|_   _|___| |_ ___
"  | | | .'| . |_ -|
"  |_| |__,|___|___|

"tab width = four spaces
set tabstop=4

set shiftwidth=4
set softtabstop=4

" expand tabs into spaces
" set expandtab

" _____ _       _              __    _
"|   __| |_ ___| |_ _ _ ___   |  |  |_|___ ___
"|__   |  _| .'|  _| | |_ -|  |  |__| |   | -_|
"|_____|_| |__,|_| |___|___|  |_____|_|_|_|___|
"more informative status line
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
"set statusline=%1*%F%m%r%h%w%=%(%c%V\ %l/%L\ %P%)
"set statusline=\%{strftime(\"\%c\",getftime(expand(\"\%\%\")))}
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

"always show status line
set laststatus=2

"disable F1 for help (:help still works)
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>\ ,eol:$

"  _                                                  
" | |    __ _ _ __   __ _ _   _  __ _  __ _  ___  ___ 
" | |   / _` | '_ \ / _` | | | |/ _` |/ _` |/ _ \/ __|
" | |__| (_| | | | | (_| | |_| | (_| | (_| |  __/\__ \
" |_____\__,_|_| |_|\__, |\__,_|\__,_|\__, |\___||___/
"                   |___/             |___/                              
"""HTML"""
""""""""""
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

"""PYTHON"""
""""""""""""
" Full Python syntax highlighting, when combined with 'syntax on' above
let python_highlight_all=1

" Remove any extra whitespace from the ends of lines when saving a file
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``





