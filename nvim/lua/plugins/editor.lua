return {
    {
        "nvim-lua/plenary.nvim",
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                sorting_strategy = "ascending",
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "smart" },
            },
        },
    },

    {
        "airblade/vim-gitgutter",
        init = function()
            vim.g.gitgutter_sign_added = "+"
            vim.g.gitgutter_sign_modified = "~"
            vim.g.gitgutter_sign_removed = "_"
            vim.g.gitgutter_sign_removed_first_line = "^"
            vim.g.gitgutter_sign_modified_removed = "~"
        end,
    },

    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter").setup({
          ensure_installed = {
            "go",
            "gomod",
            "gowork",
            "gosum",
            "gleam",
            "javascript",
            "typescript",
            "tsx",
            "html",
            "css",
            "json",
            "lua",
            "bash",
            "markdown",
            "markdown_inline",
          },
          highlight = { enable = true },
          indent = { enable = true },
        })
      end,
    },

    {
        "NicolasGB/jj.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {},
    },
    {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      format_on_save = function(bufnr)
        return {
          timeout_ms = 1000,
          lsp_fallback = true,
        }
      end,

      formatters_by_ft = {
        go = { "goimports", "gofmt" },
        gleam = { "gleam" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
      },
    },
  }
}
