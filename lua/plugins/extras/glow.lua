return {
  "ellisonleao/glow.nvim",
  config = function()
    require("glow").setup({
      highlighter = {
        style = "dark",
        width = 120,
      },
    })
  end,
}
