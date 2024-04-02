return {
    { "mfussenegger/nvim-dap" },
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            require("dapui").setup()

            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "*",
                desc = "Prevent colorscheme clearing self-defined DAP marker colors",
                callback = function()
                    vim.fn.sign_define('DapBreakpoint',
                        { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
                    vim.fn.sign_define('DapBreakpointCondition',
                        { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
                    vim.fn.sign_define('DapBreakpointRejected',
                        { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
                    vim.fn.sign_define('DapLogPoint',
                        { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
                    vim.fn.sign_define('DapStopped',
                        { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
                end
            })
        end
    },
}
