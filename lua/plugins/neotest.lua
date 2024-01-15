return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "akinsho/flutter-tools.nvim",
      "sidlatau/neotest-dart",
      "nvim-treesitter/nvim-treesitter",
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
