require("catppuccin").setup({

    flavour = "mocha",
    -- transparent_background = true,
    opts = {
        term_colors = true;
    },
    integrations = {
        harpoon = true,
        mason = true,
        neotree = true,
        gitsigns = true

    },
    color_overrides = {

        -- mocha = {
        --     base = '#292828',
        --     crust = '#292828',
        --     mantle = '#292828'
        -- }

    }

})

vim.cmd.colorscheme "catppuccin"
