return {
    'aznhe21/actions-preview.nvim',
    config = function ()
        vim.keymap.set('n', '<leader>vca', require('actions-preview').code_actions)
    end,
}
