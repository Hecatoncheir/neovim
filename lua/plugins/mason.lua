return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            },
            ensure_installed = {
                "prettierd",
            },
            -- ensure_installed = {
            --     "prettierd",
            --     -- markdown
            --     "marksman",
            --     -- yaml
            --     "yaml-language-server",
            --     "yamlfix",
            --     "yamlfmt",
            --     "yamllint",
            --     --json
            --     "json-lsp",
            --     "json-to-struct",
            --     "jsonld-lsp",
            --     "jsonlint",
            --     "fixjson",
            --     "jq",
            --     -- lua
            --     "stylua",
            --     "lua-language-server",
            --     -- html
            --     "css-lsp",
            --     "html-lsp",
            --     -- langs
            --     "trivy",
            --     "prettier",
            --     -- c
            --     "clang-format",
            --     "clangd",
            --     -- js
            --     "deno",
            --     "typescript-language-server",
            --     -- go
            --     -- "go-debug-adapter",
            --     -- "gofumpt",
            --     -- "goimports",
            --     -- "goimports-reviser",
            --     -- "golangci-lint",
            --     -- "golangci-lint-langserver",
            --     -- "golines",
            --     -- "gomodifytags",
            --     -- "gospel",
            --     -- "gospel",
            --     -- "gotests",
            --     -- "gotestsum",
            --     -- "golangci-lint-langserver",
            --     -- proto
            --     "buf-language-server",
            --     "protolint",
            --     "buf",
            -- },
        },
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require("mason").setup(opts)
        end
    },
}
