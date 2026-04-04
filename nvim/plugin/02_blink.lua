
vim.pack.add({{src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.0')}})

require('blink.cmp').setup({
    keymap = {
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-y>'] = { 'accept', 'fallback' },
        ['<C-n>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-p>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },

    },
    completion = {

        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500
        },

        ghost_text = {
            enabled = true,
            show_with_menu = true
        },

        keyword = { range = 'full' },

        trigger = {
            show_on_trigger_character = true,
            show_on_blocked_trigger_characters = { ' ', '\n', '\t' }
        },

        menu = {
            draw = {
                treesitter = { 'lsp' },
                columns = {
                    { 'label', 'label_description', gap = 1 },{ 'kind_icon' }
                },
            },
        }
    },

    appearance = {
        kind_icons = {
            Text = " ",
            Method = "󰆧",
            Function = "󰊕 ",
            Constructor = " ",
            Field = "󰇽 ",
            Variable = "󰂡 ",
            Class = ' ',
            Interface = " ",
            Module = ' ',
            Property = '',
            Unit = " ",
            Value = ' ',
            Enum = " ",
            Keyword = "󰌋 ",
            Snippet = " ",
            Color = "󰏘 ",
            File = "󰈙",
            Reference = " ",
            Folder = "󰉋",
            EnumMember = " ",
            Constant = "󰏿",
            Struct = " ",
            Event = "",
            Operator = "󰆕",
            TypeParameter = ' ',
        }
    }
})
