return {
  {
    "echasnovski/mini.files",
    version = false,
    config = function()
      require("mini.files").setup()
      vim.keymap.set("n", "<leader>e", function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end, { desc = "Files: explorer" })
    end,
  },
}
