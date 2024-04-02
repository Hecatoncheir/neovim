return {
    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
        config = function()
            require("hlchunk").setup({
                chunk = {
                    enable = true,
                    notify = true,
                    use_treesitter = true,
                    -- details about support_filetypes and exclude_filetypes in https://github.com/shellRaining/hlchunk.nvim/blob/main/lua/hlchunk/utils/filetype.lua
                    -- support_filetypes = ft.support_filetypes,
                    -- exclude_filetypes = ft.exclude_filetypes,
                    chars = {
                        horizontal_line = "─",
                        vertical_line = "│",
                        left_top = "╭",
                        left_bottom = "╰",
                        right_arrow = ">",
                    },
                    style = {
                        { fg = "#fabd2f" },
                        { fg = "#c21f30" }, -- this fg is used to highlight wrong chunk
                    },
                    textobject = "",
                    max_file_size = 1024 * 1024,
                    error_sign = true,
                },

                indent = {
                    enable = false,
                    use_treesitter = false,
                    chars = {
                        "│",
                    },
                    style = {
                        { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") }
                    },
                },

                line_num = {
                    enable = true,
                    use_treesitter = true,
                    style = "#fabd2f",
                },

                blank = {
                    enable = false,
                    chars = {
                        "․",
                    },
                    style = {
                        vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
                    },
                },
            })
        end
    },
}
