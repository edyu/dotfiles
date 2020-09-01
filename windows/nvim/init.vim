if &compatible
	set nocompatible		" Be iMproved
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

filetype plugin indent on

" Required:
if dein#load_state('~/.local/share/dein')
	call dein#begin('~/.local/share/dein')

	" Completion
	call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
	call dein#add('Shougo/deoplete.nvim')
	" Linting
	call dein#add('w0rp/ale')
	" Theme
	call dein#add('ayu-theme/ayu-vim')
	call dein#add('agreco/vim-citylights')
	call dein#add('herrbischoff/cobalt2.vim')
	call dein#add('dracula/vim', {'as': 'dracula'})
	call dein#add('sainnhe/gruvbox-material')
	call dein#add('yorickpeterse/happy_hacking.vim')
	call dein#add('KeitaNakamura/neodark.vim')
	call dein#add('haishanh/night-owl.vim')
	call dein#add('arcticicestudio/nord-vim')
	call dein#add('joshdick/onedark.vim')
	call dein#add('NLKNguyen/papercolor-theme')
	call dein#add('drewtempelmeyer/palenight.vim')
	call dein#add('junegunn/seoul256.vim')
	call dein#add('rakr/vim-one')
	call dein#add('yorickpeterse/vim-paper')

	call dein#add('ryanoasis/vim-devicons')
	call dein#add('itchyny/lightline.vim')
	call dein#add('taohexxx/lightline-buffer')
	call dein#add('takac/vim-hardtime')
	call dein#add('edkolev/tmuxline.vim')
	call dein#add('Yggdroot/indentLine')
	call dein#add('mhinz/vim-startify')
	call dein#add('blueyed/vim-diminactive')
	call dein#add('mbbill/undotree')
	" Snippets
	call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('honza/vim-snippets')
	" For Rust
	call dein#add('rust-lang/rust.vim', {'on_ft': 'rust'})
	call dein#add('sebastianmarkow/deoplete-rust', {'on_ft': 'rust'})
	call dein#add('mattn/webapi-vim', {'on_ft': 'rust'})
    " For Dart 
	call dein#add('dart-lang/dart-vim-plugin', {'on_ft': 'dart'})
	call dein#add('natebosch/vim-lsc', {'on_ft': 'dart'})
	call dein#add('natebosch/vim-lsc-dart', {'on_ft': 'dart'})
	call dein#add('neoclide/coc.nvim', {'merged':0, 'rev':'release'})
    " For Svelte
	call dein#add('evanleck/vim-svelte')

	call dein#add('junegunn/fzf.vim')
	" Damn you curly braces!
	call dein#add('jiangmiao/auto-pairs')
	" Turns keyboard into a gamepad
	call dein#add('justinmk/vim-sneak')
	" Why close vim to view file structure?
	call dein#add('justinmk/vim-dirvish')
	" Vim + Git = Magic
	call dein#add('tpope/vim-fugitive', {'on_cmd': 'Gstatus', 'augroup': 'fugitive', 'on_source': 'gitv'})

	" Required:
	call dein#end()
	call dein#save_state()
endif

"-----------------------------Load files-----------------------------
source ~/.config/nvim/base.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/coc.vim
