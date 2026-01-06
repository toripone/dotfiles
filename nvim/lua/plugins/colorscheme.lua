return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({
        transparent = false,
        styles = {
          comments = { italic = false },
          keywords = { italic = false }
        },
        on_highlights = function(hl, _)
          hl.Visual = { bg = "#586e75"}
        end,
        on_colors = function (colors)
          colors.bg = colors.base02
        end
      })
      vim.cmd.colorscheme("solarized-osaka")
    end,
  },
}
