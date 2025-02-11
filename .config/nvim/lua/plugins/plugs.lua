return {
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "moonfly",
        },
    },
    {
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
        config = true,
    },
    -- {
    --     "ibhagwan/fzf-lua",
    --     opts = {
    --         "max-perf",
    --         fzf_opts = {
    --             ["--no-multi"] = true,
    --             ["--cycle"] = true,
    --             ["--exact"] = true,
    --         },
    --         files = {
    --             fzf_opts = {
    --                 ["--ansi"] = true,
    --             },
    --             actions = {
    --                 ["alt-i"] = { function() end },
    --                 ["alt-h"] = { function() end },
    --             },
    --         },
    --         grep = {
    --             actions = {
    --                 ["alt-i"] = { function() end },
    --                 ["alt-h"] = { function() end },
    --             },
    --         },
    --         keymap = {
    --             fzf = {
    --                 ["tab"] = "down",
    --                 ["shift-tab"] = "up",
    --                 ["ctrl-j"] = "preview-page-down",
    --                 ["ctrl-k"] = "preview-page-up",
    --             },
    --         },
    --     },
    -- },
    -- lazy.nvim
    {
        "folke/which-key.nvim",
        opts = {
            preset = "modern",
            win = {
                border = "double",
                wo = {
                    winblend = 0,
                },
            },
        },
    },
    {
        "folke/snacks.nvim",
        opts = {
            picker = {
                win = {
                    input = {
                        keys = {
                            ["<Esc>"] = { "close", mode = { "n", "i" } },
                            ["<Tab>"] = { "list_down", mode = { "i", "n" } },
                            ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
                        },
                    },
                },
                list = {
                    keys = {
                        ["<Tab>"] = "list_down",
                        ["<S-Tab>"] = "list_up",
                    },
                },
                icons = {
                    files = {
                        enabled = false,
                    },
                },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = false },
        },
    },
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>e",
                function()
                    require("yazi").yazi()
                end,
                desc = "Yazi",
            },
            {
                -- Open in the current working directory
                "<leader>E",
                function()
                    require("yazi").yazi(nil, vim.fn.getcwd())
                end,
                desc = "Yazi (cwd)",
            },
        },
    },
}
