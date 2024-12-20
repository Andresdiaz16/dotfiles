local signs = { Error="", Warn="", Hint="", Info=""}
for type,icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl,{ text = icon, texthl = hl, numhl = ""})
end

return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
    },

    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'BuffNewFile' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim'
        },
        init = function()
            vim.opt.signcolumn = 'yes'
        end,

        config = function ()
            local lsp_defaults = require('lspconfig').util.default_config

            lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
            )

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'Lsp Actions',

                callback = function (event)
                    local opts = { buffer = event.buf }

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
                end
            })

            require('mason-lspconfig').setup({
                ensure_installed = {'lua_ls'},
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end
                }
            })
        end
    }
}
