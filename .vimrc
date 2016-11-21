let g:use_colemak = 1
" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Set vim to be noncompatible with vi.
" There is no funky behavior with arrow keys this way.
set nocompatible

" Configure backspace so it acts as it should act
set backspace=indent,eol,start

" Solarized color scheme
syntax enable
"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized
colorscheme SolarizedDarkCinnamon

" Underline the cursor line.
set cursorline
"highlight Cursorline cterm=bold 
"hi CursorLine term=bold cterm=bold guibg=Grey40
hi CursorLine term=bold cterm=bold 

" allow to copy from and to clipboard
set clipboard=unnamedplus

" Set autoindentation
set autoindent


" Cyrillic support
"set keymap=russian-jcukenwin
"set iminsert=0
"set imsearch=0


" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
" No need to press shift every time to write or exite a file
nnoremap ; :

set hlsearch


"" Enters normal mode using jk
if (exists("g:use_colemak") && g:use_colemak == 0)
    "imap <C-f> <Esc>
    imap jk <Esc>
    " Easy window navigation
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
endif


" Colemak Hackery
if (exists("g:use_colemak") && g:use_colemak == 1)

    " e -> k, moving cursor up using "e" (old "k")
	noremap e k
    " i -> l, moving left using "i" (old "l")
	noremap i l
    " "i" was insert, make "s" to be insert
	noremap s i
    noremap S I
    noremap N J
    " n -> j, moving down using "n" (old "j")
	noremap n j
    " Connect lines using "N" instead of old "J"
    " Next in search is "k", old "n"
    noremap k n
    " Previous in search is "K", old "N"
    noremap K N

    " noremap ; p

    " Easy window navigation
    noremap <C-h> <C-w>h
    noremap <C-n> <C-w>j
    noremap <C-e> <C-w>k
    noremap <C-i> <C-w>l

    " Easy window resizing
    noremap <C-u> <C-w>=
    noremap <C-m> <C-w>_
    "imap ne <Esc>

    "nnoremap <silent> N @='5n'<CR>|xnoremap <silent> N @='5n'<CR>|onoremap N 5h|
endif

autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
