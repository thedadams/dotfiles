return {
    {
        dir = vim.fn.stdpath("config"),
        name = "ember-one",
        lazy = false,
        priority = 1000,
        config = function()
            vim.opt.termguicolors = true
            vim.cmd.colorscheme("ember-one")
        end,
    },
}
