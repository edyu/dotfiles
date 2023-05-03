if &compatible
	set nocompatible		" Be iMproved
endif

filetype plugin indent on

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Completion
Plug 'Shougo/deoplete.nvim'
" Linting
Plug 'w0rp/ale'
" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'agreco/vim-citylights'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'sainnhe/gruvbox-material'
Plug 'yorickpeterse/happy_hacking.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'haishanh/night-owl.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'shinchu/lightline-seoul256.vim'
Plug 'rakr/vim-one'
Plug 'yorickpeterse/vim-paper'

Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'taohexxx/lightline-buffer'
Plug 'takac/vim-hardtime'
Plug 'edkolev/tmuxline.vim'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'blueyed/vim-diminactive'
Plug 'mbbill/undotree'
" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
" For Rust
Plug 'rust-lang/rust.vim', {'on_ft': 'rust'}
Plug 'sebastianmarkow/deoplete-rust', {'on_ft': 'rust'}
Plug 'mattn/webapi-vim', {'on_ft': 'rust'}
" For Haskell
Plug 'neovimhaskell/haskell-vim'
" For Zig
Plug 'ziglang/zig.vim'

" Collection of common configurations for the Nvim LSP client

" LSP Support
Plug 'neovim/nvim-lspconfig'
" Mason is optional
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'}
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion framework
Plug 'hrsh7th/nvim-cmp'
" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'
" Other 'optional' usefull completion sources
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lua'

" Snippets
Plug 'L3MON4D3/LuaSnip'
" Optional
Plug 'rafamadriz/friendly-snippets'
" Snippet engine
"Plug 'hrsh7th/vim-vsnip'
" LSP-Zero
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'
" Fuzzy finder
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

  " For Dart 
"Plug 'dart-lang/dart-vim-plugin', {'on_ft': 'dart'}
"Plug 'natebosch/vim-lsc', {'on_ft': 'dart'}
"Plug 'natebosch/vim-lsc-dart', {'on_ft': 'dart'}
  " For Svelte
"Plug 'evanleck/vim-svelte'

  " For Julia
Plug 'JuliaEditorSupport/julia-vim'

Plug 'junegunn/fzf.vim'
" Turns keyboard into a gamepad
Plug 'justinmk/vim-sneak'
" Why close vim to view file structure?
Plug 'justinmk/vim-dirvish'
" Vim + Git = Magic
Plug 'tpope/vim-fugitive', {'on_cmd': 'Gstatus', 'augroup': 'fugitive', 'on_source': 'gitv'}

" Damn you curly braces!
Plug 'jiangmiao/auto-pairs'
" Auto end tag
Plug 'alvan/vim-closetag'
" Expand abbrev
" Initialize plugin system
Plug 'mattn/emmet-vim'

call plug#end()

"-----------------------------Load files-----------------------------
source ~/.config/nvim/base.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/lsp.vim

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.html 0r ~/.config/nvim/templates/skeleton.html
  augroup END
endif
