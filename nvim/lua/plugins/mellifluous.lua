return {
    'ramojus/mellifluous.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
        require('mellifluous').setup({
            dim_inactive = false,
            colorset = 'kanagawa_dragon',
            color_overrides = {
                dark = {
                    bg = function(bg)
                        return bg:darkened(2) -- hard contrast
                        -- return bg -- medium contrast
                        -- return bg:lightened(2) -- soft contrast
                    end,
                },
                light = {
                    bg = function(bg)
                        return bg:lightened(2) -- hard contrast
                        -- return bg -- medium contrast
                        -- return bg:darkened(2) -- soft contrast
                    end,
                },
            },
            styles = {
                main_keywords = {},
                other_keywords = {},
                types = {},
                operators = {},
                strings = {},
                functions = {},
                constants = {},
                comments = { italic = true },
                markup = {
                    headings = { bold = true },
                },
                folds = {},
            },
            transparent_background = {
                enabled = false,
                floating_windows = true,
                telescope = false,
                file_tree = true,
                cursor_line = true,
                status_line = true,
            },
            flat_background = {
                line_numbers = false,
                floating_windows = false,
                file_tree = false,
                cursor_line_number = false,
            },
            plugins = {
                cmp = true,
                gitsigns = true,
                indent_blankline = true,
                nvim_tree = {
                    enabled = true,
                    show_root = false,
                },
                neo_tree = {
                    enabled = true,
                },
                telescope = {
                    enabled = true,
                    nvchad_like = true,
                },
                startify = true,
            },
        })
        vim.cmd([[colorscheme mellifluous]])
    end,
}
