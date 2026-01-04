return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({
        transparent = true,
        on_colors = function (colors)
          colors.bg = colors.cyan
        end
      })
      vim.cmd.colorscheme("solarized-osaka")
    end,
  },
}
