require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

-- Make line numbers default
vim.wo.number = true

-- Column 100
vim.cmd [[ set colorcolumn=100 ]]

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Decrease update time
-- This governs when git-blame appears as well and <leader>ff
-- vim.o.updatetime = 250
vim.o.updatetime = 500

vim.wo.signcolumn = 'yes'

-- Use System's Clipboad
vim.cmd [[ set clipboard+=unnamedplus ]]
