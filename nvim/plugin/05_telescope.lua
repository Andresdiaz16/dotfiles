vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim'
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>ss', builtin.grep_string, { desc = 'Telescope strings' })
vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'Telescope document symbols' })
vim.keymap.set('n', '<leader>vrr', builtin.lsp_references, { desc = 'Lists LSP references for word under the cursor' })
vim.keymap.set('n', '<leader>ld', '<CMD> Telescope diagnostics bufnr=0<CR>', { desc = 'List diagnostics'})
vim.keymap.set('n', '<leader>lpd', builtin.diagnostics, { desc = 'Lists Diagnostics for all buffers' })
vim.keymap.set('n', '<leader>vi', builtin.lsp_implementations , { desc = 'Goto or show the implementation'})
vim.keymap.set('n', '<leader>ts', builtin.treesitter, { desc = 'treesitter'})
