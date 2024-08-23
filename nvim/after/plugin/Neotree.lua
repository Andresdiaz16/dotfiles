require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignore = false
        },
        follow_current_file = {
            enable = true,
            leave_dirs_open = false
        },
    },
    buffers = {
        follow_current_file = {
            enable = true,
            leave_dirs_open = false
        },
    }
})
