return {
    {
        "nyngwang/murmur.lua",
        config = function()
            require('murmur').setup {
                cursor_rgb = {
                    guibg = '#a89984',
                    guifg = '#3c3836',
                },
                max_len = 80,
                min_len = 3,
                exclude_filetypes = {},
                callbacks = {}
            }
        end
    }
}
