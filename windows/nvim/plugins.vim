" set background=dark

" nord
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1

" vim-one
" let g:one_allow_italics = 1

" let g:onedark_terminal_italics = 1

" Colorscheme
" colorscheme cobalt2
" colorscheme dracula
" colorscheme night-owl
colorscheme nord
" colorscheme one
" colorscheme onedark
" colorscheme palenight
" colorscheme seoul256
" colorscheme citylights

" Enable the lightline theme
" let g:lightline = { 'colorscheme': 'dracula' }
let g:lightline = { 'colorscheme': 'nord' }
" let g:lightline = { 'colorscheme': 'nightowl' }
" let g:lightline = { 'colorscheme': 'seoul256' }
" let g:lightline = { 'colorscheme': 'citylights' }
" let g:lightline = { 'colorscheme': 'one' }
" let g:lightline = { 'colorscheme': 'onedark' }

highlight Comment cterm=italic gui=italic
highlight Visual cterm=reverse ctermbg=NONE

" Startify
let g:startify_fortune_use_unicode = 1
