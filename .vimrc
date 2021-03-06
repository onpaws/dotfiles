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

colorscheme solarized
let g:solarized_termtrans=1

"Set 'nocompatible' to ward off unexpected things that your distro might
"have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible


" VUNDLE BEGIN >>>>>>>>>>>>>>
"Formerly used Tim Pope's Pathogen, see https://github.com/tpope/vim-pathogen
"Now I use Vundle https://github.com/gmarik/Vundle.vim
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" VUNDLEEND <<<<<<<<<<<<<<<<<<<<<<<<<

" vim-airline - unicode status line
 if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"    ____                           _
"   / ___| ___ _ __   ___ _ __ __ _| |
"  | |  _ / _ \ '_ \ / _ \ '__/ _` | |
"  | |_| |  __/ | | |  __/ | | (_| | |
"   \____|\___|_| |_|\___|_|  \__,_|_|

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
set history=10000

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" If a file is changed outside of vim, automatically reload it without asking
set autoread

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

"alternative color scheme
set background=dark
"colorscheme solarized
let g:solarized_termtrans=1


"increase default font size for MacVim
set guifont=Menlo\ Regular:h14

"enable mouse in terminals. works for PuTTY!
set mouse=a

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

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

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
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
if executable("ag")
  set grepprg=ag\ -H\ --nogroup\ --nocolor
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
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif


augroup vimrcEx
  " Restore cursor on file open
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal g`\"" |
    \ endif

	"for ruby, autoindent with two spaces, always expand tabs
	autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
	autocmd FileType python set sw=4 sts=4 et
augroup END


" Multipurpose Tab Key
" Indent if we're at beginning of file, else do intellisense-style
" autocomplete
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Rename current file
function! RenameFile()
	let old_name = expand('%')
	let new_name = input('New file name: ', expand('%'))
	if new_name != '' && new_name != old_name
		exec ':saveas ' . new_name
		exec ':silent !rm ' . old_name
		redraw!
	endif
endfunction
map <leader>n :call RenameFile()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters COMMAND
" Remove smart quotes, etc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()