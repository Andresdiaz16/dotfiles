return {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
        require('copilot').setup({
            panel = {
                layout = {
                    position = "right",
                    ratio = 0.3
                }
            },
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept = '<Tab>',
                },
            },
            filetypes = {
                vim = false
            }
        })
    end,
}
