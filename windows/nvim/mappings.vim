" To lazy to reah the esc key
inoremap jk <esc>
" Set map-leader to space
let mapleader=" "

" Xmonad like navigation
nnoremap <C-J> <C-W><C-W>
nnoremap <C-K> <C-W>W
nnoremap <C-L> <C-W>L
nnoremap <C-H> <C-W>H

" For terminal use
tnoremap <C-j><C-k> <C-\><C-N>
tnoremap <C-h> <c-\><C-N><C-w>h
tnoremap <C-j> <c-\><C-N><C-w>j
tnoremap <C-k> <c-\><C-N><C-w>k
tnoremap <C-l> <c-\><C-N><C-w>l

nnoremap tj :tabprevious<CR>
nnoremap tk :tabnext<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
