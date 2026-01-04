return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
      })

      local gs = require("gitsigns")
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { desc = desc })
      end

      map("n", "]h", gs.next_hunk, "Git: next hunk")
      map("n", "[h", gs.prev_hunk, "Git: prev hunk")
      map("n", "<leader>hs", gs.stage_hunk, "Git: stage hunk")
      map("n", "<leader>hr", gs.reset_hunk, "Git: reset hunk")
      map("n", "<leader>hb", gs.toggle_current_line_blame, "Git: toggle blame")
    end,
  },
}
