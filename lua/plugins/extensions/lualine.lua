return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            'linrongbin16/lsp-progress.nvim',
            'archibate/lualine-time',
        },
        config = function()
            local function selectionLinesCount()
                local wc = vim.fn.wordcount()
                if wc["visual_words"] then
                    local starts = vim.fn.line("v")
                    local ends = vim.fn.line(".")
                    local count = starts <= ends and ends - starts + 1 or starts - ends + 1
                    return "Lines: " .. count
                else
                    return ""
                end
            end

            require('lsp-progress').setup()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {
                        'filename',
                        require('lsp-progress').progress,
                    },
                    lualine_x = {
                        'vim.g.flutter_tools_decorations.app_version',
                        'vim.g.flutter_tools_decorations.device',
                        'vim.g.flutter_tools_decorations.project_config',
                        'encoding',
                        -- 'fileformat',
                        -- 'filetype',
                        selectionLinesCount,
                        -- 'location',
                    },
                    lualine_y = { 'progress' },
                    lualine_z = {
                        'ctime',
                        'cdate',
                    }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }

            vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
            vim.api.nvim_create_autocmd("User", {
                group = "lualine_augroup",
                pattern = "LspProgressStatusUpdated",
                callback = require("lualine").refresh,
            })
        end
    },

}
