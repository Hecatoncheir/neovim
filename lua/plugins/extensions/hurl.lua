return {
    {
        'ethancarlsson/nvim-hurl.nvim',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "hurl" },
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                }
            }
        end
    }
    -- {
    --     "pfeiferj/nvim-hurl",
    --     config = function()
    --         require('hurl').setup()
    --         require('nvim-treesitter.configs').setup {
    --             ensure_installed = { "hurl" },
    --             highlight = {
    --                 enable = true
    --             },
    --             indent = {
    --                 enable = true
    --             }
    --         }
    --     end
    -- }
}
