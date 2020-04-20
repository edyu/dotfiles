set background=dark
" set background=light

" set contrast
" this configuration option should be placed before `colorscheme gruvbox-material`
" available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_enable_italic = 1
" let g:gruvbox_material_disable_italic_comment = 1

" nord
" let g:nord_italic = 1
" let g:nord_underline = 1
" let g:nord_italic_comments = 1
" let g:nord_cursor_line_number_background = 1

" vim-one
" let g:one_allow_italics = 1

" let g:onedark_terminal_italics = 1

" Colorscheme
" colorscheme citylights
" colorscheme cobalt2
" colorscheme dracula
colorscheme gruvbox-material
" colorscheme night-owl
" colorscheme nord
" colorscheme one
" colorscheme onedark
" colorscheme palenight
" colorscheme seoul256

" Enable the lightline theme
" let g:lightline = { 'colorscheme': 'citylights' }
" let g:lightline = { 'colorscheme': 'dracula' }
let g:lightline = { 'colorscheme': 'gruvbox_material' }
" let g:lightline = { 'colorscheme': 'nord' }
" let g:lightline = { 'colorscheme': 'nightowl' }
" let g:lightline = { 'colorscheme': 'seoul256' }
" let g:lightline = { 'colorscheme': 'one' }
" let g:lightline = { 'colorscheme': 'onedark' }

highlight Comment cterm=italic gui=italic
"highlight Visual cterm=reverse ctermbg=NONE

" Startify
let g:startify_fortune_use_unicode = 1
