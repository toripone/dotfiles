return {
  {
    "b0o/incline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local function set_hl()
        -- Solarized Dark palette
        vim.api.nvim_set_hl(0, "InclineNormal", { fg = "#93a1a1", bg = "#073642" })
        vim.api.nvim_set_hl(0, "InclineNormalNC", { fg = "#657b83", bg = "#002b36" })
        vim.api.nvim_set_hl(0, "InclineModified", { fg = "#b58900", bg = "#073642" })
        vim.api.nvim_set_hl(0, "InclineModifiedNC", { fg = "#b58900", bg = "#002b36" })
      end

      set_hl()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("InclineHighlights", { clear = true }),
        callback = set_hl,
      })

      require("incline").setup({
        render = function(props)
          local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if name == "" then
            name = "[No Name]"
          end
          local modified = vim.bo[props.buf].modified
          return {
            name,
            modified and { " ●", group = props.focused and "InclineModified" or "InclineModifiedNC" } or "",
          }
        end,
      })
    end,
  },
}
