vim.api.nvim_create_autocmd('VimEnter', {
    callback = function(ev)
        vim.cmd("set cursorline")
        -- vim.cmd("set cursorcolumn")
    end,
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('LspConfig', {}),
    callback = function(ev)
        -- vim.cmd("hi IlluminatedWordText guibg = #a89984 guifg = #3c3836")
        -- vim.cmd("hi IlluminatedWordRead guibg = #a89984 guifg = #3c3836")
        -- vim.cmd("hi IlluminatedWordWrite guibg = #a89984 guifg = #3c3836")

        vim.keymap.set('n', '<Bslash><C-h><Space>', vim.diagnostic.open_float, opts)

        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<S-enter>', vim.lsp.buf.hover, opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        -- vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<M-enter>', vim.lsp.buf.code_action, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts,
            { desc = "Format" })
    end,
})



-- vim.api.nvim_create_autocmd('VimEnter', {
--     callback = function(ev)
--         -- vim.cmd("hi IlluminatedWordText guibg = #a89984 guifg = #3c3836")
--         -- vim.cmd("hi IlluminatedWordRead guibg = #a89984 guifg = #3c3836")
--         -- vim.cmd("hi IlluminatedWordWrite guibg = #a89984 guifg = #3c3836")
--     end,
-- })

-- vim.api.nvim_create_autocmd('BufEnter', {
--     callback = function(ev)
--         -- vim.cmd("hi IlluminatedWordText guibg = #a89984 guifg = #3c3836")
--         -- vim.cmd("hi IlluminatedWordRead guibg = #a89984 guifg = #3c3836")
--         -- vim.cmd("hi IlluminatedWordWrite guibg = #a89984 guifg = #3c3836")
--     end,
-- })
