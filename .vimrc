" Pat's fun little list of shortcuts:
" ; == :   i.e. ;w will work as :w
" <leader> is comma
" in insert mode, jj escapes out to command mode
"Ctrl-l removes highlights
"Ctrl-j shows/hides tabs and trailing whitespace
"CTRL-X CTRL-N and CTRL-X CTRL-P do autocomplete-y things
"NERDTree: use ma to create a new file at the selected node

" SCROLLING TIPS:
" zz centers window on the cursor's line
" ctrl-e ctrl-y scroll viewport up / down
"w!! writes to read-only files

"Use Tim Pope's Pathogen, see https://github.com/tpope/vim-pathogen
"call pathogen#infect()

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

"Set history length longer
set history=1000

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

"  _   _ ___ 
" | | | |_ _|
" | | | || | 
" | |_| || | 
"  \___/|___|

" Map the so-called <leader> key to comma (backslash is default)
let mapleader = ","

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

" Make Vim more useful
set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable line numbers
set number

"Set title in terminals
set title

"Show all auto-complete options, not just first one
set wildmenu

"Auto-complete shell-style; i.e. complete up to point of ambiguity
set wildmode=list:longest

"Scroll when cursor is 3 lines away from top/bottom
set scrolloff=3

"Scroll viewport 3 lines instead of 1 with ctrl-e ctrl-y
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"Ctrl-J reveals ASCII (tabs and trailing whitespaces)
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <C-j> :set nolist!<CR>

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
nmap <lEeader>l :set list!<CR>
 
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

" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif