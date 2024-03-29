let g:write_only_mode = 0

if has('nvim')
    set termguicolors

    call plug#begin('~/.vim/plugged')

        " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"        Plug 'junegunn/vim-easy-align'
        Plug 'iCyMind/NeoSolarized'
"      "  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
        Plug 'lervag/vimtex'
"        Plug 'darfink/vim-plist'
"        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

    call plug#end()   
     "vimtex parameters
    let g:tex_flavor  = 'latex'
    let g:tex_conceal = ''
    let g:vimtex_fold_manual = 1
    let g:vimtex_latexmk_continuous = 1
    let g:vimtex_compiler_progname = 'nvr'
    "let g:vimtex_view_method = 'zathura'
    let g:vimtex_quickfix_latexlog = {'default' : 0}
    "let g:vimtex_view_general_viewer = 'zathura'
   " let g:vimtex_view_general_viewer = 'open'
   " let g:vimtex_view_general_options = '-a TeXShop'
    let g:vimtex_view_general_viewer = 'cust_pdf.sh'

    "set background=dark
    "set background=light
    colorscheme NeoSolarized

  "  " Use deoplete.
  "  let g:deoplete#enable_at_startup = 1

  "  if !exists('g:deoplete#omni#input_patterns')
  "      "let g:deoplete#omni#input_patterns = {}
  "      " deoplete tab-complete
  "      inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  "  endif

    " use <tab> for trigger completion and navigate to next complete item
"    function! s:check_back_space() abort
"      let col = col('.') - 1
"      return !col || getline('.')[col - 1]  =~ '\s'
"    endfunction
"
"    inoremap <silent><expr> <TAB>
"          \ pumvisible() ? "\<C-n>" :
"          \ <SID>check_back_space() ? "\<TAB>" :
"          \ coc#refresh()
"
"    " Use K for show documentation in preview window
"    nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"    function! s:show_documentation()
"      if &filetype == 'vim'
"        execute 'h '.expand('<cword>')
"      else
"        call CocAction('doHover')
"      endif
"    endfunction
"
"    " Remap keys for gotos
"    nmap <silent> gd <Plug>(coc-definition)
"    nmap <silent> gy <Plug>(coc-type-definition)
"    nmap <silent> gi <Plug>(coc-implementation)
"    nmap <silent> gr <Plug>(coc-references)


	"noremap d d
    
else
    execute pathogen#infect()
endif
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

if has('nvim')
else
    "set background=dark
    set background=light
    colorscheme solarized
endif
"colorscheme SolarizedDarkCinnamon

" Underline the cursor line.
set cursorline
"highlight Cursorline cterm=bold 
"hi CursorLine term=bold cterm=bold guibg=Grey40
hi CursorLine term=bold cterm=bold 

" allow to copy from and to clipboard
set clipboard+=unnamed

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

"set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
" No need to press shift every time to write or exite a file
"nnoremap ; :
"noremap : ;

set hlsearch


"" Enters normal mode using jk
if (exists("g:use_colemak") && g:use_colemak == 0)
    "imap <C-f> <Esc>
    imap jk <Esc>
    " Easy window navigation


endif


" Colemak Hackery
if (exists("g:use_colemak") && g:use_colemak == 1)

    " e -> k, moving cursor up using "e" (old "k")
	noremap e k
	"noremap k e
    "i -> l, moving left using "i" (old "l")
    nnoremap i l
    vnoremap i l
    "noremap l i
    "noremap i <Nop>
	"noremap I l
	"noremap i w
    noremap H h
    "noremap h b
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
    "noremap K N

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

if (exists("g:write_only_mode") && g:write_only_mode == 1)
    noremap d <Nop>
    noremap dd <Nop>
    noremap D <Nop>
    noremap x <Nop>
    noremap r <Nop>
    inoremap <backspace> <Nop>
    inoremap <Del> <Nop>
endif

autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
set lazyredraw
set ruler
set spell

"noremap <C-]> <C-w>l
"noremap <C-[> <C-w>h


au FileType tex setl shiftwidth=2 tabstop=2

" From here https://aonemd.github.io/blog/handy-keymaps-in-vim


let mapleader="\<Space>"
nnoremap <leader>w :w<cr>
" Replace the word under coursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

if has('nvim')
    " Put these lines at the very end of your vimrc file.

    " Load all plugins now.
    " Plugins need to be added to runtimepath before helptags can be generated.

 "   packloadall

    " Load all of the helptags now, after plugins have been loaded.
    " All messages and errors will be ignored.

 "   silent! helptags ALL

    "vmap d dd
endif

syntax on
hi Visual term=reverse cterm=reverse guibg=Grey
