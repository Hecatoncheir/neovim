return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local highlight = {
                "CursorColumn",
                "Whitespace",
            }

            require("ibl").setup({
                indent = {
                    highlight = { "CursorColumn" },
                    char = "",
                },
                whitespace = {
                    highlight = { "CursorColumn" },
                    remove_blankline_trail = true,
                },
                scope = { enabled = true },
            })
        end
    }
}
