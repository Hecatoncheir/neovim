return {
    {
        'ellisonleao/gruvbox.nvim',
        config = function()
            require('gruvbox').setup({
                terminal_colors = true,
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true,
                contrast = "",
                palette_overrides = {},
                dim_inactive = false,
                transparent_mode = false,
                overrides = {
                    ["BufferCurrent"] = { bg = "#7c6f64" },
                    ["BufferCurrentMod"] = { bg = "#7c6f64", fg = "#282828" },
                    ["BufferCurrentINFO"] = { bg = "#7c6f64" },
                    ["BufferCurrentHINT"] = { bg = "#7c6f64" },
                    ["BufferCurrentWARN"] = { bg = "#7c6f64" },
                    ["BufferCurrentERROR"] = { bg = "#7c6f64" },
                    ["BufferCurrentADDED"] = { bg = "#7c6f64" },
                    ["BufferCurrentCHANGED"] = { bg = "#7c6f64" },
                    ["BufferCurrentDELETED"] = { bg = "#7c6f64" },
                    ["NeotestPassed"] = { fg = "#b8bb26" },
                    ["NeotestFailed"] = { fg = "#fb4934" },
                    ["NeotestRunning"] = { fg = "#d3869b" },
                    ["NeotestSkipped"] = { fg = "#fabd2f" },
                    ["NeotestFile"] = { fg = "#83a598" },
                    ["NeotestDir"] = { fg = "#83a598" },
                    ["NeotestNamespace"] = { fg = "#83a598" },
                    ["NeotestFocused"] = { fg = "#fe8019" },
                    ["NeotestIndent"] = { fg = "#83a598" },
                    ["NeotestExpandMarker"] = { fg = "#83a598" },
                    ["NeotestAdapterName"] = { fg = "#83a598" },
                    ["NeotestWinSelect"] = { fg = "#fbf1c7" },
                    ["NeotestMarked"] = { fg = "#665c54" },
                    ["NeotestTarget"] = { fg = "#a89984" },
                    ["NeotestTest"] = { fg = "#d5c4a1" },
                }
            })
        end
    },
    {
        'zaldih/themery.nvim',
        config = function()
            require("themery").setup({
                themes = {
                    {
                        name = "Gruvbox dark",
                        colorscheme = "gruvbox",
                        before = [[
                          vim.opt.background = "dark"
                        ]],
                    },
                    {
                        name = "Gruvbox light",
                        colorscheme = "gruvbox",
                        before = [[
                          vim.opt.background = "light"
                        ]],
                    }
                },
                livePreview = true,
            })
        end
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({
                default = true,
                strict = true,
            })
        end
    },
}
