return {

    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-nvim-lsp' },
    -- { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'f3fora/cmp-spell' },


    {
        'hrsh7th/nvim-cmp',
        config = function()
            local lspkind = require('lspkind');
            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            local cmp = require('cmp')
            cmp.setup({
                lsp_cfg = {
                    capabilities = capabilities,
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    -- ['<Tab>'] = cmp.mapping.confirm({ select = false }),
                    ['<c-j>'] = cmp.mapping.select_next_item(),
                    ['<c-k>'] = cmp.mapping.select_prev_item(),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" })
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    -- {
                    --     name = 'spell',
                    --     option = {
                    --         keep_all_entries = false,
                    --         enable_in_context = function()
                    --             return true
                    --         end,
                    --     },
                    -- },
                }, {
                    -- { name = 'buffer' }, // TODO: turn off in terminal buffer
                    { name = 'nvim_lsp_signature_help' }
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol_text',
                        maxwidth = 50,
                        ellipsis_char = '...',
                        show_labelDetails = true,
                        before = function(entry, vim_item)
                            return vim_item
                        end
                    })
                }
            })
        end
    },

    { "nvim-neotest/nvim-nio" },

    {
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup({
                library = {
                    enabled = true,
                    runtime = true,
                    types = true,
                    plugins = { "nvim-dap-ui", "neotest" },
                },
                setup_jsonls = true,
                override = function(root_dir, options) end,
                lspconfig = true,
                pathStrict = true,
            })
        end
    },

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require('luasnip').setup()
        end
    },
}
