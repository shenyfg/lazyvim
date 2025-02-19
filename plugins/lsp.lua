return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          init_options = {
            settings = {
              lint = {
                enable = false,
              },
            },
          },
        },
        -- pyright = {
        --   capabilities = {
        --     textDocument = {
        --       publishDiagnostics = {
        --         tagSupport = {
        --           valueSet = { 2 },
        --         },
        --       },
        --     },
        --   },
        -- mason = false,
        -- autostart = false,
        -- },
      },
      document_highlight = {
        enabled = false, -- Disable highlight the same words
      },
      inlay_hints = { enabled = false },
    },
  },
}
