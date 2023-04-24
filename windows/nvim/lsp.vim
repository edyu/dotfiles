lua <<EOF
local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'html',
  'julials',
  'tsserver',
  'eslint',
  'rust_analyzer'
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
EOF
