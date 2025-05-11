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

return {
    'hrsh7th/nvim-cmp',
    priority = 53,
    opts = {
        view = {
            entries = { name = 'custom', selector_order = 'near_cursor' }
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'path'     },
            { name = 'nvim_lua' },
            { name = 'buffer'   }
        },
        window = {
            completion = require('cmp').config.window.bordered(),
            documentation = require('cmp').config.window.bordered()
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
            ['<C-j>'] = require('cmp').mapping.select_next_item({ behavior = require('cmp').SelectBehavior.Select}),
            ['<C-k>'] = require('cmp').mapping.select_prev_item({ behavior = require('cmp').SelectBehavior.Select}),
            ['<C-y>'] = require('cmp').mapping.confirm({ select = true }),
            ['<C-Space>'] = require('cmp').mapping.complete(),
        }
    }
}
