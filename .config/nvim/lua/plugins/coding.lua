return {
    {
        "mfussenegger/nvim-dap",
        optional = true,
        opts = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "codelldb" },
                automatic_installation = true,
                handlers = {},
            })
            local dap = require("dap")
            dap.defaults.fallback.exception_breakpoints = {}
            dap.defaults.cpp.exception_breakpoints = {}
            dap.defaults.c.exception_breakpoints = {}
            --require("dap.ext.vscode").load_launchjs(nil, { codelldb = { "rust", "c", "cpp" }, netcoredbg = {"cs"} })
        end,
    },
    {
        "Civitasv/cmake-tools.nvim",
        opts = {
            cmake_executor = { name = "overseer", opts = {} },
            cmake_runner = { name = "overseer", opts = {} },
            cmake_virtual_text_support = false,
            cmake_notifications = {
                runner = { enabled = false },
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "vim",
                "yaml",
                "rust",
                "c",
                "cpp",
                "xml",
                "latex",
                "glsl",
                "http",
                "llvm",
            },
        },
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                -- lsp
                "json-lsp",
                "lua-language-server",
                "basedpyright",
                "ruff-lsp",
                "lemminx",
                "debugpy",
                -- linter
                "cmakelang",
                "flake8", -- does ruff-lsp replace?
                "shellcheck",
                -- formatter
                "xmlformatter",
                "clang-format",
                "cmakelang",
                "stylua",
                "shfmt",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            setup = {
                clangd = function(_, opts)
                    opts.capabilities.offsetEncoding = { "utf-16" }
                end,
            },
        },
    },
    {
        "mg979/vim-visual-multi",
        event = "VeryLazy",
        init = function()
            vim.g.VM_set_statusline = 0
        end,
    },
    {
        "folke/flash.nvim",
        opts = {
            search = {
                multi_window = false,
            },
            modes = {
                char = {
                    multi_line = false,
                    highlight = { backdrop = false },
                },
            },
        },
    },
    {
        "emmanueltouzery/decisive.nvim",
        config = function()
            require("decisive").setup({})
        end,
        lazy = true,
        ft = { "csv" },
        keys = {
            {
                "<leader>cc",
                function() end,
                { silent = true },
                desc = "CSV+",
                mode = "n",
            },

            {
                "<leader>cca",
                function()
                    require("decisive").align_csv({})
                end,
                { silent = true },
                desc = "Align CSV",
                mode = "n",
            },
            {
                "<leader>ccA",
                function()
                    require("decisive").align_csv_clear({})
                end,
                { silent = true },
                desc = "Align CSV clear",
                mode = "n",
            },
            {
                "[c",
                function()
                    require("decisive").align_csv_prev_col()
                end,
                { silent = true },
                desc = "Align CSV prev col",
                mode = "n",
            },
            {
                "]c",
                function()
                    require("decisive").align_csv_next_col()
                end,
                { silent = true },
                desc = "Align CSV next col",
                mode = "n",
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = false,
        },
    },
    {
        "saghen/blink.cmp",
        opts = {
            keymap = {
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
            },
            completion = {
                list = { selection = "manual" },
                menu = { scrollbar = false, border = "single" },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                    window = {
                        border = 'single',
                        winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
                        scrollbar = false
                    }
                },
            },
        },
    },
}
