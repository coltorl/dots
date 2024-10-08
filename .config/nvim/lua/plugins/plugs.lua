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
    {
        "ibhagwan/fzf-lua",
        opts = {
            "max-perf",
            fzf_opts = {
                ["--no-multi"] = true,
                ["--cycle"] = true,
                ["--exact"] = true,
            },
            files = {
                fzf_opts = {
                    ["--ansi"] = true,
                },
                actions = {
                    ["alt-i"] = { function() end },
                    ["alt-h"] = { function() end },
                },
            },
            grep = {
                actions = {
                    ["alt-i"] = { function() end },
                    ["alt-h"] = { function() end },
                },
            },
            keymap = {
                fzf = {
                    ["tab"] = "down",
                    ["shift-tab"] = "up",
                    ["ctrl-j"] = "preview-page-down",
                    ["ctrl-k"] = "preview-page-up",
                },
            },
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
            })
        end,
    },
    {
        "echasnovski/mini.pairs",
        enabled = false,
    },
    {
        "iguanacucumber/magazine.nvim",
        after = "nvim-autopairs",
        name = "nvim-cmp", -- Otherwise highlighting gets messed up
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local cmp = require("cmp")

            local win_opt = {
                winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
            }
            opts.window = {
                completion = cmp.config.window.bordered(win_opt),
                documentation = cmp.config.window.bordered(win_opt),
            }
            opts.window.completion.scrollbar = false

            opts.completion.completeopt = "menu,menuone,noselect"
            opts.completion.keyword_length = 1

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<CR>"] = cmp.mapping.confirm(),
            })

            return opts
        end,
    },
    {
        "hrsh7th/cmp-cmdline",
        after = "nvim-cmp", -- Ensure it loads after nvim-cmp
        config = function()
            local cmp = require("cmp")
            cmp.setup.cmdline(":", {
                sources = {
                    { name = "cmdline" },
                },
                mapping = cmp.mapping.preset.cmdline({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                        else
                            fallback()
                        end
                    end),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                        else
                            fallback()
                        end
                    end),
                    ["<CR>"] = cmp.mapping.confirm(),
                }),
            })
            cmp.setup.cmdline("/", {
                sources = {
                    { name = "buffer" },
                },
                mapping = cmp.mapping.preset.cmdline({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                        else
                            fallback()
                        end
                    end),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                        else
                            fallback()
                        end
                    end),
                    ["<CR>"] = cmp.mapping.confirm(),
                }),
            })
        end,
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
