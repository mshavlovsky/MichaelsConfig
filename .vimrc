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
