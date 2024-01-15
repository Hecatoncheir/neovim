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
        },
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
}
