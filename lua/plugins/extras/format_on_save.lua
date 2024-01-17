return {
  "elentok/format-on-save.nvim",
  config = function()
    local formatters = require("format-on-save.formatters")
    require('format-on-save').setup({
        fallback_formatter = {
            formatters.remove_trailing_whitespace,
            formatters.remove_trailing_newlines,
            -- formatters.prettierd,
            formatters.lsp({})
        },
    })
  end,
}


