noremap e k
nnoremap i l
vnoremap i l
noremap H h
" n -> j, moving down using "n" (old "j")
noremap n j
noremap l e
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

nnoremap gb <Cmd>call VSCodeNotify('workbench.action.navigateBack')<CR>




" Easy window resizing
noremap <C-u> <C-w>=
noremap <C-m> <C-w>_

if exists('g:vscode')
    " VSCode extension
else
    " ordiary Neovim
endif
