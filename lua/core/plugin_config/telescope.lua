local builtin = require("telescope.builtin")

--vim.keymap.set("n", "<c-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find file" })
vim.keymap.set("n", "<leader><Space>", builtin.oldfiles, { desc = "Old files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find with grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find in buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help!" })

