return {
    {
        'neovim/nvim-lspconfig',
        opts = {
            servers = {
                ltex = {
                    settings = {
                        cmd = { "ltex-ls" },
                        filetypes = { "markdown", "text" },
                        flags = { debounce_text_changes = 300 },
                    },
                },
            }
        },
    },

}
