return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      hidden = true,
      ignore = true,
      exclude = {
        "node_modules"
      },
      sources = {
        files = {
          hidden = true,
          ignore = true,
        }
      }
    },
  },
  keys = {
    {
      "ff",
      function() require("snacks").picker.files() end,
      desc = "Find files",
    },
    {
      "fb",
      function() require("snacks").picker.buffers() end,
      desc = "Find files",
    },
    {
      "fg",
      function ()
        require("snacks").picker.grep()
      end,
    }
  },
}
