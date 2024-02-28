return {
    {
        'echasnovski/mini.nvim',
        version = '*',
        config = function()
            require('mini.animate').setup({
                cursor = { enable = true },
                scroll = { enable = false },
            })
            require('mini.indentscope').setup()
        end
    },
}
