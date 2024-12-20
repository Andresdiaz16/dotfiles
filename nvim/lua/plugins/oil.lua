return {
    'stevearc/oil.nvim',
    ---@module 'oil',
    ---@type oil.SetupOpts
    opts = {
        view_option = {
            show_hidden = true
        }
    },
    dependencies = {{ 'echasnovski/mini.icons', opts = {} }},
    ksey = {
        {'-','<CMD>Oil<CR>'}
    }
}