return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "sidlatau/neotest-dart",
      "akinsho/flutter-tools.nvim",
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-dart")({
          command = "flutter",
          use_lsp = true,
          -- custom_test_method_names = { "" },
        })
      )
    end,
  },
}
