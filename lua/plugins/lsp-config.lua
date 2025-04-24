local on_attach = function(_, bufnr)
  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
              telemetry = {
                enable = false,
              },
              library = {
                "${3rd}/love2d/library",
              },
            },
            diagnostics = {
              disable = { "lowercase-global", "param-type-mismatch" },
            },
          },
        },
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.html.setup({
        capabilities = capabilities,
      })

      lspconfig.volar.setup({
        capabilities = capabilities,
        init_options = {
          typescript = {
            tsdk = "/Users/Bence/AppData/Local/nvim-data/mason/packages/vue-language-server/node_modules/typescript/lib",
          },
        },
      })

      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = { "css", "html", "javascript", "javascriptreact", "sass", "scss", "typescriptreact" },
        init_options = {
          html = {
            options = {
-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
              ["bem.enabled"] = true,
            },
          },
        }
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

    end,
  },
}
