
local kind_icons = {
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

vim.pack.add({ 
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-nvim-lsp'
})

local cmp = require("cmp")
local defaults = require("cmp.config.default")()


cmp.setup({
    view = {
        entries = { name = 'custom', selector_order = 'near_cursor' }
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path'     },
        { name = 'nvim_lua' },
    },{{name = 'buffer'   }}),

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = { 'abbr','menu','kind'},
        format = function(entry, vim_item)
            vim_item.dup = ({
                lsp = 0
            })[entry.source.name] or 0
            vim_item.menu = string.format(' %s ', vim_item.kind)
            vim_item.kind = string.format(' %s ', kind_icons[vim_item.kind])
            return vim_item
        end
    },
    mapping = {
        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select}),
        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select}),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    sorting = defaults.sorting,
})

local lsp_defaults = require('lspconfig').util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)
