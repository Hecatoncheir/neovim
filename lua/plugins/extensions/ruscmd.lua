return {
    {
        "aveplen/ruscmd.nvim",
        config = function()
            require('ruscmd').setup {}
            local function map(lhs, rhs)
                vim.api.nvim_set_keymap('', lhs, rhs, { silent = false, unique = false })
            end
            map('.', '.')
            map('ю', '.')
        end
    }
}
