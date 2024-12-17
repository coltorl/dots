return {
    {
        "rcarriga/nvim-dap-ui",
        keys = {
            {
                "<leader>du",
                function()
                    require("dapui").toggle({})
                end,
                desc = "Dap UI",
            },
            {
                "<leader>de",
                function()
                    require("dapui").eval()
                end,
                desc = "Eval",
                mode = { "n", "v" },
            },
            keys = {
                "<leader>de",
                function()
                    require("dap").set_exception_breakpoints()
                end,
                desc = "Exceptions",
            },
        },
        opts = {
            element_mappings = {
                stacks = {
                    open = "<CR>",
                    expand = "o",
                },
            },
        },
        config = function(_, opts)
            local dapui = require("dapui")
            dapui.setup(opts)
        end,
    },
    {
        "petertriho/nvim-scrollbar",
        opts = {
            handle = {
                color = "#303030",
                blend = 15,
            },
            handlers = {
                search = true,
                cursor = false,
            },
            excluded_filetypes = {
                "blink-cmp-menu",
                "blink-cmp-documentation"
            },
            hide_if_all_visible = true,
            show_in_active_only = true
        },
    },
    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            -- Setup hlslens
            require("hlslens").setup({
                build_position_cb = function(plist, _, _, _)
                    require("scrollbar.handlers.search").handler.show(plist.start_pos)
                end,
                override_lens = function() end,
                nearest_only = true,
                nearest_float_when = "never",
                virt_priority = 0,
            })

            -- Define highlight links
            vim.cmd("hi default link HlSearchNear IncSearch")
            vim.cmd("hi default link HlSearchLens WildMenu")
            vim.cmd("hi default link HlSearchLensNear IncSearch")

            local kopts = { noremap = true, silent = true }

            vim.api.nvim_set_keymap(
                "n",
                "n",
                [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
                kopts
            )
            vim.api.nvim_set_keymap(
                "n",
                "N",
                [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
                kopts
            )
            vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
        end,
    },
    {
        "folke/noice.nvim",
        opts = {
            presets = {
                lsp_doc_border = true,
            },
        },
    },
    {
        "rcarriga/nvim-notify",
        keys = {
            {
                "<leader>un",
                function()
                    require("notify").dismiss({ silent = true, pending = true })
                end,
                desc = "Dismiss all Notifications",
            },
        },
        opts = {
            timeout = 3000,
            background_colour = "#080808",
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
        },
        init = function()
            -- when noice is not enabled, install notify on VeryLazy
            local Util = require("lazyvim.util")
            if not Util.has("noice.nvim") then
                Util.on_very_lazy(function()
                    vim.notify = require("notify")
                end)
            end
        end,
    },
    {
        "snacks.nvim",
        opts = {
            scroll = { enabled = false },
        },
    },
}
