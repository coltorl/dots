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
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            vim.o.foldcolumn = "1"
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
            vim.keymap.set("n", "zk", function()
                local winid = require("ufo").peekFoldedLinesUnderCursor()
                if not winid then
                    vim.lsp.buf.hover()
                end
            end, { desc = "peek Fold" })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }
            local language_servers = require("lspconfig").util.available_servers()
            for _, ls in ipairs(language_servers) do
                require("lspconfig")[ls].setup({
                    capabilities = capabilities,
                    -- you can add other fields for setting up lsp server in this table
                })
            end
            require("ufo").setup()
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            show_success_message = true,
            prompt_func_return_type = {
                go = true,
                cpp = true,
                c = true,
                java = true,
            },
            prompt_func_param_type = {
                go = true,
                cpp = true,
                c = true,
                java = true,
            },
        },
        keys = {
            {
                "<leader>r",
                desc = "refactor+",
                mode = { "x", "n" },
            },
            {
                "<leader>rf",
                desc = "Extract to Function",
                function()
                    require("refactoring").refactor("Extract Function")
                end,
                mode = { "x" },
            },
            {
                "<leader>rF",
                function()
                    require("refactoring").refactor("Extract Function To File")
                end,
                desc = "Extract to Function to File",
                mode = { "x" },
            },
            {
                "<leader>rv",
                function()
                    require("refactoring").refactor("Extract Variable")
                end,
                desc = "Extract to Variable",
                mode = { "x" },
            },
            {
                "<leader>rI",
                function()
                    require("refactoring").refactor("Inline Function")
                end,
                desc = "Inline Function",
                mode = { "n" },
            },
            {
                "<leader>ri",
                ":Refactor inline_var",
                desc = "Inline Variable",
                mode = { "n" },
            },
            {
                "<leader>rb",
                function()
                    require("refactoring").refactor("Extract Block")
                end,
                desc = "Extract Block",
                mode = { "n" },
            },
            {
                "<leader>rB",
                function()
                    require("refactoring").refactor("Extract Block To File")
                end,
                desc = "Extract Block to File",
                mode = { "n" },
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
}
