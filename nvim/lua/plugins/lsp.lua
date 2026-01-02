return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "folke/lazydev.nvim", ft = "lua", opts = {} },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        automatic_enable = true,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.server_capabilities then
            client.server_capabilities.semanticTokensProvider = nil
          end

          local bufnr = args.buf
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          map("n", "gd", vim.lsp.buf.definition, "LSP: definition")
          map("n", "gD", vim.lsp.buf.declaration, "LSP: declaration")
          map("n", "gi", vim.lsp.buf.implementation, "LSP: implementation")
          map("n", "gr", vim.lsp.buf.references, "LSP: references")
          map("n", "K", vim.lsp.buf.hover, "LSP: hover")
          map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: rename")
          map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP: code action")
          map("n", "<leader>ds", vim.diagnostic.open_float, "Diag: float")
          map("n", "[d", vim.diagnostic.goto_prev, "Diag: prev")
          map("n", "]d", vim.diagnostic.goto_next, "Diag: next")

        end,
      })

      vim.diagnostic.config({
        virtual_text = { spacing = 2, prefix = ">" },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "󰌵",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })
    end,
  },
}
