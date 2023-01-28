return {
  -- lspconfig
  {
    "VonHeikemen/lsp-zero.nvim",
    event = "InsertEnter",
    branch = "v1.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },

      -- null-ls
      { "jose-elias-alvarez/null-ls.nvim" },
    },
    config = function()
      local lsp = require("lsp-zero")
      lsp.preset("recommended")
      lsp.ensure_installed({
        "sumneko_lua",
        "intelephense",
      })
      lsp.nvim_workspace()

      local cmp = require("cmp")
      lsp.defaults.cmp_mappings({
        ["<C-p>"] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Select,
        }),
        ["<C-n>"] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Select,
        }),
        ["<C-y>"] = cmp.mapping.confirm({
          select = true,
        }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<tab>"] = vim.NILd,
        ["<S-tab>"] = vim.NIL,
      })

      lsp.set_preferences({
        sign_icons = {
          error = "E",
          warn = "W",
          hint = "H",
          info = "I",
        },
      })

      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>vh", vim.lsp.buf.signature_help, opts)
      end)

      lsp.setup()

      local nls = require("null-ls")
      nls.setup({
        save_after_format = false,

        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.prettier.with({
            only_local = ".prettierrc.json",
          }),
          nls.builtins.formatting.phpcsfixer.with({
            only_local = "vendor/bin",
          }),
          nls.builtins.diagnostics.ansiblelint.with({
            only_local = ".ansible-lint",
          }),
          nls.builtins.diagnostics.phpstan.with({
            only_local = "vendor/bin",
          }),
        },
      })

      vim.diagnostic.config({
        update_in_insert = false,
        virtual_text = true,
      })
    end,
  },
}
