return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- markdown
        "marksman",
        -- yaml
        "yaml-language-server",
        "yamlfix",
        "yamlfmt",
        "yamllint",
        --json
        "json-lsp",
        "json-to-struct",
        "jsonld-lsp",
        "jsonlint",
        "fixjson",
        "jq",
        -- lua
        "stylua",
        "lua-language-server",
        -- html
        "css-lsp",
        "html-lsp",
        -- langs
        "trivy",
        "prettier",
        -- c
        "clang-format",
        "clangd",
        -- js
        "deno",
        "typescript-language-server",
        -- dart
        "ast-grep",
        "dart-debug-adapter",
        -- go
        "go-debug-adapter",
        "gofumpt",
        "goimports",
        "goimports-reviser",
        "golangci-lint",
        "golangci-lint-langserver",
        "golines",
        "gomodifytags",
        "gospel",
        "gospel",
        "gotests",
        "gotestsum",
        "golangci-lint-langserver",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      require("mason-lspconfig").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "dart",
          "go",
          "rust",
          "css",
          "scss",
          "http",
          "gitignore",
          "html",
        },
        indent = {
          enable = true,
          disable = {
            "dart",
          },
        },
      })
    end,
  },
}
