return {
  {
    {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v2.x",
      lazy = true,
      config = function()
        -- This is where you modify the settings for lsp-zero
        -- Note: autocompletion settings will not take effect

        require("lsp-zero.settings").preset({})
      end,
    },

    -- Autocompletion
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        { "L3MON4D3/LuaSnip" },
      },
      config = function()
        -- Here is where you configure the autocompletion settings.
        -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
        -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

        require("lsp-zero.cmp").extend()

        -- And you can configure cmp even more, if you want to.
        local cmp = require("cmp")

        cmp.setup({
          mapping = {
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
            ["<tab>"] = vim.NIL,
            ["<S-tab>"] = vim.NIL,
          },
        })
      end,
    },

    -- LSP
    {
      "neovim/nvim-lspconfig",
      cmd = "LspInfo",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "williamboman/mason-lspconfig.nvim" },
        {
          "williamboman/mason.nvim",
          build = function()
            pcall(vim.cmd, "MasonUpdate")
          end,
        },
        { "jose-elias-alvarez/null-ls.nvim" },
      },
      config = function()
        -- This is where all the LSP shenanigans will live
        local lsp = require("lsp-zero")
        lsp.set_sign_icons = {
          error = "E",
          warn = "W",
          hint = "H",
          info = "I",
        }

        lsp.on_attach(function(_, bufnr)
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

        -- (Optional) Configure lua language server for neovim
        require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

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
  },

  -- lspconfig
  --{
  --  "VonHeikemen/lsp-zero.nvim",
  --  branch = "v2.x",
  --  lazy = true,
  --  dependencies = {
  --    -- LSP Support
  --    { "neovim/nvim-lspconfig" },
  --    {
  --      -- Optional
  --      "williamboman/mason.nvim",
  --      build = function()
  --        pcall(vim.cmd, "MasonUpdate")
  --      end,
  --    },
  --    -- optional
  --    { "williamboman/mason-lspconfig.nvim" },

  --    -- Autocompletion
  --    { "hrsh7th/nvim-cmp" },
  --    { "hrsh7th/cmp-nvim-lsp" },
  --    { "L3MON4D3/LuaSnip" },

  --    -- LSP Support
  --    { "neovim/nvim-lspconfig" },
  --    { "williamboman/mason.nvim" },
  --    { "williamboman/mason-lspconfig.nvim" },

  --    -- null-ls
  --    { "jose-elias-alvarez/null-ls.nvim" },

  --    -- ltex_extra
  --    {
  --      "barreiroleo/ltex_extra.nvim",
  --      dependencies = { "neovim/nvim-lspconfig" },
  --    },
  --  },
  --  config = function()
  --    local lsp = require("lsp-zero")
  --    lsp.preset("recommended")
  --    lsp.ensure_installed({
  --      "intelephense",
  --    })
  --    lsp.nvim_workspace()

  --    local cmp = require("cmp")
  --    lsp.defaults.cmp_mappings({
  --      ["<C-p>"] = cmp.mapping.select_prev_item({
  --        behavior = cmp.SelectBehavior.Select,
  --      }),
  --      ["<C-n>"] = cmp.mapping.select_next_item({
  --        behavior = cmp.SelectBehavior.Select,
  --      }),
  --      ["<C-y>"] = cmp.mapping.confirm({
  --        select = true,
  --      }),
  --      ["<C-Space>"] = cmp.mapping.complete(),
  --      ["<tab>"] = vim.NIL,
  --      ["<S-tab>"] = vim.NIL,
  --    })

  --    lsp.set_preferences({
  --      suggest_lsp_servers = false,
  --      sign_icons = {
  --        error = "E",
  --        warn = "W",
  --        hint = "H",
  --        info = "I",
  --      },
  --    })

  --    lsp.on_attach(function(_, bufnr)
  --      local opts = { buffer = bufnr, remap = false }

  --      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  --      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  --      vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  --      vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  --      vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  --      vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  --      vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  --      vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  --      vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  --      vim.keymap.set("n", "<leader>vh", vim.lsp.buf.signature_help, opts)
  --    end)

  --    lsp.setup()

  --    local nls = require("null-ls")
  --    nls.setup({
  --      save_after_format = false,
  --      sources = {
  --        nls.builtins.formatting.stylua,
  --        nls.builtins.formatting.prettier.with({
  --          only_local = ".prettierrc.json",
  --        }),
  --        nls.builtins.formatting.phpcsfixer.with({
  --          only_local = "vendor/bin",
  --        }),
  --        nls.builtins.diagnostics.ansiblelint.with({
  --          only_local = ".ansible-lint",
  --        }),
  --        nls.builtins.diagnostics.phpstan.with({
  --          only_local = "vendor/bin",
  --        }),
  --      },
  --    })

  --    vim.diagnostic.config({
  --      update_in_insert = false,
  --      virtual_text = true,
  --    })
  --  end,
  --},
}
