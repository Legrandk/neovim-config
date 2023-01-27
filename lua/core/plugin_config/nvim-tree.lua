vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--require('nvim-tree').setup()

require('nvim-tree').setup {
  update_focused_file = {
    enable = true,
  },
  actions = {
    use_system_clipboard = false
  },
  filters = {
    dotfiles = true,
  },
  view = {
    width = 40
  }
}

--vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>')

