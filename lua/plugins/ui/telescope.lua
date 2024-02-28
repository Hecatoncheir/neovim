return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup {
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        vertical = {
                            prompt_position = "top",
                        },
                        horizontal = {
                            prompt_position = "top",
                            -- width = { padding = 0 },
                            -- height = { padding = 0 },
                            -- preview_width = 0.5,
                        },
                    },
                    sorting_strategy = "ascending",
                    mappings = {
                        i = {
                            ["<C-h>"] = "which_key"
                        }
                    }
                },
                pickers = {},
                extensions = {}
            }
        end
    },

}
