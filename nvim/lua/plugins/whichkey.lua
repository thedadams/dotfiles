return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            delay = 300,
            icons = {
                mappings = true,
            },
            spec = {
                { "<leader>f", group = "file" },
                { "<leader>j", group = "jj" },
                { "<leader>l", group = "lsp" },
            },
        },
    },
}
