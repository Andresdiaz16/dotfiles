local lsp = require('lsp-zero')
require('mason').setup({})
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

require('mason-lspconfig').setup({
    ensure_installed = {'clangd','tsserver','lua_ls'},
    handlers = {
        lsp.default_setup,
        ["lua_ls"] = function ()
            require('lspconfig').lua_ls.setup{
                settings = {
                    Lua ={
                        diagnostics = {
                            globals ={
                                'vim'
                            }
                        }
                    }
                }
            }
        end,
        ["tsserver"] = function ()
            require('lspconfig').tsserver.setup{}
        end,
        ["clangd"] = function ()
            require("lspconfig").clangd.setup{}
        end,
        ['html'] = function ()
            require("lspconfig").html.setup{}
        end,
        ['omnisharp'] = function ()
            require("lspconfig").omnisharp.setup{}
        end,
        ['cmake']=function ()
            require("lspconfig").cmake.setup{}
        end,
    }
})

local signs = { Error="", Warn="", Hint="", Info=""}
for type,icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl,{ text = icon, texthl = hl, numhl = ""})
end

--lsp auto complete remaps

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

-- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
-- vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })


vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#FFFFFF", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFFFFF", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "NONE" })

cmp.setup({
    view = {
        entries = {name = 'custom', selection_order = 'near_cursor' }
    },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'path'},
        {name = 'nvim_lua'},
        {name = 'buffer'}
    },
    window = {
        completion = cmp.config.window.bordered({
        })
    },
    formatting = {
        fields = {"abbr","menu","kind"},
        format = function(entry, vim_item)
            vim_item.dup = ({
                lsp = 0
            })[entry.source.name] or 0
            -- Kind icons
            vim_item.menu = string.format(' %s ', vim_item.kind)
            vim_item.kind = string.format(' %s ', kind_icons[vim_item.kind])
            return vim_item
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>vi",function () vim.lsp.buf.implementation() end,opts)
end)

