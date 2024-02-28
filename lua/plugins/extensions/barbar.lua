return {
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            vim.g.barbar_auto_setup = false
            require('barbar').setup {
                animation = true,
                auto_hide = true,
                tabpages = true,
                clickable = true,
                focus_on_close = 'left',
                highlight_visible = false,
                icons = {
                    buffer_index = false,
                    buffer_number = false,
                    button = '',
                    diagnostics = {
                        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
                        [vim.diagnostic.severity.WARN] = { enabled = true },
                        [vim.diagnostic.severity.INFO] = { enabled = true },
                        [vim.diagnostic.severity.HINT] = { enabled = true },
                    },
                    gitsigns = {
                        added = { enabled = true, icon = '+' },
                        changed = { enabled = true, icon = '~' },
                        deleted = { enabled = true, icon = '-' },
                    },
                    filetype = {
                        custom_colors = true,
                        enabled = true,
                    },
                    -- separator = { left = '▎', right = '' },
                    -- separator = { left = '◺', right = '◿' },
                    -- separator = { left = '《', right = '》' },
                    -- separator = { left = '》', right = '《' },
                    separator = { left = '', right = '' },
                    -- separator = { left = '〔', right = '〕' },
                    separator_at_end = false,
                    modified = { button = '●' },
                    pinned = { button = '', filename = true },
                    preset = 'default',
                    alternate = { filetype = { enabled = true } },
                    current = { buffer_index = false },
                    inactive = { button = '×' },
                    visible = { modified = { buffer_number = false } },
                },
                insert_at_end = false,
                insert_at_start = false,
                maximum_padding = 1,
                minimum_padding = 1,
                maximum_length = 30,
                minimum_length = 0,
                semantic_letters = true,
                letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
                no_name_title = nil,
            }
        end
    },
}
