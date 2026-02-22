return {
    {
        "github/copilot.vim",
        event = "InsertEnter",
        init = function()
            vim.g.copilot_no_tab_map = true
        end,
        config = function()
            vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false,
            })

            vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)")
            vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)")
            vim.keymap.set("i", "<C-]>", "<Plug>(copilot-dismiss)")
        end,
    },
}
