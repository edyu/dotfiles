set background=dark
"set background=light

" ayu
" let ayucolor="light"
" let ayucolor="mirage"
" let ayucolor="dark"

" gruvbox-material
" set contrast
" this configuration option should be placed before `colorscheme gruvbox-material`
" available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'soft'
" let g:gruvbox_material_enable_italic = 1
" let g:gruvbox_material_disable_italic_comment = 1

" neodark
"let g:neodark#background = '#202020'
""let g:neodark#terminal_transparent = 1
""let g:neodark#solid_vertsplit = 1

" nord
" let g:nord_italic = 1
" let g:nord_underline = 1
" let g:nord_italic_comments = 1
" let g:nord_cursor_line_number_background = 1

" vim-one
" let g:one_allow_italics = 1

" onedark
" let g:onedark_terminal_italics = 1

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 234

" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
" let g:seoul256_background = 256

" Colorscheme
" colorscheme ayu
" colorscheme citylights
" colorscheme cobalt2
" colorscheme dracula
" colorscheme gruvbox-material
" colorscheme happy_hacking
" colorscheme neodark
" colorscheme night-owl
" colorscheme nord
" colorscheme one
" colorscheme onedark
" colorscheme paper
" colorscheme PaperColor
" colorscheme palenight
colorscheme seoul256
" colorscheme seoul256-light

" Enable the lightline theme
" let g:lightline = { 'colorscheme': 'ayu' }
" let g:lightline = { 'colorscheme': 'dracula' }
" let g:lightline = { 'colorscheme': 'gruvbox_material' }
" let g:lightline = { 'colorscheme': 'neodark' }
" let g:lightline = { 'colorscheme': 'nord' }
" let g:lightline = { 'colorscheme': 'nightowl' }
let g:lightline = { 'colorscheme': 'seoul256' }
" let g:lightline = { 'colorscheme': 'one' }
" let g:lightline = { 'colorscheme': 'onedark' }
" let g:lightline = { 'colorscheme': 'PaperColor' }

highlight Comment cterm=italic gui=italic
"highlight Visual cterm=reverse ctermbg=NONE

" Startify
let g:startify_fortune_use_unicode = 1

" Dart
let dart_html_in_string=v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1

" lsc
"set shortmess-=F
"let g:lsc_server_commands = { 'dart': 'dart_language_server' }
"let g:lsc_enable_autocomplete = v:false
"let g:lsc_auto_map = v:true

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        -- hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

" Emmet
" Remap emmet trigger key
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"let g:user_emmet_expandabbr_key='<Tab>'
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_leader_key='<Tab>'
