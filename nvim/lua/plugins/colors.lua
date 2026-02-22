return {
    {
        "kepano/flexoki-neovim",
        name = "flexoki",
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            vim.cmd.colorscheme("flexoki-dark")
        end,
    },
}
