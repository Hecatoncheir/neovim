return {
    {
        "akinsho/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim",
        },
        config = function()
            require("flutter-tools").setup({
                lsp = {
                    color = {
                        enabled = true,
                        background = true,
                        foreground = false,
                        virtual_text = true,
                        virtual_text_str = "■",
                    },
                    settings = {
                        showTodos = true,
                    },
                },
                decorations = {
                    statusline = {
                        app_version = true,
                        device = true,
                        project_config = true,
                    }
                },
                root_patterns = { ".git", "pubspec.yaml" },
            })
        end,
    },
    {
        'akinsho/pubspec-assist.nvim',
        requires = 'plenary.nvim',
        config = function()
            require('pubspec-assist').setup({})
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "dart",
            },
            indent = {
                enable = true,
                disable = {
                    "dart",
                },
            },
        }
    },
    {
        "williamboman/mason.nvim",
        opts = {

            ensure_installed = {
                "ast-grep",
                "dart-debug-adapter",
            },
        }
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            {
                "sidlatau/neotest-dart",
            },
        },
        opts = {
            adapters = {
                ["neotest-dart"] = {
                    command = 'flutter',
                    use_lsp = true,
                    custom_test_method_names = {},
                }
            },

        }
    }
}
