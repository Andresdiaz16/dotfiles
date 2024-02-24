-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    --file search
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-media-files.nvim', 'nvim-lua/popup.nvim'} }
    }

    --theme for nvim
    use { "catppuccin/nvim", as = "catppuccin" }
    -- use {'marko-cerovac/material.nvim',
    --     config = function ()
    --         vim.g.material_style = "darker";
    --     end
    --
    -- }

    --syntax highlight
    use( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

    --hotswap files
    use {
        'ThePrimeagen/harpoon',
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    --undo tree 
    use('mbbill/undotree')

    --plugin for commenting lines or selecions
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    --plugin for git handling
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')


    --plugin for navigation between panes and windows
    use("christoomey/vim-tmux-navigator")

    --plugins for surronding with "" or ''
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")

    -- lsp plugin
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    --plugin for highlight words under cursor
    use('RRethy/vim-illuminate')

    --plugin for auto completion of {},(),"" and ''
    use ('echasnovski/mini.pairs')

    --plugin for status line
    use("nvim-lualine/lualine.nvim")

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }

end)
