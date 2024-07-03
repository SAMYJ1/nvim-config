return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "mono",
      -- transparent = true,
      on_highlights = function(hl, colors)
        hl.LineNrAbove = {
          fg = colors.dark3,
        }
        hl.LineNrBelow = {
          fg = colors.dark3,
        }
      end,
    },
  },
}
