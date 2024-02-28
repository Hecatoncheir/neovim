return {
    {
        {
            'akinsho/toggleterm.nvim',
            version = "*",
            config = function()
                require("toggleterm").setup({
                    direction = 'vertical',
                    size = function(term)
                        if term.direction == "horizontal" then
                            return 15
                        elseif term.direction == "vertical" then
                            return vim.o.columns * 0.4
                        end
                    end,
                })

                vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', '<M-1>', [[<Cmd>ToggleTerminal<CR>]], opts)
            end,
        }
    }
}
