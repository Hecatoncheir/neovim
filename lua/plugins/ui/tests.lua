return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        -- keys = {
        --     { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,                    desc = "Debug nearest test" },
        --     { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "Run File" },
        --     { "<leader>ta", function() require("neotest").run.run(vim.loop.cwd()) end,                          desc = "Run All Test Files" },
        --     { "<leader>tr", function() require("neotest").run.run() end,                                        desc = "Run Nearest" },
        --     { "<leader>tl", function() require("neotest").run.run_last() end,                                   desc = "Run Last" },
        --     { "<leader>tS", function() require("neotest").summary.toggle() end,                                 desc = "Toggle Summary" },
        --     { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
        --     { "<leader>tO", function() require("neotest").output_panel.toggle() end,                            desc = "Toggle Output Panel" },
        --     { "<leader>ts", function() require("neotest").run.stop() end,                                       desc = "Stop" },
        -- },
        opts = {
            icons = {
                passed = "",
                running = "",
                failed = "",
                unknown = "",
                running_animated = { "", "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥", "󰪤", "󰪣", "󰪢", "󰪡", "󰪠", "󰪟", "󰪞", "", },
            },
            discovery = {
                concurrent = 0,
                enabled = true
            },
            diagnostic = {
                enabled = true,
                severity = 1
            },
            benchmark = {
                enabled = true
            },
            jump = {
                enabled = true
            },
            output = {
                enabled = true,
                open_on_run = "short"
            },
            output_panel = {
                enabled = true,
                open = "botright split | resize 15"
            },
            quickfix = {
                enabled = true,
                open = true
            },
            run = {
                enabled = true
            },
            running = {
                concurrent = true
            },
            state = {
                enabled = true
            },
            summary = {
                animated = true,
                enabled = true,
                expand_errors = true,
                follow = true,
                mappings = {
                    attach = "a",
                    clear_marked = "M",
                    clear_target = "T",
                    debug = "d",
                    debug_marked = "D",
                    -- expand = { "<CR>", "<2-LeftMouse>" },
                    expand = { "l", "h", "<CR>", "<2-LeftMouse>" },
                    expand_all = "e",
                    -- jumpto = "i",
                    jumpto = { "i", "<C-CR>", "<C-l>" },
                    mark = "m",
                    next_failed = "J",
                    output = "o",
                    prev_failed = "K",
                    run = "r",
                    run_marked = "R",
                    short = "O",
                    stop = "s",
                    target = "t"
                },
                open = "botright vsplit | vertical resize 50"
            }

        },
        config = function(_, opts)
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        -- Replace newline and tab characters with space for more compact diagnostics
                        local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+",
                            "")
                        return message
                    end,
                },
            }, neotest_ns)

            if opts.adapters then
                local adapters = {}
                for name, config in pairs(opts.adapters or {}) do
                    if type(name) == "number" then
                        if type(config) == "string" then
                            config = require(config)
                        end
                        adapters[#adapters + 1] = config
                    elseif config ~= false then
                        local adapter = require(name)
                        if type(config) == "table" and not vim.tbl_isempty(config) then
                            local meta = getmetatable(adapter)
                            if adapter.setup then
                                adapter.setup(config)
                            elseif meta and meta.__call then
                                adapter(config)
                            else
                                error("Adapter " .. name .. " does not support setup")
                            end
                        end
                        adapters[#adapters + 1] = adapter
                    end
                end
                opts.adapters = adapters
            end

            require("neotest").setup(opts)
        end,
    }
}
