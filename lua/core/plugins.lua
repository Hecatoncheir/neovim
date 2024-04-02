local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- Base
        { import = "plugins.theme" },
        { import = "plugins.mason" },
        { import = "plugins.treesitter" },
        { import = "plugins.lsp" },
        { import = "plugins.cmp" },
        { import = "plugins.formatter" },
        { import = "plugins.terminal" },
        -- Languages
        { import = "plugins.languages.lua" },
        { import = "plugins.languages.markdown" },
        { import = "plugins.languages.ltex" },
        { import = "plugins.languages.yaml" },
        { import = "plugins.languages.json" },
        { import = "plugins.languages.dart" },
        { import = "plugins.languages.go" },
        { import = "plugins.languages.rust" },
        -- UI
        { import = "plugins.ui.workspace" },
        { import = "plugins.ui.editor" },
        { import = "plugins.ui.explorer" },
        { import = "plugins.ui.git" },
        { import = "plugins.ui.problems" },
        { import = "plugins.ui.tests" },
        { import = "plugins.ui.debug" },
        { import = "plugins.ui.telescope" },
        { import = "plugins.ui.brackets_highlighter" },
        { import = "plugins.ui.hlchunk" },
        { import = "plugins.ui.colors" },
        -- Extensions
        { import = "plugins.extensions.ruscmd" },
        { import = "plugins.extensions.dashboard" },
        { import = "plugins.extensions.illuminate" },
        { import = "plugins.extensions.barbecue" },
        { import = "plugins.extensions.scrollbar" },
        -- { import = "plugins.extensions.cokeline" },
        { import = "plugins.extensions.barbar" },
        -- { import = "plugins.extensions.bufferline" },
        { import = "plugins.extensions.noice" },
        { import = "plugins.extensions.lualine" },
        -- { import = "plugins.extensions.rest" },
        { import = "plugins.extensions.persistance" },
        -- { import = "plugins.extensions.outline" },
        { import = "plugins.extensions.diffview" },
        { import = "plugins.extensions.inc_rename" },
        -- { import = "plugins.extensions.mini" },
        { import = "plugins.extensions.aerial" },
        { import = "plugins.extensions.hurl" },
        { import = "plugins.extensions.murmur" },
        -- { import = "plugins.extensions.twillight" },
        { import = "plugins.extensions.context" },
        { import = "plugins.extensions.dim" },
        { import = "plugins.extensions.quickscope" },
        -- { import = "plugins.extensions.neodim" },
        -- { import = "plugins.extensions.ibl" },
        -- { import = "plugins.extensions.peek" },
    },
})
