require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "solargraph", "crystalline" }
  -- ensure_installed = { "sumneko_lua", "solargraph" }
})

local on_attach = function(_, _)
  -- util?
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})

  -- util?
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})

  vim.keymap.set('n', '<leader>gr', require("telescope.builtin").lsp_references, {})

  vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, {})
end

-- require("lspconfig").sumneko_lua.setup {
require("lspconfig").lua_ls.setup {
  on_attach = on_attach
}

local on_attach_solargraph = function(_, _)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})

  -- no rula
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, {})

  -- no rula
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})

  -- inutil?
  vim.keymap.set('n', '<leader>gf', vim.lsp.buf.formatting, {})

  vim.keymap.set('n', '<leader>gr', require("telescope.builtin").lsp_references, {})

  vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, {})
end

-- require("lspconfig").solargraph.setup {
--   on_attach = on_attach_solargraph
-- }
nvim_lsp = require("lspconfig")

local servers = { "solargraph" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach_solargraph,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
