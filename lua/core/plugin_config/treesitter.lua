require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "elixir", "lua", "rust", "ruby", "vim" },

  -- Install parsers synchronously (only applied to 'ensure_installed'
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  }
}

-- Code Folding
-- set foldmethod=expr:while g do
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 20

