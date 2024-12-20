return {
    'ThePrimeagen/harpoon',
    branch='harpoon2',
    dependencies={
        'nvim-lua/plenary.nvim'
    },

    init = function()
            require("harpoon"):setup() 
        end
    ,

    keys = {
        {
            "<C-e>",
            function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end
        },
        {
            "<leader>a",
            function()
                require("harpoon"):list():append()
            end
        },
        {
            "<leader>1",
            function()
                require("harpoon"):list():select(1)
            end
        },
        {
            "<leader>2",
            function()
                require("harpoon"):list():select(2)
            end
        },
        {
            "<leader>3",
            function()
                require("harpoon"):list():select(3)
            end
        },
        {
            "<leader>4",
            function()
                require("harpoon"):list():select(4)
            end
        },
        {
            "<leader>5",
            function()
                require("harpoon"):list():select(5)
            end
        },
    }
}