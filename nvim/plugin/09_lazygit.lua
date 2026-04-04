vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/kdheepak/lazygit.nvim'
})

vim.keymap.set('n','<leader>gs',':LazyGit<CR>', { desc = "Open lazygit" })
