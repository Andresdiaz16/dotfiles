return {

    'nvim-treesitter/nvim-treesitter',
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    opts = {
        ensure_installed = { "tsx", "html", "cpp", "javascript", "typescript", "python", "c","lua", "vim", "vimdoc", "dockerfile" },

        sync_install = false,

        auto_install = true,
        ignore_install = { 'dart' },
        indent = {
            enable = true,
            disable = { 'dart' }
        },

        highlight = {

            enable = true,

            additional_vim_regex_highlighting = false
        }
    }
}
